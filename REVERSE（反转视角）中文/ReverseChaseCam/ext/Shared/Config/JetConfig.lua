F35_CAMERA_TRANSFORM = LinearTransform(  --第三人称视角，参考4的数据
Vec3(1, 0, 0),
Vec3(0, 1, 0),
Vec3(0, 0, 1),
Vec3(0, 3.5, -12.5834))

F35_RESERVE_CAMERA = LinearTransform(   --反转视角数据, 参考4的数据
Vec3(-1, 0, 0),
Vec3(0, 1, 0),
Vec3(0, 0, -1),
Vec3(0, -1.639597, 20.58347))


return {

  F18 = {
    PARTITION_GUID = Guid('3EABB4EF-4003-11E0-8ACA-C41D37DB421C'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('18C8BE39-0026-4FDC-AA74-2D96767E312C'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('707F638C-353B-4149-A3A7-D0AC6F425A74'),  -- 父组件的 GUID
    },
    CHASECAMERA_INDEX = 3,
    AlTERNATEVIEW = 72,
    CROSSHAIR_LOGIC_INDEX  = 48,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, -0.9, 10)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.9798853397369385, -4.482795238494873)),

    TARGET_OFFSET = Vec3(0, 0, 0),
  },


  SU35 = {
    PARTITION_GUID = Guid('76806015-4BE2-11E0-B502-9B84AFF94A89'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('74F2DCD8-AA04-4E02-BFE1-B4BB9BBE417E'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('3A0B6700-C2B6-4EAF-A678-CAC2EDAE3BE3'),  -- 父组件的 GUID
    },
    CHASECAMERA_INDEX = 4,
    AlTERNATEVIEW = 72,
    CROSSHAIR_LOGIC_INDEX  = 44,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, -0.9, 10)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1.9803240299224854, -4.482795238494873)),
    TARGET_OFFSET = Vec3(0, 0, 0),

  },



  F18_XP5 = {
    PARTITION_GUID = Guid('99E0A725-E473-4A6C-8421-087F390AABFB'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('7B5B48D3-1A70-469A-A191-C1BEAAA9795A'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('6042B161-60B0-432D-B073-0D159BFF1380'),  -- 父组件的 GUID
    },
    CHASECAMERA_INDEX = 3,
    AlTERNATEVIEW = 72,
    CROSSHAIR_LOGIC_INDEX  = 42,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, -0.9, 10)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.9798853397369385, -4.482795238494873)),
    TARGET_OFFSET = Vec3(0, 0, 0),
  },


  SU35_XP5 = {
    PARTITION_GUID = Guid('D8A0ED02-46B9-4AE1-8262-2C24995AAED0'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('361000DA-6A5E-40DB-8F9B-6DE468C422C4'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('8503464E-201E-4373-901D-72CF4C1DCA53'),  -- 父组件的 GUID
    },
    CHASECAMERA_INDEX = 4,
    AlTERNATEVIEW = 72,
    CROSSHAIR_LOGIC_INDEX  = 38,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, -0.9, 10)),

    CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1.9803240299224854, -4.482795238494873)),

    TARGET_OFFSET = Vec3(0, 0, 0),
  },


--如果您对初始数据并不满意，这里我们给您提供了了BF4的J-20以及SU-57的参数供您改变您喜欢的喷气机.
--J-20第三人称视角
 --[[
  J20_CAMERA_TRANSFORM = LinearTransform(
 Vec3(1, 0, 0),
 Vec3(0, 0.9999999, 0),
 Vec3(0, 0, 0.9999999),
 Vec3(0, 3.948547, -19.95694))

--J-20 第三人称反转视角
 J20_RESERVE_CAMERA = LinearTransform(
  Vec3( -1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, -1),
  Vec3( 0, -2.448547, 28.95694))

--SU-57 第三人称视角
 SU57_CAMERA_TRANSFORM = LinearTransform(
  Vec3(0.9999999, 0, 0),
  Vec3(0, 0.9999999, 0),
  Vec3(0, 0, 1),
  Vec3(0, 3.5, -13.84489))

--SU-57 第三人称反转视角
 SU57_RESERVE_CAMERA = LinearTransform(
  Vec3( -1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, -1),
  Vec3( 0, -2, 22.84489)) ]]



  A10 = {
   PARTITION_GUID = Guid('D07E3830-85FD-4C0E-819E-23640D2B2ECB'),
   CHASE_CAM_CONFIG = {
    CAMERA_GUID = Guid('D035CB54-9C4D-4371-AF6A-327731076041'),   -- 追击相机组件的 GUID
    CAMERA_PARENT_GUID = Guid('E955AA81-083D-4396-82E5-0D3BCB3B497C'),  -- 父组件的 GUID
  },
   CHASECAMERA_INDEX = 4,
   AlTERNATEVIEW = 72,
   CROSSHAIR_LOGIC_INDEX  = 39,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据, 参考了BF4的数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, -2, 26.73792)),

   CAMERA_TRANSFORM = LinearTransform( --第三人称视角，参考了4的数据
    Vec3(1, 0, 0),
    Vec3(0, 0.997564, 0.06975646),
    Vec3(0, -0.06975646, 0.997564),
    Vec3(0, 5.2, -14.73792)),

   --[[Vec3(1, 0, 0),                           --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为
    Vec3( 0, 1, -4.4223646966656815e-10),
    Vec3( 0, 4.4223646966656815e-10, 1),
    Vec3( 0, 1.126838207244873, -2.0555620193481445)]]

   TARGET_OFFSET = Vec3(0, 1.5, 0),
  },



  SU25 = {
   PARTITION_GUID = Guid('08D7A80F-BCB4-44FA-8DDF-AE65F096046D'),
   CHASE_CAM_CONFIG = {
    CAMERA_GUID = Guid('EE56D773-BD30-472F-99E5-AD8733747777'),   -- 追击相机组件的 GUID
    CAMERA_PARENT_GUID = Guid('3C25A62A-E59F-44F7-A9DC-4341E58ACCA0'),  -- 父组件的 GUID
  },
   CHASECAMERA_INDEX = 4,
   AlTERNATEVIEW = 72,
   CROSSHAIR_LOGIC_INDEX  = 41,

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据, 参考了BF4的数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, -2, 19.89971)),

   CAMERA_TRANSFORM = LinearTransform( --第三人称视角，参考了4的数据
    Vec3(1, 0, 0),
    Vec3(0, 0.9984407, 0.0558215),
    Vec3(0, -0.0558215, 0.9984407),
    Vec3(0, 4.5, -8.899711)),

   --[[Vec3(1, 0, 0),
    Vec3( 0, 1, -4.4223646966656815e-10),
    Vec3( 0, 4.4223646966656815e-10, 1),
    Vec3( 0, 2.2747201919555664, -2.0047173500061035)]]
   TARGET_OFFSET = Vec3(0, 1.2000000476837158, 0),
  },
}
  


