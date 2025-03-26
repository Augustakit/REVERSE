local ConnectionHelper = require('__shared/ConnectionHelper')

local VEHICLE_CONFIG = require('__shared/Config/SpecialConfig')


Events:Subscribe('Level:RegisterEntityResources', function()
  for _, config in pairs(VEHICLE_CONFIG) do
    local partition = ResourceManager:FindDatabasePartition(config.PARTITION_GUID)
    if partition ~= nil then
      ModifySpecialBlueprint(partition.primaryInstance, config)
    end
  end
end)

function SplitLast(arr)
  local last = arr[#arr]
  table.remove(arr, #arr)
  return arr, last
end

function GetNestedComponent(component, indexes)
  for _, index in ipairs(indexes) do
    -- in each interation of the loop, 'component' gets replaced with one of it's nested components
    component = ComponentData(component.components[index])
  end
  return component
end

function ModifySpecialBlueprint(instance, config)
  -- Prepare the relevant instances for modification
  local vehicleBlueprint = VehicleBlueprint(instance)
  vehicleBlueprint:MakeWritable()
  local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
  vehicleEntity:MakeWritable()
  local chassisComponent = ChassisComponentData(vehicleEntity.components[1])

  -- These components are layed out differently between vehicle
  local playerEntryComponent  = PlayerEntryComponentData(GetNestedComponent(chassisComponent, config.ENTRY_COMPONENT_PATH))
  playerEntryComponent:MakeWritable()
  -- Get both the parent (path without last index) and the component (last index)
  local parentPath, chaseCameraIndex = SplitLast(config.CHASE_CAM_COMPONENT_PATH)
  local chaseCameraParentComponent = ComponentData(GetNestedComponent(chassisComponent, parentPath))
  chaseCameraParentComponent:MakeWritable()
  local chaseCameraComponent = CameraComponentData(chaseCameraParentComponent.components[chaseCameraIndex])
  chaseCameraComponent:MakeWritable()
  chaseCameraComponent.transform = config.CAMERA_TRANSFORM

  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true
  chasecamera.targetOffset = config.TARGET_OFFSET
  -- The transform of a part component can be set using a propertyConnection
  -- Since CameraComponentData does not inherit from PartComponentData, it's transform cannot.
  -- Create a PartComponentData and nest the CameraComponentData inside.
  local newParentPartComponent = PartComponentData()
  newParentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
  newParentPartComponent.components:add(chaseCameraComponent)

  -- Replace the original camera component with the new parent part component
  chaseCameraParentComponent.components[chaseCameraIndex] = newParentPartComponent

  local partition = vehicleBlueprint.partition
  local gunnerCameraComponent = CameraComponentData(partition:FindInstance(config.Gunner_GUID))
  gunnerCameraComponent:MakeWritable()
  gunnerCameraComponent.transform = config.GunnerCAMERA_TRANSFORM

  local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
  gunnerchasecamera:MakeWritable()
  gunnerchasecamera.shouldRollWithTarget = false
  gunnerchasecamera.targetOffset = config.GunnerTARGET_OFFSET
  -- The default chase camera does not have an alternate view (right click view)
  -- Define an altenate view and assign it to the chase camera
  local alternateView = AlternateCameraViewData()
  alternateView.toggleViewChange = false
  alternateView.fieldOfView = config.AlTERNATEVIEW    -- same as regularView.fieldOfView
  chaseCameraComponent.alternateView = alternateView
  chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

  -- A TransformSelectorEntity will output one of 2 defined transforms through a property connection.
  -- Assign a reversed transform to the non-default property
  -- This will flip the camera around the origin of the vehicle.
  -- The offset is already defined by the original chase cam
  local transformSelector = TransformSelectorEntityData()
  transformSelector.in2 = config.REVERSED_TRANSFORM
  transformSelector.realm = Realm.Realm_Client
  transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
  vehicleEntity.components:add(transformSelector)
  -- This output is true while alternate view is enabled (RMB is held)
  -- This connection sets the 'Selection' property for the TransformSelectorEntity
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    chaseCameraComponent, 'AlternateViewEnabledOut',
    transformSelector, 'Selection' )
  -- The TransformSelectorEntity will output 1 of it's 2 LinearTransforms depending on the `Selection` property
  -- This connection sets the 'Transform' property of the PartComponent that holds CameraComponent
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    transformSelector, 'Out',
    newParentPartComponent, 'Transform' )

  -- Enable the crosshair for the chase camera
  
  -- Use a NotEntity to flip the AlternateViewEnabledOut boolean
  -- This will output true while not looking back (including when in the menu, on foot etc)
  local notEntity = NotEntityData()
  notEntity.realm = Realm.Realm_Client
  notEntity.isPropertyConnectionTarget = Realm.Realm_Client
  vehicleEntity.components:add(notEntity)
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    chaseCameraComponent, 'AlternateViewEnabledOut',
    notEntity, 'In' )   -- Id is irrelevant

  -- Use an AndEntity to enable crosshair when using the chase cam AND not looking back
  local andEntity = AndEntityData()
  andEntity.realm = Realm.Realm_Client
  andEntity.isPropertyConnectionTarget = Realm.Realm_Client
  vehicleEntity.components:add(andEntity)
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    chaseCameraComponent, 'ActiveForLocalPlayer',
    andEntity, 'In1' )
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    notEntity, 'Out',
    andEntity, 'In2' )

  -- Finally use the output of the AND-gate to enable the crosshair
  local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
  local crosshairLogicObject = LogicReferenceObjectData()
  crosshairLogicObject.blueprint = logicPrefaBlueprint
  vehicleEntity.components:add(crosshairLogicObject)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  gunnerCameraComponent, 'ActiveForLocalPlayer',
    crosshairLogicObject, '3pCrosshair' )

   print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end
