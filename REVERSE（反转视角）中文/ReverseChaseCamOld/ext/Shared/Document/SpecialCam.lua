local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/SpecialConfig')

--M1114  HumveeArmored 7F75FD36-50A3-452C-BC3A-CB1C3E458FAF
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/HumveeArmored/HumveeArmored')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyM1114Camera(vehicleBlueprint)
end)
function ModifyM1114Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(chassisComponent.components[3])
 playerEntryComponent:MakeWritable()

--给炮手添加准心

local partComponent  = PartComponentData(chassisComponent.components[4])
local childComponent  = ChildComponentData(partComponent.components[2])
local childComponent2  = ChildComponentData(childComponent.components[1])

local gunnerCameraComponent = CameraComponentData(childComponent2.components[3]) --7CDE5896-A2A0-4C7E-9893-8AA252789D81
gunnerCameraComponent:MakeWritable()
gunnerCameraComponent.transform = M1114_GunnerCAMERA_TRANSFORM

local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
gunnerchasecamera:MakeWritable()
gunnerchasecamera.targetOffset = M1114_GunnerTARGET_OFFECT

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = M1114_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false
 chasecamera.targetOffset = M1114_TARGET_OFFECT

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(4)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 65    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = M1114_RESERVE_CAMERA
 transformSelector.realm = Realm.Realm_Client
 transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(transformSelector)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   transformSelector, 'Selection' )

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   transformSelector, 'Out',
   parentPartComponent, 'Transform' )

 local notEntity = NotEntityData()
 notEntity.realm = Realm.Realm_Client
 notEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(notEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   notEntity, 'In' )

 local andEntity = AndEntityData()
 andEntity.realm = Realm.Realm_Client
 andEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(andEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'ActiveForLocalPlayer',
   andEntity, 'In1' )
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   notEntity, 'Out',
   andEntity, 'In2' )

 local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
 local crosshairLogicObject = LogicReferenceObjectData()
 crosshairLogicObject.blueprint = logicPrefaBlueprint
 vehicleEntity.components:add(crosshairLogicObject)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--GAZ-3937_Vodnik   1FC2DA93-9E11-4635-ADDF-B0DA946BC130
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/GAZ-3937_Vodnik/GAZ-3937_Vodnik')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyVodnikCamera(vehicleBlueprint)
end)
function ModifyVodnikCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local vehicleComponent = VehicleComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(vehicleComponent.components[3])
 playerEntryComponent:MakeWritable()

--给炮手添加准心

local partComponent  = PartComponentData(vehicleComponent.components[4])
local childComponent  = ChildComponentData(partComponent.components[2])
local childComponent2  = ChildComponentData(childComponent.components[1])

local gunnerCameraComponent = CameraComponentData(childComponent2.components[3]) --2A96E6CA-8975-4C7F-8032-C57ED7D7627B
gunnerCameraComponent:MakeWritable()
gunnerCameraComponent.transform = GAZ3937_GunnerCAMERA_TRANSFORM

local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
gunnerchasecamera:MakeWritable()
gunnerchasecamera.targetOffset = GAZ3937_GunnerTARGET_OFFECT

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = GAZ3937_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.shouldRollWithTarget = false
 chasecamera.targetOffset = GAZ3937_TARGET_OFFECT

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(4)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 55    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = GAZ3937_RESERVE_CAMERA
 transformSelector.realm = Realm.Realm_Client
 transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(transformSelector)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   transformSelector, 'Selection' )

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   transformSelector, 'Out',
   parentPartComponent, 'Transform' )

 local notEntity = NotEntityData()
 notEntity.realm = Realm.Realm_Client
 notEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(notEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   notEntity, 'In' )

 local andEntity = AndEntityData()
 andEntity.realm = Realm.Realm_Client
 andEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(andEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'ActiveForLocalPlayer',
   andEntity, 'In1' )
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   notEntity, 'Out',
   andEntity, 'In2' )

 local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
 local crosshairLogicObject = LogicReferenceObjectData()
 crosshairLogicObject.blueprint = logicPrefaBlueprint
 vehicleEntity.components:add(crosshairLogicObject)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end





