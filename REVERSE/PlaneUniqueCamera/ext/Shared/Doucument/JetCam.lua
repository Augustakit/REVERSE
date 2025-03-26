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
  chaseCameraParentComponent.components:add(rearCameraComponent)

  -- Finally use the output of the AND-gate to enable the crosshair
  local reverseLogicObject = LogicReferenceObjectData(vehicleEntity.components[config.REVERSE_CROSSHAIR_LOGIC_INDEX])

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  rearCameraComponent, 'ActiveForLocalPlayer',
  reverseLogicObject, '3p' )
 
  print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--修改F35
Events:Subscribe('Level:RegisterEntityResources', function()
	ModifyF35Camera()
	print('F35 3P Camera')
end)

function ModifyF35Camera()
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

end
