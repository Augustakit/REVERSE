local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/Jetconfig')

--modify F18
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/F18-F/F18')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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
  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true

  -- The transform of a part component can be set using a propertyConnection
  -- Since CameraComponentData does not inherit from PartComponentData, it's transform cannot.
  -- Create a PartComponentData and nest the CameraComponentData inside.
  local parentPartComponent = PartComponentData()
  parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
  parentPartComponent.components:add(chaseCameraComponent)
  -- Add the new part component to the player entry and remove the original camera component
  playerEntryComponent.components:add(parentPartComponent)
  playerEntryComponent.components:erase(3)

  -- The default chase camera does not have an alternate view (right click view)
  -- Define an altenate view and assign it to the chase camera
  local alternateView = AlternateCameraViewData()
  alternateView.toggleViewChange = false
  alternateView.fieldOfView = 72    -- same as regularView.fieldOfView
  chaseCameraComponent.alternateView = alternateView
  chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

  -- A TransformSelectorEntity will output one of 2 defined transforms through a property connection.
  -- Assign a reversed transform to the non-default property
  -- This will flip the camera around the origin of the vehicle.
  -- The offset is already defined by the original chase cam
  local transformSelector = TransformSelectorEntityData()
  transformSelector.in2 = F18_RESERVE_CAMERA
  transformSelector.realm = Realm.Realm_Client
  transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
  vehicleEntity.components:add(transformSelector)
  -- This output is true while alternate view is enabled (RMB is held)
  -- This connection sets the 'Selection' property for the TransformSelectorEntity
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    chaseCameraComponent, 'AlternateViewEnabledOut',
    transformSelector, 'Selection' )
  -- The TransformSelectorEntity will output 1 of it's 2 LinearTransforms depending on the `Selection` property
  -- This connection sets the 'Transform' property of the PartComponent that holds CameraComponent
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    transformSelector, 'Out',
    parentPartComponent, 'Transform' )

  -- Enable the crosshair for the chase camera
  -- Use a NotEntity to flip the AlternateViewEnabledOut boolean
  -- This will output true while not looking back (including when in the menu, on foot etc)
  local notEntity = NotEntityData()
  notEntity.realm = Realm.Realm_Client
  notEntity.isPropertyConnectionTarget = Realm.Realm_Client
  vehicleEntity.components:add(notEntity)
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    chaseCameraComponent, 'AlternateViewEnabledOut',
    notEntity, 'In' )

  -- Use an AndEntity to enable crosshair when using the chase cam AND not looking back
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

  -- Finally use the output of the AND-gate to enable the crosshair
  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[48])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end



Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/SU-35BM-E/SU-35BM-E')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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
  chaseCameraComponent.fieldOfView = 45
  chaseCameraComponent.transform = SU35_CAMERA_TRANSFORM
  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true

  local parentPartComponent = PartComponentData()
  parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
  parentPartComponent.components:add(chaseCameraComponent)

  playerEntryComponent.components:add(parentPartComponent)
  playerEntryComponent.components:erase(4)

  local alternateView = AlternateCameraViewData()
  alternateView.toggleViewChange = false
  alternateView.fieldOfView = 72    -- same as regularView.fieldOfView
  chaseCameraComponent.alternateView = alternateView
  chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

  local transformSelector = TransformSelectorEntityData()
  transformSelector.in2 = SU35_RESERVE_CAMERA
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

  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[44])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end




Events:Subscribe('Level:RegisterEntityResources', function()
  -- 获取资源
  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/F18-F/F18_SpawnInAir')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
  ModifyF18AirCamera(vehicleBlueprint)
end)
--modify F18
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
  chaseCameraComponent.fieldOfView = 45
  chaseCameraComponent.transform = F18Air_CAMERA_TRANSFORM
  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true

  local parentPartComponent = PartComponentData()
  parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
  parentPartComponent.components:add(chaseCameraComponent)

  playerEntryComponent.components:add(parentPartComponent)
  playerEntryComponent.components:erase(3)

  local alternateView = AlternateCameraViewData()
  alternateView.toggleViewChange = false
  alternateView.fieldOfView = 72    -- same as regularView.fieldOfView
  chaseCameraComponent.alternateView = alternateView
  chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

  local transformSelector = TransformSelectorEntityData()
  transformSelector.in2 = F18Air_RESERVE_CAMERA
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

  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[42])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end


