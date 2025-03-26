local ConnectionHelper = require('__shared/ConnectionHelper')

local VEHICLE_CONFIG = require('__shared/Config/MainLandConfig')


Events:Subscribe('Level:RegisterEntityResources', function()
  for _, config in pairs(VEHICLE_CONFIG) do
    local partition = ResourceManager:FindDatabasePartition(config.PARTITION_GUID)
    if partition ~= nil then
    local vehicleBlueprint = VehicleBlueprint(partition.primaryInstance)
      ModifyLandVehicleBlueprint(vehicleBlueprint, config)
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

function ModifyLandVehicleBlueprint(vehicleBlueprint, config)
  -- Prepare the relevant instances for modification
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
  --chasecamera.shouldRollWithTarget = false

  local partition = vehicleBlueprint.partition
  local gunnerCameraComponent = CameraComponentData(partition:FindInstance(config.Gunner_GUID))
  gunnerCameraComponent:MakeWritable()
  gunnerCameraComponent.transform = config.GunnerCAMERA_TRANSFORM

  local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
  gunnerchasecamera:MakeWritable()
  gunnerchasecamera.shouldRollWithTarget = false
  gunnerchasecamera.targetOffset = config.GunnerTARGET_OFFSET

  local or4Entity1 = Or4EntityData(vehicleEntity.components[config.Or4_ClONE])
  local or4Entity2 = or4Entity1:Clone()
  vehicleEntity.components:add(or4Entity2)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  gunnerCameraComponent, 'ActiveForLocalPlayer',
   or4Entity2, 'In1' )

  vehicleBlueprint.propertyConnections:erase(config.CROSSHAIR_ERASE_INDEX)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'ActiveForLocalPlayer',
   or4Entity2, 'In2' )

  local rearCameraComponent = CameraComponentData()
  rearCameraComponent.fieldOfView = 45
  rearCameraComponent.camera = chasecamera:Clone()
  rearCameraComponent.transform = config.REVERSED_TRANSFORM
  rearCameraComponent.forceFieldOfView = -1
  rearCameraComponent.isFirstPerson = false
  chaseCameraParentComponent.components:add(rearCameraComponent)

  --Finally use the output of the AND-gate to enable the crosshair
  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[config.CROSSHAIR_LOGIC_INDEX])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    or4Entity2, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end