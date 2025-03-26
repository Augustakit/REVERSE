local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/TransportConfig')


--GROWLER(HumveeModified) US
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/GrowlerITV/GrowlerITV')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyGROWLERCamera(vehicleBlueprint)
end)
function ModifyGROWLERCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(chassisComponent.components[3])

 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = GROWLER_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false
 chasecamera.targetOffset = GROWLER_TARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = GROWLER_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--VDV RU
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/VDV_Buggy/VDV_Buggy')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyVDVCamera(vehicleBlueprint)
end)
function ModifyVDVCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(chassisComponent.components[3])

 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = VDV_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false
 chasecamera.targetOffset = VDV_TARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = VDV_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--RHIB    FBED1CAF-1FC4-4E39-83DD-07ED11292707
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/RHIB/RHIB')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyRHIBCamera(vehicleBlueprint)
end)
function ModifyRHIBCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(chassisComponent.components[4])

 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = RHIB_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = RHIB_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--DPV 2CC96002-048C-44BB-A8A0-3D996B172AE2
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XPack01/DPV/DPV')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyDPVCamera(vehicleBlueprint)
end)
function ModifyDPVCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(chassisComponent.components[11])

 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = DPV_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false
 chasecamera.targetOffset = DPV_TARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = DPV_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end







--修改QuadBike
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP3/QuadBike/QuadBike')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyQuadBikeCamera(vehicleBlueprint)
end)
function ModifyQuadBikeCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])

 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[1])
 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[2])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = QuadBike_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.targetOffset = QuadBike_TARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = QuadBike_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--RHIB_XP3    
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/RHIB/RHIB_XP3')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
	ModifyRHIBXP3Camera(vehicleBlueprint)
end)
function ModifyRHIBXP3Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(chassisComponent.components[4])

 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = RHIBXP3_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = RHIBXP3_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--PHOENIX(HumveeModified) US
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP4/HumveeModified/HumveeModified')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
	ModifyPHOENIXCamera(vehicleBlueprint)
end)
function ModifyPHOENIXCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(chassisComponent.components[4])

 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = PHOENIX_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false
 chasecamera.targetOffset = PHOENIX_TARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = PHOENIX_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--BARSUK(VodnikModified) RU载具，游戏内不显示名字
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP4/VodnikModified/VodnikModified_V2')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
	ModifyBARSUKCamera(vehicleBlueprint)
end)
function ModifyBARSUKCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(chassisComponent.components[3])

 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = BARSUK_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false
 chasecamera.targetOffset = BARSUK_TARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = BARSUK_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--KLR650
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP5/KLR650/KLR650')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
	ModifyKLR650Camera(vehicleBlueprint)
end)
function ModifyKLR650Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[5])
 local partComponent1  = PartComponentData(playerEntryComponent.components[5])
 local partComponent2  = PartComponentData(partComponent1.components[1])
 partComponent2:MakeWritable()

 local chaseCameraComponent = CameraComponentData(partComponent2.components[1])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = KLR650_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false
 chasecamera.targetOffset = KLR650_TARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = KLR650_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 partComponent2.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end