--修改AAV-7A1
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/AAV-7A1/AAV-7A1')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyAAVCamera(vehicleBlueprint)
end)
function ModifyAAVCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[3])
 playerEntryComponent:MakeWritable()
 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4]) --1EF78B88-50DD-42AD-A603-07EF06650823
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = AAV_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.targetOffset = AAV_TARGET_OFFECT
 chasecamera.wantedDistance = 7.0  --7.0
 chasecamera.lookDistanceInFrontOfTarget = 5.0  --5.0

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(4)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 55    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = AAV_RESERVE_CAMERA
 transformSelector.realm = Realm.Realm_Client
 transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(transformSelector)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   transformSelector, 'Selection' )

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   transformSelector, 'Out',
   parentPartComponent, 'Transform' )

 local notEntity = NotEntityData()
 notEntity.realm = Realm.Realm_Client
 notEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(notEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   notEntity, 'In' )

 local andEntity = AndEntityData()
 andEntity.realm = Realm.Realm_Client
 andEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(andEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'ActiveForLocalPlayer',
   andEntity, 'In1' )
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   notEntity, 'Out',
   andEntity, 'In2' )

 local childComponent1  = ChildComponentData(chassisComponent.components[4])
 local childComponent2  = ChildComponentData(childComponent1.components[3])

 local gunnerCameraComponent = CameraComponentData(childComponent2.components[2])
 gunnerCameraComponent:MakeWritable()
 gunnerCameraComponent.transform = AAV_GunnerCAMERA_TRANSFORM

 local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
 gunnerchasecamera:MakeWritable()
 gunnerchasecamera.shouldRollWithTarget = false
 gunnerchasecamera.targetOffset = AAV_GunnerTARGET_OFFECT

 local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
 local crosshairLogicObject = LogicReferenceObjectData()
 crosshairLogicObject.blueprint = logicPrefaBlueprint
 vehicleEntity.components:add(crosshairLogicObject)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end

--修改HIMARS
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP3/HIMARS/HIMARS')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyHIMARSCamera(vehicleBlueprint)
end)
function ModifyHIMARSCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])

 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[3])
 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = HIMARS_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.targetOffset = HIMARS_TARGET_OFFECT

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(3)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 55    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = HIMARS_RESERVE_CAMERA
 transformSelector.realm = Realm.Realm_Client
 transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(transformSelector)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   transformSelector, 'Selection' )

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   transformSelector, 'Out',
   parentPartComponent, 'Transform' )

 local notEntity = NotEntityData()
 notEntity.realm = Realm.Realm_Client
 notEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(notEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   notEntity, 'In' )

 local andEntity = AndEntityData()
 andEntity.realm = Realm.Realm_Client
 andEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(andEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'ActiveForLocalPlayer',
   andEntity, 'In1' )
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   notEntity, 'Out',
   andEntity, 'In2' )

  vehicleBlueprint.propertyConnections:erase(61)

  local orEntity = OrEntityData(vehicleEntity.components[35])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  andEntity, 'Out',
  orEntity, 'In2' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end

--修改BM-23
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP3/STAR_1466/STAR_1466')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
	ModifyBM23Camera(vehicleBlueprint)
end)
function ModifyBM23Camera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])

 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[3])
 playerEntryComponent:MakeWritable()

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[2])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = BM23_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.targetOffset = BM23_TARGET_OFFECT

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(2)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 55    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = BM23_RESERVE_CAMERA
 transformSelector.realm = Realm.Realm_Client
 transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(transformSelector)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   transformSelector, 'Selection' )

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   transformSelector, 'Out',
   parentPartComponent, 'Transform' )

 local notEntity = NotEntityData()
 notEntity.realm = Realm.Realm_Client
 notEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(notEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   notEntity, 'In' )

 local andEntity = AndEntityData()
 andEntity.realm = Realm.Realm_Client
 andEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(andEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'ActiveForLocalPlayer',
   andEntity, 'In1' )
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   notEntity, 'Out',
   andEntity, 'In2' )

  vehicleBlueprint.propertyConnections:erase(56)

  local orEntity = OrEntityData(vehicleEntity.components[28])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  andEntity, 'Out',
  orEntity, 'In2' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--RHINO 
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP4/VanModified/VanModified')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
	ModifyRHINOCamera(vehicleBlueprint)
