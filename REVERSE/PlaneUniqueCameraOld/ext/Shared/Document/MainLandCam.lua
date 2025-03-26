local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/MainLandconfig')


--modify M1A2
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/M1A2/M1Abrams')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

	ModifyM1A2Camera(vehicleBlueprint)
end)
function ModifyM1A2Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local vehicleComponent = VehicleComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(vehicleComponent.components[5])
 local childComponent2  = ChildComponentData(childComponent1.components[2])

--Add crosshairs to the gunner.

 local partComponent  = PartComponentData(childComponent1.components[3])
 local childComponent3  = ChildComponentData(partComponent.components[2])
 local childComponent4  = ChildComponentData(childComponent3.components[1])

 local gunnerCameraComponent = CameraComponentData(childComponent4.components[3])
 gunnerCameraComponent:MakeWritable()
 gunnerCameraComponent.transform = M1A2_GunnerCAMERA_TRANSFORM

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[6])

 local or4Entity1 = Or4EntityData(vehicleEntity.components[10])
 local or4Entity2 = or4Entity1:Clone()
 vehicleEntity.components:add(or4Entity2)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In1' )

 childComponent2:MakeWritable()
 local chaseCameraComponent = CameraComponentData(childComponent2.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = M1A2_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In2' )
  vehicleBlueprint.propertyConnections:erase(23)

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
 gunnerchasecamera:MakeWritable()
 gunnerchasecamera.shouldRollWithTarget = false
 gunnerchasecamera.targetOffset = M1A2_GunnerTARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = M1A2_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    or4Entity2, 'Out',
    crosshairLogicObject, '3pCrosshair' )
 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--modify T90  7A948176-DD7D-11DD-A030-B04E425BA11E  4F498B24-766F-4FE8-859D-DC8361412A22
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/T90/T90')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

	ModifyT90Camera(vehicleBlueprint)
end)
function ModifyT90Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(chassisComponent.components[4])
 local childComponent2  = ChildComponentData(childComponent1.components[2])

--Add crosshairs to the gunner.

 local partComponent  = PartComponentData(childComponent1.components[3])
 local childComponent3  = ChildComponentData(partComponent.components[2])
 local childComponent4  = ChildComponentData(childComponent3.components[1])

 local gunnerCameraComponent = CameraComponentData(childComponent4.components[3])
 gunnerCameraComponent:MakeWritable()
 gunnerCameraComponent.transform = T90_GunnerCAMERA_TRANSFORM

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[5])

 local or4Entity1 = Or4EntityData(vehicleEntity.components[10])
 local or4Entity2 = or4Entity1:Clone()
 vehicleEntity.components:add(or4Entity2)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In1' )

 childComponent2:MakeWritable()
 local chaseCameraComponent = CameraComponentData(childComponent2.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = T90_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In2' )
vehicleBlueprint.propertyConnections:erase(24)

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
 gunnerchasecamera:MakeWritable()
 gunnerchasecamera.shouldRollWithTarget = false
 gunnerchasecamera.targetOffset = T90_GunnerTARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = T90_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    or4Entity2, 'Out',
    crosshairLogicObject, '3pCrosshair' )
 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end








--modify LAV-25
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/LAV25/LAV25')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

	ModifyLAV25Camera(vehicleBlueprint)
end)
function ModifyLAV25Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(chassisComponent.components[3])
 local childComponent2  = ChildComponentData(childComponent1.components[2])
 childComponent2:MakeWritable()

--Add crosshairs to the gunner.

 local partComponent  = PartComponentData(childComponent1.components[3])
 local childComponent3  = ChildComponentData(partComponent.components[2])
 local childComponent4  = ChildComponentData(childComponent3.components[1])

 local gunnerCameraComponent = CameraComponentData(childComponent4.components[3])
 gunnerCameraComponent:MakeWritable()
 gunnerCameraComponent.transform = LAV25_GunnerCAMERA_TRANSFORM

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[3])

 local or4Entity1 = Or4EntityData(vehicleEntity.components[4])
 local or4Entity2 = or4Entity1:Clone()
 vehicleEntity.components:add(or4Entity2)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In1' )

 local chaseCameraComponent = CameraComponentData(childComponent2.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = LAV25_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In2' )
  vehicleBlueprint.propertyConnections:erase(54)

 local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
 gunnerchasecamera:MakeWritable()
 gunnerchasecamera.shouldRollWithTarget = false
 gunnerchasecamera.targetOffset = LAV25_GunnerTARGET_OFFECT

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = LAV25_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    or4Entity2, 'Out',
    crosshairLogicObject, '3pCrosshair' )
 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

end



--modify BMP2  
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/BMP2/BMP2')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

	ModifyBMP2Camera(vehicleBlueprint)
end)
function ModifyBMP2Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local vehicleComponent = VehicleComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(vehicleComponent.components[3])
 local childComponent2  = ChildComponentData(childComponent1.components[5])

--Add crosshairs to the gunner.

 local partComponent  = PartComponentData(childComponent1.components[9])
 local childComponent3  = ChildComponentData(partComponent.components[2])
 local childComponent4  = ChildComponentData(childComponent3.components[1])

 local gunnerCameraComponent = CameraComponentData(childComponent4.components[3])
 gunnerCameraComponent:MakeWritable()
 gunnerCameraComponent.transform = BMP2_GunnerCAMERA_TRANSFORM

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[10])

 local or4Entity1 = Or4EntityData(vehicleEntity.components[3])
 local or4Entity2 = or4Entity1:Clone()
 vehicleEntity.components:add(or4Entity2)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In1' )

 childComponent2:MakeWritable()
 local chaseCameraComponent = CameraComponentData(childComponent2.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = BMP2_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In2' )
vehicleBlueprint.propertyConnections:erase(27)

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
 gunnerchasecamera:MakeWritable()
 gunnerchasecamera.shouldRollWithTarget = false
 gunnerchasecamera.targetOffset = BMP2_GunnerTARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = BMP2_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    or4Entity2, 'Out',
    crosshairLogicObject, '3pCrosshair' )
 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--modify BTR-90
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XPack01/BTR-90/BTR90')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

	ModifyBTR90Camera(vehicleBlueprint)
