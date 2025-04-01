local ConnectionHelper = require('__shared/ConnectionHelper')

local VEHICLE_CONFIG = require('__shared/Config/SpecialConfig')

Events:Subscribe('Level:RegisterEntityResources', function()
  for _, config in pairs(VEHICLE_CONFIG) do
    local partition = ResourceManager:FindDatabasePartition(config.PARTITION_GUID)
    if partition ~= nil then
      local vehicleBlueprint = VehicleBlueprint(partition.primaryInstance)
      ModifySpecialBlueprint(vehicleBlueprint, config)
    end
  end
end)

function ModifySpecialBlueprint(vehicleBlueprint, config)
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

  local partition = vehicleBlueprint.partition
  local gunnerCameraComponent = CameraComponentData(partition:FindInstance(config.Gunner_GUID))
  gunnerCameraComponent:MakeWritable()
  gunnerCameraComponent.transform = config.GunnerCAMERA_TRANSFORM

  local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
  gunnerchasecamera:MakeWritable()
  gunnerchasecamera.shouldRollWithTarget = false
  gunnerchasecamera.targetOffset = config.GunnerTARGET_OFFSET

  local rearCameraComponent = CameraComponentData()
  rearCameraComponent.fieldOfView = 45
  rearCameraComponent.camera = chasecamera:Clone()
  rearCameraComponent.transform = config.REVERSED_TRANSFORM
  rearCameraComponent.forceFieldOfView = -1
  rearCameraComponent.isFirstPerson = false
  parentComponent.components:add(rearCameraComponent)

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