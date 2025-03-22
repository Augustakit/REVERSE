return {

  GROWLER = {
    PARTITION_GUID = Guid('CF5166FD-6B60-11E0-8ACE-C75FA07B1C42'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(0.0121079683303833, 1.1296229362487793, -0.2585226595401764)),   --Vec3(0.0121079683303833, 1.1296229362487793, -0.2585226595401764)


    TARGET_OFFSET = Vec3(0, 0, 1.2999999523162842), --第三人称视角目标偏移，原数据为 Vec3(0, 0, 1.2999999523162842) 
    WANT_DISTANCE = 9,
  },



  VDV = {
    PARTITION_GUID = Guid('2EA804A7-8232-11E0-823A-BD52CA6DC6B3'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(0.0121079683303833, 1.1296229362487793, -0.2585226595401764)),   --Vec3((0.0121079683303833, 1.1296229362487793, -0.2585226595401764))


    TARGET_OFFSET = Vec3(0, 0, 1.2999999523162842), --第三人称视角目标偏移，原数据为 Vec3(0, 0, 1.2999999523162842) 
    WANT_DISTANCE = 9,
  },


  DPV = {
    PARTITION_GUID = Guid('6F91A4CF-344D-11E0-930F-E8BE623140CB'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {11},
    CHASE_CAM_COMPONENT_PATH = {11, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(-0.3428395986557007, 1.0427334308624268, 0.22370600700378418)),   --Vec3(-0.3428395986557007, 1.0427334308624268, 0.22370600700378418)


    TARGET_OFFSET = Vec3(0, 0, 1.2999999523162842), --第三人称视角目标偏移，原数据为 Vec3(0, 0, 1.2999999523162842) 
    WANT_DISTANCE = 9,
  },


  QuadBike = {
    PARTITION_GUID = Guid('08D3686F-A96A-11E1-9047-F3806E4ECBA6'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {1},
    CHASE_CAM_COMPONENT_PATH = {1, 2},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(-0.018781214952468872, 0.7589980363845825, -0.2585226595401764)),

    TARGET_OFFSET = Vec3(0, 0, 1.2999999523162842), --第三人称视角目标偏移，原数据为 Vec3(0, 0, 1.2999999523162842) 
    WANT_DISTANCE = 8,
  },


  PHOENIX = { --HumveeModified
    PARTITION_GUID = Guid('98D05D7F-DFD7-11E1-BFA9-DC780719E49F'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {4},
    CHASE_CAM_COMPONENT_PATH = {4, 3},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( -1.2, 0, 5)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(-0.6888092756271362, 1.1296229362487793, -0.2585226595401764)),   --Vec3(-0.6888092756271362, 1.1296229362487793, -0.2585226595401764)


    TARGET_OFFSET = Vec3(0, 0, 1.2999999523162842), --第三人称视角目标偏移，原数据为 Vec3(0, 0, 1.2999999523162842) 
    WANT_DISTANCE = 10,
  },


  BARSUK = { --VodnikModified
    PARTITION_GUID = Guid('4D4A21FE-F1C4-11E1-AAFE-89CDE5F1BCBA'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)), --第三人称视角目标偏移，原数据为 Vec3(0, 0.6499999761581421, 0) 


    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(0.013305723667144775, 0.7222952246665955, 0.04108428955078125)),   --Vec3(0.013305723667144775, 0.7222952246665955, 0.04108428955078125)

    TARGET_OFFSET = Vec3(0, 0.6499999761581421, 0),--第三人称视角目标偏移，原数据为 Vec3(0, 0.6499999761581421, 0) 
    WANT_DISTANCE = 11.5,
  },


  KLR650 = { --VodnikModified
    PARTITION_GUID = Guid('38FA36CC-22C8-4624-89BF-1D95C7CE7815'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {5},
    CHASE_CAM_COMPONENT_PATH = {5, 5 ,1 ,1},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)),--第三人称视角目标偏移，原数据为 Vec3(0, 0.6499999761581421, 0) 

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3(1, 4.408307319181404e-08, -8.818268781851657e-09),
    Vec3(-4.408307319181404e-08, 1, 4.3835054697183296e-08),
    Vec3(8.818271446386916e-09, -4.3835054697183296e-08, 1),
    Vec3(0, 0, 0)),

    TARGET_OFFSET = Vec3(0, 0, 0.3499999940395355), --第三人称视角目标偏移
    WANT_DISTANCE = 6,
  },


  RHIB = {
    PARTITION_GUID = Guid('0991DC0A-4681-11E0-AB52-CF61A9ADB6F1'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {4},
    CHASE_CAM_COMPONENT_PATH = {4, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)),        --第三人称视角目标偏移，原数据为 Vec3(0, 0.6499999761581421, 0) 

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3(0, 0.9937710762023926, 1.5253347158432007)),   --Vec3(0, 0.9937710762023926, 1.5253347158432007)

    TARGET_OFFSET = Vec3(0, 0, 0), --第三人称视角目标偏移
    WANT_DISTANCE = 9,
  },


  RHIB_XP3 = {
    PARTITION_GUID = Guid('C0C2582E-82ED-4176-9F0A-61B5748CA3CD'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {4},
    CHASE_CAM_COMPONENT_PATH = {4, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 65,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)),  --第三人称视角目标偏移，原数据为 Vec3(0, 0.6499999761581421, 0) 

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3(0, 0.9937710762023926, 1.5253347158432007)),   --Vec3(0, 0.9937710762023926, 1.5253347158432007)

    TARGET_OFFSET = Vec3(0, 0, 0), --第三人称视角目标偏移
    WANT_DISTANCE = 9,
  },

}