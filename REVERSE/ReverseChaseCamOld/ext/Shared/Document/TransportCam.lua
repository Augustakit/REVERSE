local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/TransportConfig')

--GROWLER(HumveeModified) US
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/GrowlerITV/GrowlerITV')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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
 transformSelector.in2 = GROWLER_RESERVE_CAMERA
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

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--VDV RU
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/VDV_Buggy/VDV_Buggy')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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
 transformSelector.in2 = VDV_RESERVE_CAMERA
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

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--RHIB    FBED1CAF-1FC4-4E39-83DD-07ED11292707
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/RHIB/RHIB')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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
 transformSelector.in2 = RHIB_RESERVE_CAMERA
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

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--DPV 2CC96002-048C-44BB-A8A0-3D996B172AE2
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XPack01/DPV/DPV')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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
 transformSelector.in2 = DPV_RESERVE_CAMERA
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

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end




--modify QuadBike
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP3/QuadBike/QuadBike')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(2)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 65    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = QuadBike_RESERVE_CAMERA
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

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end

--RHIB_XP3    
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/RHIB/RHIB_XP3')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
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
 transformSelector.in2 = RHIBXP3_RESERVE_CAMERA
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

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end






--PHOENIX(HumveeModified) US
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP4/HumveeModified/HumveeModified')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
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

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(3)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 65    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = PHOENIX_RESERVE_CAMERA
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

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


--BARSUK(VodnikModified) RU载具，游戏内不显示名字
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP4/VodnikModified/VodnikModified_V2')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
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
 transformSelector.in2 = BARSUK_RESERVE_CAMERA
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

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end





--KLR650
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP5/KLR650/KLR650')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
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

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)
 partComponent2.components:add(parentPartComponent)
 partComponent2.components:erase(1)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 65    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = KLR650_RESERVE_CAMERA
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

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end


