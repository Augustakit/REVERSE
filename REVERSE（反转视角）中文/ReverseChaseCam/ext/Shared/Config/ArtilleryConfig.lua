return {

  HIMARS = {
   PARTITION_GUID = Guid('ECE82307-9454-11E1-9418-9BD47D974A22'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 3},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 55,
    ERASE_INDEX = 61,
    Or_ClONE = 35,

    REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3(0.014251738786697388, 0.7238799333572388, -5)),

    --[[Vec3( 1, 0, 0),                        --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0.014251738786697388, 0.7238799333572388, -0.3216359615325928)]]

    TARGET_OFFSET = Vec3( 0, 0.6499999761581421, 0),

  },



  BM23 = {
    PARTITION_GUID = Guid('65CE090F-3CFC-11E1-BDB2-A81058AAD7AA'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 2},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 55,
    ERASE_INDEX = 56,
    Or_ClONE = 28,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3(-0.09540998935699463, 0.8691021203994751, -5.2)),

    --[[Vec3( 1, 0, 0),                        --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( -0.09540998935699463, 0.8691021203994751, -0.13104963302612305)]]

    TARGET_OFFSET = Vec3( 0, 0.6499999761581421, 0),

  },
}