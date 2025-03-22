return {

  AAV7A1 = {
   PARTITION_GUID = Guid('F0530CEB-5F63-11E0-858A-FC3FD696384C'),
   Gunner_GUID = Guid('17BFE3B8-1C83-4D0C-9E89-B6B4E205EE40'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {3},
   CHASE_CAM_COMPONENT_PATH = {3, 4},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

   CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 2.34451961517334, 1.9013230800628662)),

   TARGET_OFFSET = Vec3(0, 2.0, -6.5),

   GunnerCAMERA_TRANSFORM = LinearTransform( --Third person view of the gunner
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0.02780759334564209, -0.23745942115783691, -0.3251523971557617)),

   GunnerTARGET_OFFSET = Vec3(1.0, 0, 0.029999999329447746)--Third-person view of the gunner's target offset，The original data is Vec3(1.0, 0, 0.029999999329447746) 

  },



  M1114 = {
   PARTITION_GUID = Guid('611F48A3-0919-11E0-985D-C512734E48AF'),
   Gunner_GUID = Guid('7CDE5896-A2A0-4C7E-9893-8AA252789D81'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {3},
   CHASE_CAM_COMPONENT_PATH = {3, 4},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( -1.2, 0, 5)),

   CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(-0.6888092756271362, 1.1296229362487793, -0.2585226595401764)),   --Vec3(-0.6888092756271362, 1.1296229362487793, -0.2585226595401764)

   TARGET_OFFSET = Vec3(0, 0, 1.2999999523162842),--Third person view target offset, original data is Vec3(0, 0, 1.2999999523162842) 

   GunnerCAMERA_TRANSFORM = LinearTransform( --Third person view of the gunner
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1.7, -3)),  --Vec3(0, -0.09808516502380371, 0.4861708879470825)

   GunnerTARGET_OFFSET = Vec3(1.0, 0, 0.029999999329447746)    --Third-person view of the gunner's target offset --Vec3(1.0, 0, 0.029999999329447746)

  },



  GAZ3937 = {
   PARTITION_GUID = Guid('B9E8F531-DF6E-4221-BD32-A8D15CB2E8C8'),
   Gunner_GUID = Guid('2A96E6CA-8975-4C7F-8032-C57ED7D7627B'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {3},
   CHASE_CAM_COMPONENT_PATH = {3, 4},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)),

   CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(0.013305723667144775, 0.7222952246665955, 0.04108428955078125)),    --0.013305723667144775, 0.7222952246665955, 0.04108428955078125

   TARGET_OFFSET = Vec3(0, 0, 0), --Third person view target offset, original data is Vec3(0, 0.6499999761581421, 0) 

   GunnerCAMERA_TRANSFORM = LinearTransform( --Third person view of the gunner
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1.7, -3)),  --Vec3(0, -0.09808516502380371, 0.4861708879470825)

   GunnerTARGET_OFFSET = Vec3(1.0, 0, 0.029999999329447746)--Third-person view of the gunner's target offset --Vec3(1.0, 0, 0.029999999329447746)
  },



  ASRAD = {
   PARTITION_GUID = Guid('F7C250D2-ECEB-481F-A130-D91FE8B693E0'),
   Gunner_GUID = Guid('44E480F6-1484-4622-9E8C-5F64EE7ED010'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {4},
   CHASE_CAM_COMPONENT_PATH = {4, 4},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( -1.2, 0, 5)),

   CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(-0.6888092756271362, 1.1296229362487793, -0.2585226595401764)),

   TARGET_OFFSET = Vec3(0, 0, 1.2999999523162842), --Third person view target offset, original data is Vec3(0, 0.6499999761581421, 0) 

   GunnerCAMERA_TRANSFORM = LinearTransform( --Third person view of the gunner
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1.7, -3)),
    --Vec3( 0, -0.09808516502380371, 0.4861708879470825)

   GunnerTARGET_OFFSET = Vec3(1.0, 0.5, -0.5)--Third-person view of the gunner's target offset
  },



  VodnikPhoenix = {
   PARTITION_GUID = Guid('4DBB5F24-30D5-4CF1-819B-D6E95561D62F'),
   Gunner_GUID = Guid('39EA0490-CC35-49BB-AC05-B9864AF0733D'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {4},
   CHASE_CAM_COMPONENT_PATH = {4, 4},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0.02, 1.3, 5)),

   CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(0.013305723667144775, 0.7222952246665955, 0.04108428955078125)),

   TARGET_OFFSET = Vec3(0, 0.6499999761581421, 0), --Third person view target offset

   GunnerCAMERA_TRANSFORM = LinearTransform( --Third person view of the gunner
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1.7, -2.5)),
    --  Vec3( 0, -0.09808516502380371, 0.4861708879470825)

   GunnerTARGET_OFFSET = Vec3(1.0, 1.0, -1.0)--Third-person view of the gunner's target offset
  },

}