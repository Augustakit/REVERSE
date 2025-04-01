local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/ArmoredVehicleConfig')


--modify LAV-AD
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/LAV25/LAV_AD')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
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

 local chaseCameraComponent = CameraComponentData(childComponent2.components[3])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = LAVAD_CAMERA_TRANSFORM
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
 transformSelector.in2 = LAVAD_RESERVE_CAMERA
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

  vehicleBlueprint.propertyConnections:erase(41)

  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[4])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  andEntity, 'Out',
  crosshairLogicObject, '3pCrosshair' )
 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--modify Tunguska  
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/9K22_Tunguska_M/9K22_Tunguska_M')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
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


 childComponent2:MakeWritable()
 local chaseCameraComponent = CameraComponentData(childComponent2.components[4])
 chaseCameraComponent:MakeWritable()
 chaseCameraComponent.transform = Tunguska_CAMERA_TRANSFORM
 chaseCameraComponent.fieldOfView = 45
 chaseCameraComponent.forceFieldOfView = -1

 local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
 chasecamera:MakeWritable()

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 childComponent2.components:add(parentPartComponent)
 childComponent2.components:erase(4)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 55    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = Tunguska_RESERVE_CAMERA
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

  vehicleBlueprint.propertyConnections:erase(41)

  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[10])
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  andEntity, 'Out',
  crosshairLogicObject, '3pCrosshair' )

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--modify M1128
Events:Subscribe('Level:RegisterEntityResources', function()

local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP3/M1128-Stryker/M1128-Stryker')

if not dataContainer then  --Check if the resources are valid
  return  --Check if the resources are valid
end

--If the resources are available, continue with subsequent operations
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

local chaseCameraComponent = CameraComponentData(childComponent2.components[5])
chaseCameraComponent:MakeWritable()
chaseCameraComponent.transform = M1128_CAMERA_TRANSFORM
chaseCameraComponent.fieldOfView = 45
chaseCameraComponent.forceFieldOfView = -1

local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
chasecamera:MakeWritable()

local parentPartComponent = PartComponentData()
parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
parentPartComponent.components:add(chaseCameraComponent)

childComponent2.components:add(parentPartComponent)
childComponent2.components:erase(5)

local alternateView = AlternateCameraViewData()
alternateView.toggleViewChange = false
alternateView.fieldOfView = 55    -- same as regularView.fieldOfView
chaseCameraComponent.alternateView = alternateView
chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

local transformSelector = TransformSelectorEntityData()
transformSelector.in2 = M1128_RESERVE_CAMERA
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

vehicleBlueprint.propertyConnections:erase(25)

local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[11])
ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
andEntity, 'Out',
crosshairLogicObject, '3pCrosshair' )
vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end



--modify SPRUT  
Events:Subscribe('Level:RegisterEntityResources', function()

local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XP3/2S25-SPRUT-SD/2S25_SPRUT-SD')

if not dataContainer then  --Check if the resources are valid
  return  --Check if the resources are valid
end

--If the resources are available, continue with subsequent operations
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

childComponent2:MakeWritable()
local chaseCameraComponent = CameraComponentData(childComponent2.components[2])
chaseCameraComponent:MakeWritable()
chaseCameraComponent.transform = SPRUT_CAMERA_TRANSFORM
chaseCameraComponent.fieldOfView = 45
chaseCameraComponent.forceFieldOfView = -1

local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
chasecamera:MakeWritable()

local parentPartComponent = PartComponentData()
parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
parentPartComponent.components:add(chaseCameraComponent)

childComponent2.components:add(parentPartComponent)
childComponent2.components:erase(2)

local alternateView = AlternateCameraViewData()
alternateView.toggleViewChange = false
alternateView.fieldOfView = 55    -- same as regularView.fieldOfView
chaseCameraComponent.alternateView = alternateView
chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

local transformSelector = TransformSelectorEntityData()
transformSelector.in2 = SPRUT_RESERVE_CAMERA
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

vehicleBlueprint.propertyConnections:erase(67)

local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[22])
ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
andEntity, 'Out',
crosshairLogicObject, '3pCrosshair' )
vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

print('Modified Chase Camera for ' .. vehicleBlueprint.name)
end