--modify SU35
Events:Subscribe('Level:RegisterEntityResources', function()
  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/SU-35BM-E/SU-35BM-E_SpawnInAir')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
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
  chaseCameraComponent.fieldOfView = 45
  chaseCameraComponent.transform = SU35Air_CAMERA_TRANSFORM
  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true

  local parentPartComponent = PartComponentData()
  parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
  parentPartComponent.components:add(chaseCameraComponent)

  playerEntryComponent.components:add(parentPartComponent)
  playerEntryComponent.components:erase(4)

  local alternateView = AlternateCameraViewData()
  alternateView.toggleViewChange = false
  alternateView.fieldOfView = 72    -- same as regularView.fieldOfView
  chaseCameraComponent.alternateView = alternateView
  chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

  local transformSelector = TransformSelectorEntityData()
  transformSelector.in2 = SU35Air_RESERVE_CAMERA
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

  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[38])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end

--modify F35
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/XPack01/F35/F35B')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
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
  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true

  local parentPartComponent = PartComponentData()
  parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
  parentPartComponent.components:add(chaseCameraComponent)

  playerEntryComponent.components:add(parentPartComponent)
  playerEntryComponent.components:erase(4)

  local alternateView = AlternateCameraViewData()
  alternateView.toggleViewChange = false
  alternateView.fieldOfView = 72    -- same as regularView.fieldOfView
  chaseCameraComponent.alternateView = alternateView
  chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

  local transformSelector = TransformSelectorEntityData()
  transformSelector.in2 = F35_RESERVE_CAMERA
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
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end




--modify A10
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/A-10_THUNDERBOLT/A10_THUNDERBOLT')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
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

  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true

  -- The transform of a part component can be set using a propertyConnection
  -- Since CameraComponentData does not inherit from PartComponentData, it's transform cannot.
  -- Create a PartComponentData and nest the CameraComponentData inside.
  local parentPartComponent = PartComponentData()
  parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
  parentPartComponent.components:add(chaseCameraComponent)
  -- Add the new part component to the player entry and remove the original camera component
  playerEntryComponent.components:add(parentPartComponent)
  playerEntryComponent.components:erase(4)

  -- The default chase camera does not have an alternate view (right click view)
  -- Define an altenate view and assign it to the chase camera
  local alternateView = AlternateCameraViewData()
  alternateView.toggleViewChange = false
  alternateView.fieldOfView = 65    -- same as regularView.fieldOfView
  chaseCameraComponent.alternateView = alternateView
  chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

  -- A TransformSelectorEntity will output one of 2 defined transforms through a property connection.
  -- Assign a reversed transform to the non-default property
  -- This will flip the camera around the origin of the vehicle.
  -- The offset is already defined by the original chase cam
  local transformSelector = TransformSelectorEntityData()
  transformSelector.in2 = A10_RESERVE_CAMERA
  transformSelector.realm = Realm.Realm_Client
  transformSelector.isPropertyConnectionTarget = Realm.Realm_Client
  vehicleEntity.components:add(transformSelector)
  -- This output is true while alternate view is enabled (RMB is held)
  -- This connection sets the 'Selection' property for the TransformSelectorEntity
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    chaseCameraComponent, 'AlternateViewEnabledOut',
    transformSelector, 'Selection' )
  -- The TransformSelectorEntity will output 1 of it's 2 LinearTransforms depending on the `Selection` property
  -- This connection sets the 'Transform' property of the PartComponent that holds CameraComponent
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    transformSelector, 'Out',
    parentPartComponent, 'Transform' )

  -- Enable the crosshair for the chase camera
  -- Use a NotEntity to flip the AlternateViewEnabledOut boolean
  -- This will output true while not looking back (including when in the menu, on foot etc)
  local notEntity = NotEntityData()
  notEntity.realm = Realm.Realm_Client
  notEntity.isPropertyConnectionTarget = Realm.Realm_Client
  vehicleEntity.components:add(notEntity)
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    chaseCameraComponent, 'AlternateViewEnabledOut',
    notEntity, 'In' )

  -- Use an AndEntity to enable crosshair when using the chase cam AND not looking back
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

  -- Finally use the output of the AND-gate to enable the crosshair
  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[39])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end


--modify SU25
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/SU-25TM/SU-25TM')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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

  local chasecamera = ChaseCameraData(chaseCameraComponent.camera)
  chasecamera:MakeWritable()
  chasecamera.shouldRollWithTarget = true

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
  transformSelector.in2 = SU25_RESERVE_CAMERA
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

  local crosshairLogicObject = LogicReferenceObjectData(vehicleEntity.components[41])
  ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
    andEntity, 'Out',
    crosshairLogicObject, '3pCrosshair' )

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end


