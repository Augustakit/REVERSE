return {

  GROWLER = {
    PARTITION_GUID = Guid('CF5166FD-6B60-11E0-8ACE-C75FA07B1C42'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('85B09D0D-59A9-40E1-B44B-FF437E9BF9E8'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('36930B91-D140-4636-8A4C-785FB8922DE7'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 4,
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
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('A41651DC-60C9-4D7F-8BB3-FA613E4AF95E'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('208D3953-0633-4678-BC7D-3D01D02AA378'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 4,
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
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('2CC96002-048C-44BB-A8A0-3D996B172AE2'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('FCF7B427-6CBC-4236-9482-F71549365E58'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 4,
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
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('2D742E22-CBA7-4B7A-9519-2523878AC553'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('50CCC354-FB03-48E1-966E-848057F39BB5'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 2,
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
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('DFB5B46D-6CEB-47CE-8133-2C407AFFA5CC'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('39B81574-0B4F-44BC-AE87-87F31EE953AC'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 3,
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
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('E917A003-ABB7-42F7-B8FC-BA5947AE9B27'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('34DEE203-E0D3-448B-8379-0662545E3128'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 4,
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
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('6F7D1D56-DFC8-46F9-9A5E-10DD7A3B9973'),   -- 追击相机组件的 GUID {5511}
      CAMERA_PARENT_GUID = Guid('327608BA-4F48-48C2-A578-BE05E1D7CA55'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 1,
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
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('FBED1CAF-1FC4-4E39-83DD-07ED11292707'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('23E2595F-DBD2-4F3F-8A4E-EE942DE82D37'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 4,
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
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('82B52FEA-FB26-4253-A067-0BC2AEBA7431'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('B064A4E4-4187-48A1-87A1-95A2D5BC5BD9'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 4,
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