end)
function ModifyRHINOCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent = PlayerEntryComponentData(chassisComponent.components[5])

 local partComponent  = PartComponentData(playerEntryComponent.components[1])
 local childComponent  = ChildComponentData(partComponent.components[1])
 local childComponent2  = ChildComponentData(childComponent.components[1])

 childComponent2:MakeWritable()

 local chaseCameraComponent = CameraComponentData(childComponent2.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = RHINO_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 childComponent2.components:add(parentPartComponent)
 childComponent2.components:erase(3)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 55    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = RHINO_RESERVE_CAMERA
 transformSelector.realm = Realm.Realm_Client
 transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(transformSelector)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   transformSelector, 'Selection' )

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   transformSelector, 'Out',
   parentPartComponent, 'Transform' )

 local notEntity = NotEntityData()
 notEntity.realm = Realm.Realm_Client
 notEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(notEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   notEntity, 'In' )

 local andEntity = AndEntityData()
 andEntity.realm = Realm.Realm_Client
 andEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(andEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'ActiveForLocalPlayer',
   andEntity, 'In1' )
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   notEntity, 'Out',
   andEntity, 'In2' )

  vehicleBlueprint.propertyConnections:erase(17)
  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[15])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  andEntity, 'Out',
  crosshairLogicObject, '3pCrosshair' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end





--修改ASRAD AE250BD5-0AF7-4E10-8D3F-C3481E29A44E
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP5/Humvee_ASRAD/Humvee_ASRAD')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）

	ModifyASRADCamera(vehicleBlueprint)
end)
function ModifyASRADCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local chassisComponent = ChassisComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(chassisComponent.components[4])
 playerEntryComponent:MakeWritable()

--给炮手添加准心

 local partComponent  = PartComponentData(chassisComponent.components[5])
 local childComponent3  = ChildComponentData(partComponent.components[2])
 local childComponent4  = ChildComponentData(childComponent3.components[2])

 local gunnerCameraComponent = CameraComponentData(childComponent4.components[2]) --44E480F6-1484-4622-9E8C-5F64EE7ED010
 gunnerCameraComponent:MakeWritable()
 gunnerCameraComponent.transform = ASRAD_GunnerCAMERA_TRANSFORM

 local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
 gunnerchasecamera:MakeWritable()
 gunnerchasecamera.targetOffset = ASRAD_GunnerTARGET_OFFECT

 local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = ASRAD_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()
 chasecamera.targetOffset = ASRAD_TARGET_OFFECT

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(4)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 65   -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = ASRAD_RESERVE_CAMERA
 transformSelector.realm = Realm.Realm_Client
 transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(transformSelector)

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   transformSelector, 'Selection' )

 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   transformSelector, 'Out',
   parentPartComponent, 'Transform' )

 local notEntity = NotEntityData()
 notEntity.realm = Realm.Realm_Client
 notEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(notEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'AlternateViewEnabledOut',
   notEntity, 'In' )

 local andEntity = AndEntityData()
 andEntity.realm = Realm.Realm_Client
 andEntity.isPropertyConnectionTarget = Realm.Realm_Client
 vehicleEntity.components:add(andEntity)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   chaseCameraComponent, 'ActiveForLocalPlayer',
   andEntity, 'In1' )
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
   notEntity, 'Out',
   andEntity, 'In2' )

 local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
 local crosshairLogicObject = LogicReferenceObjectData()
 crosshairLogicObject.blueprint = logicPrefaBlueprint
 vehicleEntity.components:add(crosshairLogicObject)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--修改VodnikPhoenix
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP5/VodnikPhoenix/VodnikPhoenix')

  if not dataContainer then  --检查资源是否有效
    return  -- 资源不存在时返回，避免后续代码执行
  end

  -- 如果资源有效，继续后续操作
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- 你的后续代码（例如修改车辆的摄像机等）
	ModifyVodnikPhoenixCamera(vehicleBlueprint)
