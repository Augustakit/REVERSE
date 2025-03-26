return {
  T90 = {
    PARTITION_GUID = Guid('60106974-DD7D-11DD-A030-B04E425BA11E'),
    Gunner_GUID = Guid('4F498B24-766F-4FE8-859D-DC8361412A22'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {4, 2, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    CROSSHAIR_LOGIC_INDEX = 5,
    CROSSHAIR_ERASE_INDEX = 24,
    Or4_ClONE = 10,
    AlTERNATEVIEW = 45,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 10)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3(0, 1, -3)),

    --[[Vec3( 1, 0, 0),                        --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5, -0.15000000596046448)]]

    GunnerCAMERA_TRANSFORM = LinearTransform( --炮手第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1.8, -5)),

    GunnerTARGET_OFFSET = Vec3(0, 0, 0)--炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 
  },



  M1A2 = {
    PARTITION_GUID = Guid('B069BA89-EECF-11DD-8117-9421284A74E5'),
    Gunner_GUID = Guid('0748D26B-DCAF-4A01-AF79-495C99C06A54'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {5, 2, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    CROSSHAIR_LOGIC_INDEX = 6,
    CROSSHAIR_ERASE_INDEX = 23,
    Or4_ClONE = 10,
    AlTERNATEVIEW = 45,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 10)),

   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1, -4.5)),

    --[[Vec3( 1, 0, 0),                        --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为  
     Vec3( 0, 1, 0),
     Vec3( 0, 0, 1),
     Vec3( 0, 0.5, -0.15000000596046448)]]

    GunnerCAMERA_TRANSFORM = LinearTransform( --炮手第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 2.2, -5)),

    GunnerTARGET_OFFSET = Vec3(0, 0, 0)--炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 
  },


  LAV25 = {
    PARTITION_GUID = Guid('D124CDD4-FE2A-11DF-BB74-FD1A26B74EE5'),
    Gunner_GUID = Guid('1749F020-114E-440F-8D7C-D9C4C8D94BBC'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {2},
    CHASE_CAM_COMPONENT_PATH = {3, 2, 3},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    CROSSHAIR_LOGIC_INDEX = 3,
    CROSSHAIR_ERASE_INDEX = 54,
    Or4_ClONE = 4,
    AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1, -4.5)),  --Vec3( 0, 0.5, -0.15000000596046448)

    GunnerCAMERA_TRANSFORM = LinearTransform( --炮手第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 2.2, -5)),

    GunnerTARGET_OFFSET = Vec3(0, 0, 0) --炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 
  },




  BMP2 = {
    PARTITION_GUID = Guid('AAE95906-AFD4-11DD-84FB-9FA71F68ED5E'),
    Gunner_GUID = Guid('77C6975A-043E-46C4-BD59-F0E8E75559A0'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {2},
    CHASE_CAM_COMPONENT_PATH = {3, 5, 3},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    CROSSHAIR_LOGIC_INDEX = 10,
    CROSSHAIR_ERASE_INDEX = 27,
    Or4_ClONE = 3,
    AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(0, 1, -4)), --Vec3( 0, 0.5, -0.15000000596046448)

    GunnerCAMERA_TRANSFORM = LinearTransform( --炮手第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1.8, -5)),      --Vec3( 0, 0, 0)

    GunnerTARGET_OFFSET = Vec3(0, 0, 0)--炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 
  },


  BTR_90 = {
    PARTITION_GUID = Guid('22CFC313-4DD1-49E6-B45F-A8B1194105C5'),
    Gunner_GUID = Guid('49DFEA68-AC69-42C5-A73B-D80603539E1C'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {2},
    CHASE_CAM_COMPONENT_PATH = {4, 5, 3},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    CROSSHAIR_LOGIC_INDEX = 15,
    CROSSHAIR_ERASE_INDEX = 62,
    Or4_ClONE = 3,
    AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1, -4.5)), --Vec3( 0, 0.5, -0.15000000596046448)

    GunnerCAMERA_TRANSFORM = LinearTransform( --炮手第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 2.2, -5)),

    GunnerTARGET_OFFSET = Vec3(0, 0, 0) --炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 
  },


  LAV25_XP5 = {
    PARTITION_GUID = Guid('B791D5BE-5010-49EF-895D-677F5DCE16CB'),
    Gunner_GUID = Guid('C0115BE9-646B-4D2C-8A31-951F20C55F19'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {4},
    CHASE_CAM_COMPONENT_PATH = {5, 2, 3},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    CROSSHAIR_LOGIC_INDEX = 3,
    CROSSHAIR_ERASE_INDEX = 54,
    Or4_ClONE = 4,
    AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1, -4.5)),   --Vec3( 0, 0.5, -0.15000000596046448)

    GunnerCAMERA_TRANSFORM = LinearTransform( --炮手第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 2.2, -5)),

    GunnerTARGET_OFFSET = Vec3(0, 0, 0) --炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 
  },



  BMP2_XP5 = {
    PARTITION_GUID = Guid('DD6BCB51-A4FA-4743-910E-E7B953834089'),
    Gunner_GUID = Guid('0AE0F251-AE68-4B6F-95E6-C376388E8449'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {4},
    CHASE_CAM_COMPONENT_PATH = {5, 5, 3},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    CROSSHAIR_LOGIC_INDEX = 10,
    CROSSHAIR_ERASE_INDEX = 27,
    Or4_ClONE = 4,
    AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3(0, 1, -4)),    --Vec3( 0, 0.5, -0.15000000596046448)

    GunnerCAMERA_TRANSFORM = LinearTransform( --炮手第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1.8, -5)),  --Vec3( 0, 0, 0)

    GunnerTARGET_OFFSET = Vec3(0, 0, 0)--炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 
  },




}