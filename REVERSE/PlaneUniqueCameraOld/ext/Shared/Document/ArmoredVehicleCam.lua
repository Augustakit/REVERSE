local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/ArmoredVehicleConfig')

--modify LAV-AD
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/LAV25/LAV_AD')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
	ModifyLAVADCamera(vehicleBlueprint)
end)
function ModifyLAVADCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(chassisComponent.components[3])
 local childComponent2  = ChildComponentData(childComponent1.components[2])
 childComponent2:MakeWritable()

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[4])

 local chaseCameraComponent = CameraComponentData(childComponent2.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = LAVAD_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = LAVAD_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--modify Tunguska  
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/9K22_Tunguska_M/9K22_Tunguska_M')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

	ModifyTunguskaCamera(vehicleBlueprint)
end)
function ModifyTunguskaCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(chassisComponent.components[4])
 local childComponent2  = ChildComponentData(childComponent1.components[4])

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[10])

 childComponent2:MakeWritable()
 local chaseCameraComponent = CameraComponentData(childComponent2.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = Tunguska_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = Tunguska_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--modify M1128
Events:Subscribe('Level:RegisterEntityResources', function()

local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP3/M1128-Stryker/M1128-Stryker')

if not dataContainer then  --Check if the resources are valid
  return  --Return when the resource does not exist to avoid subsequent code execution
end

---Return when the resource does not exist to avoid subsequent code execution
local vehicleBlueprint = VehicleBlueprint(dataContainer)
-- Your subsequent code (such as modifying the vehicle's camera, etc.)

ModifyM1128Camera(vehicleBlueprint)
end)
function ModifyM1128Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(chassisComponent.components[4])
 local childComponent2  = ChildComponentData(childComponent1.components[2])
 childComponent2:MakeWritable()

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[11])

 local chaseCameraComponent = CameraComponentData(childComponent2.components[5])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = M1128_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = M1128_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--modify SPRUT  
Events:Subscribe('Level:RegisterEntityResources', function()

local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP3/2S25-SPRUT-SD/2S25_SPRUT-SD')

if not dataContainer then  --Check if the resources are valid
  return  --Return when the resource does not exist to avoid subsequent code execution
end

---Return when the resource does not exist to avoid subsequent code execution
local vehicleBlueprint = VehicleBlueprint(dataContainer)
-- Your subsequent code (such as modifying the vehicle's camera, etc.)

ModifySPRUTCamera(vehicleBlueprint)
end)
function ModifySPRUTCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(chassisComponent.components[3])
 local childComponent2  = ChildComponentData(childComponent1.components[6])

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[22])

 childComponent2:MakeWritable()
 local chaseCameraComponent = CameraComponentData(childComponent2.components[2])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = SPRUT_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = SPRUT_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end
