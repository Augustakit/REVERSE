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
  chaseCameraParentComponent.components:add(rearCameraComponent)

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