end)
function ModifyVodnikPhoenixCamera(vehicleBlueprint)
 vehicleBlueprint:MakeWritable()
 local vehicleEntity = VehicleEntityData(vehicleBlueprint.object)
 vehicleEntity:MakeWritable()
 local vehicleComponent = VehicleComponentData(vehicleEntity.components[1])
 local playerEntryComponent  = PlayerEntryComponentData(vehicleComponent.components[4])
 playerEntryComponent:MakeWritable()

--给炮手添加准心

local partComponent  = PartComponentData(vehicleComponent.components[5])
local childComponent3  = ChildComponentData(partComponent.components[2])
local childComponent4  = ChildComponentData(childComponent3.components[1])
local partComponent2  = PartComponentData(childComponent4.components[1])

local gunnerCameraComponent = CameraComponentData(partComponent2.components[2]) --39EA0490-CC35-49BB-AC05-B9864AF0733D
gunnerCameraComponent:MakeWritable()
gunnerCameraComponent.transform = VodnikPhoenix_GunnerCAMERA_TRANSFORM

local gunnerchasecamera = ChaseCameraData(gunnerCameraComponent.camera)
gunnerchasecamera:MakeWritable()
gunnerchasecamera.targetOffset = VodnikPhoenix_GunnerTARGET_OFFECT

local chaseCameraComponent = CameraComponentData(playerEntryComponent.components[4])
chaseCameraComponent:MakeWritable()
chaseCameraComponent.transform = VodnikPhoenix_CAMERA_TRANSFORM
chaseCameraComponent.fieldOfView = 45
chaseCameraComponent.forceFieldOfView = -1

local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
chasecamera:MakeWritable()
chasecamera.targetOffset = VodnikPhoenix_TARGET_OFFECT

local parentPartComponent = PartComponentData()
parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
parentPartComponent.components:add(chaseCameraComponent)

playerEntryComponent.components:add(parentPartComponent)
playerEntryComponent.components:erase(4)

local alternateView = AlternateCameraViewData()
alternateView.toggleViewChange = false
alternateView.fieldOfView = 65   -- same as regularView.fieldOfView
chaseCameraComponent.alternateView = alternateView
chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

local transformSelector = TransformSelectorEntityData()
transformSelector.in2 = VodnikPhoenix_RESERVE_CAMERA
transformSelector.realm = Realm.Realm_Client
transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
vehicleEntity.components:add(transformSelector)

ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  chaseCameraComponent, 'AlternateViewEnabledOut',
  transformSelector, 'Selection' )

ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  transformSelector, 'Out',
  parentPartComponent, 'Transform' )

local notEntity = NotEntityData()
notEntity.realm = Realm.Realm_Client
notEntity.isPropertyConnectionTarget = Realm.Realm_Client
vehicleEntity.components:add(notEntity)
ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  chaseCameraComponent, 'AlternateViewEnabledOut',
  notEntity, 'In' )

local andEntity = AndEntityData()
andEntity.realm = Realm.Realm_Client
andEntity.isPropertyConnectionTarget = Realm.Realm_Client
vehicleEntity.components:add(andEntity)
ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  chaseCameraComponent, 'ActiveForLocalPlayer',
  andEntity, 'In1' )
ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  notEntity, 'Out',
  andEntity, 'In2' )

 local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
 local crosshairLogicObject = LogicReferenceObjectData()
 crosshairLogicObject.blueprint = logicPrefaBlueprint
 vehicleEntity.components:add(crosshairLogicObject)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
 gunnerCameraComponent, 'ActiveForLocalPlayer',
   crosshairLogicObject, '3pCrosshair' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end

