local ConnectionHelper = require('__shared/ConnectionHelper')
require('__shared/Config/Helicopterconfig')

--modify AH1Z
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/AH1Z/AH1Z')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(4)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 45    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = AH1Z_RESERVE_CAMERA
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

 --[[local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
 local crosshairLogicObject = LogicReferenceObjectData()
 crosshairLogicObject.blueprint = logicPrefaBlueprint
 vehicleEntity.components:add(crosshairLogicObject)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  andEntity, 'Out',
  crosshairLogicObject, '3pCrosshair' )]]

 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end


--modify Mi-28
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/Mi28/Mi28')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)
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

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(4)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 45    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = Mi28_RESERVE_CAMERA
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
 vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

 print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end




--modify AH6
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/AH6/AH6_Littlebird')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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
 transformSelector.in2 = AH6_RESERVE_CAMERA
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

 --[[local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
 local crosshairLogicObject = LogicReferenceObjectData()
 crosshairLogicObject.blueprint = logicPrefaBlueprint
 vehicleEntity.components:add(crosshairLogicObject)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  andEntity, 'Out',
  crosshairLogicObject, '3pCrosshair' )]]
vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end


--modify Z11-W
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/Z11W/Z-11w')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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
 chasecamera.wantedDistance = Z11W_WantDistance  --10

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
 transformSelector.in2 = Z11W_RESERVE_CAMERA
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

 --[[local logicPrefaBlueprint = LogicPrefabBlueprint(ResourceManager:SearchForDataContainer('Vehicles/common/SimpleCrosshair'))
 local crosshairLogicObject = LogicReferenceObjectData()
 crosshairLogicObject.blueprint = logicPrefaBlueprint
 vehicleEntity.components:add(crosshairLogicObject)
 ConnectionHelper:AddPropertyConnection(vehicleBlueprint,
  andEntity, 'Out',
  crosshairLogicObject, '3pCrosshair' )]]
vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3

print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end



--modify UH-1Y VENOM 毒液运直
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/Venom/Venom')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(6)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 60    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = Venom_RESERVE_CAMERA
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

  print('Modified Chase Camera for ' .. vehicleBlueprint.name)

end


--modify KA-60杀人鲸
Events:Subscribe('Level:RegisterEntityResources', function()

  local dataContainer = ResourceManager:SearchForDataContainer('Vehicles/KA-60_Kasatka/KA-60_Kasatka')

  if not dataContainer then  --Check if the resources are valid
    return  --Check if the resources are valid
  end

  --If the resources are available, continue with subsequent operations
  local vehicleBlueprint = VehicleBlueprint(dataContainer)
  -- Your subsequent code (such as modifying the vehicle's camera, etc.)

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
 chasecamera.targetOffset = KA60_TARGET_OFFECT
 chasecamera.wantedDistance = KA60_WantDistance

 local parentPartComponent = PartComponentData()
 parentPartComponent.isPropertyConnectionTarget = Realm.Realm_Client -- connections don't work unless these are set
 parentPartComponent.components:add(chaseCameraComponent)

 playerEntryComponent.components:add(parentPartComponent)
 playerEntryComponent.components:erase(6)

 local alternateView = AlternateCameraViewData()
 alternateView.toggleViewChange = false
 alternateView.fieldOfView = 45    -- same as regularView.fieldOfView
 chaseCameraComponent.alternateView = alternateView
 chaseCameraComponent.isPropertyConnectionTarget = Realm.Realm_Client

 local transformSelector = TransformSelectorEntityData()
 transformSelector.in2 = KA60_RESERVE_CAMERA
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

   print('Modified Chase Camera for ' .. vehicleBlueprint.name)

   vehicleEntity.runtimeComponentCount = vehicleEntity.runtimeComponentCount + 3
end



