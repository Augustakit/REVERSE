
local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/Jetconfig')


--修改F18
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/F18-F/F18')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

  ModifyF18Camera(vehicleBlueprint)
end)
function ModifyF18Camera(vehicleBlueprint)
  -- Prepare the relevant instances for modification
  vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[2])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[3]) --18C8BE39-0026-4FDC-AA74-2D96767E312C
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = F18_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[48])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )
 vehicleBlueprint.propertyConnections:erase(113)

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = F18_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 local reverseLogicObject = LogicReferenceObjectData(vehicleEntity.components[58])

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 rearCameraComponent, 'ActiveForLocalPlayer',
  reverseLogicObject, '3p' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/SU-35BM-E/SU-35BM-E')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

  ModifySU35Camera(vehicleBlueprint)
end)

function ModifySU35Camera(vehicleBlueprint)
  -- Prepare the relevant instances for modification
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[2])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4]) --74F2DCD8-AA04-4E02-BFE1-B4BB9BBE417E
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = SU35_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[44])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )
 vehicleBlueprint.propertyConnections:erase(96)

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = SU35_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 local reverseLogicObject = LogicReferenceObjectData(vehicleEntity.components[53])

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 rearCameraComponent, 'ActiveForLocalPlayer',
  reverseLogicObject, '3p' )

  vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
  print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--修改F18（XP5）
Events:Subscribe('Level:RegisterEntityResources', function()
  -- 获取资源
  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/F18-F/F18_SpawnInAir')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
  ModifyF18AirCamera(vehicleBlueprint)
end)
--修改F18
function ModifyF18AirCamera(vehicleBlueprint)
  -- Prepare the relevant instances for modification
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[2])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[3]) --7B5B48D3-1A70-469A-A191-C1BEAAA9795A
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = F18Air_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[42])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )
 vehicleBlueprint.propertyConnections:erase(111)

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = F18Air_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 local reverseLogicObject = LogicReferenceObjectData(vehicleEntity.components[52])

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 rearCameraComponent, 'ActiveForLocalPlayer',
  reverseLogicObject, '3p' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--修改SU35
Events:Subscribe('Level:RegisterEntityResources', function()
  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/SU-35BM-E/SU-35BM-E_SpawnInAir')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
  ModifySU35AirCamera(vehicleBlueprint)
end)
function ModifySU35AirCamera(vehicleBlueprint)
  -- Prepare the relevant instances for modification
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[2])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4]) --361000DA-6A5E-40DB-8F9B-6DE468C422C4
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = SU35Air_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[38])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )
 vehicleBlueprint.propertyConnections:erase(96)

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = SU35Air_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 local reverseLogicObject = LogicReferenceObjectData(vehicleEntity.components[47])

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 rearCameraComponent, 'ActiveForLocalPlayer',
  reverseLogicObject, '3p' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--修改F35
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XPack01/F35/F35B')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
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






--修改A10
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/A-10_THUNDERBOLT/A10_THUNDERBOLT')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
  ModifyA10Camera(vehicleBlueprint)
end)
function ModifyA10Camera(vehicleBlueprint)
  -- Prepare the relevant instances for modification
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[2])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4]) --D035CB54-9C4D-4371-AF6A-327731076041
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = A10_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[39])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )
 vehicleBlueprint.propertyConnections:erase(90)

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = A10_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 local reverseLogicObject = LogicReferenceObjectData(vehicleEntity.components[49])

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 rearCameraComponent, 'ActiveForLocalPlayer',
  reverseLogicObject, '3p' )

  vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
  print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--修改SU25
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/SU-25TM/SU-25TM')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

  ModifySU25Camera(vehicleBlueprint)
end)
function ModifySU25Camera(vehicleBlueprint)
  -- Prepare the relevant instances for modification
  vehicleBlueprint:MakeWritable()
  local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
  vehicleEntity:MakeWritable()
  local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
  local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[2])
  playerEntryComponent:MakeWritable()
  local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4]) --EE56D773-BD30-472F-99E5-AD8733747777
  chaseCameraComponent:MakeWritable()
  chaseCameraComponent.transform = SU25_CAMERA_TRANSFORM
  chaseCameraComponent.fieldOfView = 45
  chaseCameraComponent.forceFieldOfView = -1
 
  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true
 
  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[41])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  chaseCameraComponent, 'ActiveForLocalPlayer',
    crosshairLogicObject, '3pCrosshair' )
  vehicleBlueprint.propertyConnections:erase(88)
 
  local rearCameraComponent = CameraComponentData()
  rearCameraComponent.fieldOfView = 45
  rearCameraComponent.camera = chasecamera:Clone()
  rearCameraComponent.transform = SU25_RESERVE_CAMERA
  rearCameraComponent.forceFieldOfView = -1
  rearCameraComponent.isFirstPerson = false
  playerEntryComponent.components:add(rearCameraComponent)
 
  local reverseLogicObject = LogicReferenceObjectData(vehicleEntity.components[49])
 
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  rearCameraComponent, 'ActiveForLocalPlayer',
   reverseLogicObject, '3p' )
 
  vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
  print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end
 