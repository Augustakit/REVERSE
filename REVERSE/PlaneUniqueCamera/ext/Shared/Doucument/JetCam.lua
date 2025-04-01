local ConnectionHelper = require('__shared/ConnectionHelper')

local VEHICLE_CONFIG = require('__shared/Config/JetConfig')

Events:Subscribe('Level:RegisterEntityResources', function()
  for _, config in pairs(VEHICLE_CONFIG) do
    local partition = ResourceManager:FindDatabasePartition(config.PARTITION_GUID)
    if partition ~= nil then
      local vehicleBlueprint = VehicleBlueprint(partition.primaryInstance)
      ModifyJetBlueprint(vehicleBlueprint, config)
    end
  end
end)

function ModifyJetBlueprint(vehicleBlueprint, config)
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
  chasecamera.targetOffset = config.TARGET_OFFSET

  -- Get camera parent by GUID
  local parentResource = ResourceManager:SearchForInstanceByGuid(chaseCamConfig.CAMERA_PARENT_GUID)
  if not parentResource then
    print('Parent component not found:', chaseCamConfig.CAMERA_PARENT_GUID)
    return
  end
  local parentComponent = ComponentData(parentResource)
  parentComponent:MakeWritable()
  print('Successful acquisition of parent component:', parentComponent)

  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[config.CROSSHAIR_LOGIC_INDEX])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  chaseCameraComponent, 'ActiveForLocalPlayer',
    crosshairLogicObject, '3pCrosshair' )

  vehicleBlueprint.propertyConnections:erase(config.CROSSHAIR_ERASE_INDEX)

  local rearCameraComponent = CameraComponentData()
  rearCameraComponent.fieldOfView = 45
  rearCameraComponent.camera = chasecamera:Clone()
  rearCameraComponent.transform = config.REVERSED_TRANSFORM
  rearCameraComponent.forceFieldOfView = -1
  rearCameraComponent.isFirstPerson = false
  parentComponent.components:add(rearCameraComponent)

  -- Finally use the output of the AND-gate to enable the crosshair
  local reverseLogicObject = LogicReferenceObjectData(vehicleEntity.components[config.REVERSE_CROSSHAIR_LOGIC_INDEX])

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  rearCameraComponent, 'ActiveForLocalPlayer',
  reverseLogicObject, '3p' )
 
  print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--modify F35
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XPack01/F35/F35B')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
	ModifyF35Camera(vehicleBlueprint)
end)
function ModifyF35Camera(vehicleBlueprint)
  -- Prepare the relevant instances for modification
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[2])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = F35_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true

 local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
 local crosshairLogicObject = LogicReferenceObjectData()
 crosshairLogicObject.blueprint = logicPrefaBlueprint
 vehicleEntity.components:add(crosshairLogicObject)
ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )
 vehicleBlueprint.propertyConnections:erase(112)

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = F35_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 local reverseLogicObject = LogicReferenceObjectData(vehicleEntity.components[51])

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 rearCameraComponent, 'ActiveForLocalPlayer',
  reverseLogicObject, '3p' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end
