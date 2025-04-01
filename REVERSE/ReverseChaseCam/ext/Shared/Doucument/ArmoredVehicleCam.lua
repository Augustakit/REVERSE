local ConnectionHelper = require('__shared/ConnectionHelper')

local VEHICLE_CONFIG = require('__shared/Config/ArmoredVehicleConfig')

Events:Subscribe('Level:RegisterEntityResources', function()
  for _, config in pairs(VEHICLE_CONFIG) do
    local partition = ResourceManager:FindDatabasePartition(config.PARTITION_GUID)
    if partition ~= nil then
      local vehicleBlueprint = VehicleBlueprint(partition.primaryInstance)
      ModifyArmoredVehicleBlueprint(vehicleBlueprint, config)
    end
  end
end)


function ModifyArmoredVehicleBlueprint(vehicleBlueprint, config)
  vehicleBlueprint:MakeWritable()
  print('Modifying blueprint vehicle:', vehicleBlueprint.name)

  local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
  vehicleEntity:MakeWritable()

  -- Getting the configuration of a camera component
  local chaseCamConfig = config.CHASE_CAM_CONFIG
  if not chaseCamConfig then
    print('Failed to find the chase camera configuration!')
    return
  end

  -- Getting Camera Components by GUID
  local cameraResource = ResourceManager:SearchForInstanceByGuid(chaseCamConfig.CAMERA_GUID)
  if not cameraResource then
    print('Camera component not found:', chaseCamConfig.CAMERA_GUID)
    return
  end
  local chaseCameraComponent = CameraComponentData(cameraResource)
  chaseCameraComponent:MakeWritable()
  chaseCameraComponent.transform = config.CAMERA_TRANSFORM

  print('Successfully obtained camera component:', chaseCameraComponent)

  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true

  -- Get camera parent by GUID
  local parentResource = ResourceManager:SearchForInstanceByGuid(chaseCamConfig.CAMERA_PARENT_GUID)
  if not parentResource then
    print('Parent component not found:', chaseCamConfig.CAMERA_PARENT_GUID)
    return
  end
  local parentComponent = ComponentData(parentResource)
  parentComponent:MakeWritable()
  print('Successful acquisition of parent component:', parentComponent)


  -- Create a new parent part component and embed the camera component in it
  local newParentPartComponent = PartComponentData()
  newParentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client
  newParentPartComponent.components:add(chaseCameraComponent)

  -- Replace the camera component in the parent component with the new parent part component
  parentComponent.components[config.CHASECAMERA_INDEX] = newParentPartComponent

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

  vehicleBlueprint.propertyConnections:erase(config.CROSSHAIR_ERASE_INDEX)

  -- Finally use the output of the AND-gate to enable the crosshair
  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[config.CROSSHAIR_LOGIC_INDEX])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end