end)
function ModifyBTR90Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(chassisComponent.components[4])
 local childComponent2  = ChildComponentData(childComponent1.components[5])

--Add crosshairs to the gunner.

 local partComponent  = PartComponentData(childComponent1.components[7])
 local childComponent3  = ChildComponentData(partComponent.components[1])
 local childComponent4  = ChildComponentData(childComponent3.components[1])

 local gunnerCameraComponent = CameraComponentData(childComponent4.components[3])
 gunnerCameraComponent:MakeWritable()
 gunnerCameraComponent.transform = BTR90_GunnerCAMERA_TRANSFORM

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[15])

 local or4Entity1 = Or4EntityData(vehicleEntity.components[3])
 local or4Entity2 = or4Entity1:Clone()
 vehicleEntity.components:add(or4Entity2)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In1' )

 childComponent2:MakeWritable()
 local chaseCameraComponent = CameraComponentData(childComponent2.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = BTR90_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In2' )
vehicleBlueprint.propertyConnections:erase(62)

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
 gunnerchasecamera:MakeWritable()
 gunnerchasecamera.shouldRollWithTarget = false
 gunnerchasecamera.targetOffset = BTR90_GunnerTARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = BTR90_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    or4Entity2, 'Out',
    crosshairLogicObject, '3pCrosshair' )
 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--modify LAV-25
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP5/LAV_Paradrop/LAV25_Paradrop')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
	ModifyLAV25XP5Camera(vehicleBlueprint)
end)
function ModifyLAV25XP5Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(chassisComponent.components[5])
 local childComponent2  = ChildComponentData(childComponent1.components[2])
 childComponent2:MakeWritable()

--Add crosshairs to the gunner.

 local partComponent  = PartComponentData(childComponent1.components[3])
 local childComponent3  = ChildComponentData(partComponent.components[2])
 local childComponent4  = ChildComponentData(childComponent3.components[1])

 local gunnerCameraComponent = CameraComponentData(childComponent4.components[3])
 gunnerCameraComponent:MakeWritable()
 gunnerCameraComponent.transform = LAV25XP5_GunnerCAMERA_TRANSFORM

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[3])

 local or4Entity1 = Or4EntityData(vehicleEntity.components[4])
 local or4Entity2 = or4Entity1:Clone()
 vehicleEntity.components:add(or4Entity2)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In1' )

 local chaseCameraComponent = CameraComponentData(childComponent2.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = LAV25XP5_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In2' )
  vehicleBlueprint.propertyConnections:erase(54)

 local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
 gunnerchasecamera:MakeWritable()
 gunnerchasecamera.shouldRollWithTarget = false
 gunnerchasecamera.targetOffset = LAV25XP5_GunnerTARGET_OFFECT

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = LAV25XP5_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    or4Entity2, 'Out',
    crosshairLogicObject, '3pCrosshair' )
 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--modify BMP2  
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP5/BMP2_Paradrop/BMP2_Paradrop')

  if not dataContainer then  --Check if the resources are valid
    return  --Return when the resource does not exist to avoid subsequent code execution
  end

  ---Return when the resource does not exist to avoid subsequent code execution
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
	ModifyBMP2XP5Camera(vehicleBlueprint)
end)
function ModifyBMP2XP5Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local vehicleComponent = VehicleComponentData(vehicleEntity.components[1])
 local childComponent1  = ChildComponentData(vehicleComponent.components[5])
 local childComponent2  = ChildComponentData(childComponent1.components[5])

--Add crosshairs to the gunner.

 local partComponent  = PartComponentData(childComponent1.components[9])
 local childComponent3  = ChildComponentData(partComponent.components[2])
 local childComponent4  = ChildComponentData(childComponent3.components[1])

 local gunnerCameraComponent = CameraComponentData(childComponent4.components[3])
 gunnerCameraComponent:MakeWritable()
 gunnerCameraComponent.transform = BMP2XP5_GunnerCAMERA_TRANSFORM

 local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[10])

 local or4Entity1 = Or4EntityData(vehicleEntity.components[3])
 local or4Entity2 = or4Entity1:Clone()
 vehicleEntity.components:add(or4Entity2)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In1' )

 childComponent2:MakeWritable()
 local chaseCameraComponent = CameraComponentData(childComponent2.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = BMP2XP5_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 chaseCameraComponent, 'ActiveForLocalPlayer',
  or4Entity2, 'In2' )
vehicleBlueprint.propertyConnections:erase(27)

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
 gunnerchasecamera:MakeWritable()
 gunnerchasecamera.targetOffset = BMP2XP5_GunnerTARGET_OFFECT

 local rearCameraComponent = CameraComponentData()
 rearCameraComponent.fieldOfView = 45
 rearCameraComponent.camera = chasecamera:Clone()
 rearCameraComponent.transform = BMP2XP5_RESERVE_CAMERA
 rearCameraComponent.forceFieldOfView = -1
 rearCameraComponent.isFirstPerson = false
 childComponent2.components:add(rearCameraComponent)

  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    or4Entity2, 'Out',
    crosshairLogicObject, '3pCrosshair' )
 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end
