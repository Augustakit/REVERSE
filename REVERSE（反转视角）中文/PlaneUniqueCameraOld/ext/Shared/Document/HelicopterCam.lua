local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/Helicopterconfig')

--修改AH1Z
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/AH1Z/AH1Z')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyAH1ZCamera(vehicleBlueprint)
end)
function ModifyAH1ZCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[5])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4]) --1CB888EE-F85D-42C8-B126-703EB7EAF2B9
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = AH1Z_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true
 chasecamera.targetOffset = AH1Z_TARGET_OFFECT
 chasecamera.wantedDistance = AH1Z_WantDistance

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = AH1Z_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--修改Mi-28
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/Mi28/Mi28')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
	ModifyMi28Camera(vehicleBlueprint)
end)
function ModifyMi28Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local vehicleComponent = VehicleComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(vehicleComponent.components[3])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4]) --89BEA216-2FF4-11DE-8C23-DAB1D69416DE
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = Mi28_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true
 chasecamera.targetOffset = Mi28_TARGET_OFFECT
 chasecamera.wantedDistance = Mi28_WantDistance

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = Mi28_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end





--修改AH6
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/AH6/AH6_Littlebird')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyAH6Camera(vehicleBlueprint)
end)
function ModifyAH6Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[3])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4]) --15AB2B36-FF4E-11DD-A7B1-F7C6DEEC9D32
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = AH6_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true
 chasecamera.targetOffset = AH6_TARGET_OFFECT
 chasecamera.wantedDistance = AH6_WantDistance

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = AH6_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--修改Z11-W
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/Z11W/Z-11w')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyZ11WCamera(vehicleBlueprint)
end)
function ModifyZ11WCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[3])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4]) --D780B023-38B7-11DE-BF1C-984D9AEE762C
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = Z11W_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true
 chasecamera.targetOffset = Z11W_TARGET_OFFECT
 chasecamera.wantedDistance = Z11W_WantDistance

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = Z11W_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--修改UH-1Y VENOM 毒液运直
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/Venom/Venom')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyVenomCamera(vehicleBlueprint)
end)
function ModifyVenomCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[5])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[6])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = Venom_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.targetOffset = Venom_TARGET_OFFECT
 chasecamera.wantedDistance = Venom_WantDistance

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = Venom_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--修改KA-60杀人鲸
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/KA-60_Kasatka/KA-60_Kasatka')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyKA60Camera(vehicleBlueprint)
end)
function ModifyKA60Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[4])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[6])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = KA60_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = true
 chasecamera.targetOffset = KA60_TARGET_OFFECT
 chasecamera.wantedDistance = KA60_WantDistance

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = KA60_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 playerEntryComponent.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



