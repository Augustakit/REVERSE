return {
  AH6 = {
    PARTITION_GUID = Guid('FD8AB747-FF4D-11DD-A7B1-F7C6DEEC9D32'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 6, 15)),


    CAMERA_TRANSFORM = LinearTransform( --第三人称视角，参考4的数据
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3( 0, 1.774159, -2.759414)), --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为 Vec3( -0.4536046, 1.774159, -2.759414)

    --[[Vec3( 1, 0, 0),                        --第三人称原始数据 
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0, 0]]
    TARGET_OFFSET = Vec3(0, 0, 0),--炮手第三人称视角目标偏移，原数据为 Vec3(2.0, 2.0, -2.0) 

    WANT_DISTANCE = 13, --8 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。
  },



  Z11W = {
    PARTITION_GUID = Guid('D78088E5-38B7-11DE-BF1C-984D9AEE762C'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 6, 15)),


    CAMERA_TRANSFORM = LinearTransform( --第三人称视角，参考4的数据
    Vec3( 1, -2.980232E-080, 0),
    Vec3( 5.960464E-08, 1, -3.72529E-09),
    Vec3( 0, -1.862645E-09, 1),
    Vec3( 0, 1.695798, -5.588745)),  --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为 Vec3( -0.4312353, 1.695798, -5.588745)
  
    --[[Vec3( 1, 0, 0),                        --第三人称原始数据 
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0, 0]]
    TARGET_OFFSET = Vec3(0, 0, 0),--炮手第三人称视角目标偏移，原数据为 Vec3(2.0, 3.0, -2.0) 

    WANT_DISTANCE = 14, --10 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。
  },



  AH1Z = {
    PARTITION_GUID = Guid('643135EA-6CA7-11DF-B6FA-F715AA601362'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {5},
    CHASE_CAM_COMPONENT_PATH = {5, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 45,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, -0.5693534016609192, 4.482795238494873)),


    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5693534016609192, -4.482795238494873)),

    TARGET_OFFSET = Vec3(0, 3.0, -7.0), --第三人称视角目标偏移，原数据为 Vec3(2.799999952316284, 3.0, -7.0) 

    WANT_DISTANCE = 12, --12 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。
  },



  MI28 = {
    PARTITION_GUID = Guid('89BE53B6-2FF4-11DE-8C23-DAB1D69416DE'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 4},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 45,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 0)),


    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0, 0)),

    TARGET_OFFSET = Vec3(0, 3.0, -11.5),--第三人称视角目标偏移，原数据为 Vec3(4.300000190734863, 3.0, -11.5) 

    WANT_DISTANCE = 25, --12 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。
  },



  Venom = {
    PARTITION_GUID = Guid('97945D87-011D-11E0-B97C-FC495C335A52'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {5},
    CHASE_CAM_COMPONENT_PATH = {5, 6},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 60,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 15)),


    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, -1.4959161281585693, -3.123964309692383)),

    TARGET_OFFSET = Vec3(2.799999952316284, 3.0, -7.0),--第三人称视角目标偏移

    WANT_DISTANCE = 10, --10 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。
  },



  KA60 = {
    PARTITION_GUID = Guid('2C5892FC-37CB-4A4E-92E2-2DD7BAF08A5C'),
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {4},
    CHASE_CAM_COMPONENT_PATH = {4, 6},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
    AlTERNATEVIEW = 45,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 15)),


    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0.4939870834350586, 0.2902224063873291, -0.11299633979797363)),

    TARGET_OFFSET = Vec3(2.0, 3.0, -11.5),--第三人称视角目标偏移

    WANT_DISTANCE = 12, --12 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。
  },


}