local ConnectionHelper = require('__shared/ConnectionHelper')

local VEHICLE_CONFIG = require('__shared/Config/JetConfig')

Events:Subscribe('Level:RegisterEntityResources', function()
  for _, config in pairs(VEHICLE_CONFIG) do
    local partition = ResourceManager:FindDatabasePartition(config.PARTITION_GUID)
    if partition ~= nil then
      ModifyJetBlueprint(partition.primaryInstance, config)
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

function ModifyJetBlueprint(instance, config)
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
  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[config.CROSSHAIR_LOGIC_INDEX])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )
  
  print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




Events:Subscribe('Level:RegisterEntityResources', function()
	ModifyF35Camera()
	print('F35 3P Camera')
end)
function ModifyF35Camera()
  -- Prepare the relevant instances for modification
  local vehicleBlueprint = VehicleBlueprint(ResourceManager:SearchForDataContainer('Vehicles/XPack01/F35/F35B'))
  vehicleBlueprint:MakeWritable()
  local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
  vehicleEntity:MakeWritable()
  local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
  local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[2])
  playerEntryComponent:MakeWritable()
  local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
  chaseCameraComponent:MakeWritable()
  chaseCameraComponent.transform = F35_CAMERA_TRANSFORM
  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true

  local parentPartComponent = PartComponentData()
  parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
  parentPartComponent.components:add(chaseCameraComponent)

  playerEntryComponent.components:add(parentPartComponent)
  playerEntryComponent.components:erase(4)

  local alternateView = AlternateCameraViewData()
  alternateView.toggleViewChange = false
  alternateView.fieldOfView = 72    -- same as regularView.fieldOfView
  chaseCameraComponent.alternateView = alternateView
  chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

  local transformSelector = TransformSelectorEntityData()
  transformSelector.in2 = F35_RESERVE_CAMERA
  transformSelector.realm = Realm.Realm_Client
  transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
  vehicleEntity.components:add(transformSelector)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    chaseCameraComponent, 'AlternateViewEnabledOut',
    transformSelector, 'Selection' )

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    transformSelector, 'Out',
    parentPartComponent, 'Transform' )

  local notEntity = NotEntityData()
  notEntity.realm = Realm.Realm_Client
  notEntity.isPropertyConnectionTarget = Realm.Realm_Client
  vehicleEntity.components:add(notEntity)
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    chaseCameraComponent, 'AlternateViewEnabledOut',
    notEntity, 'In' )

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

  local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
  local crosshairLogicObject = LogicReferenceObjectData()
  crosshairLogicObject.blueprint = logicPrefaBlueprint
  vehicleEntity.components:add(crosshairLogicObject)
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified F35 Chase Camera')
end



