return {

  LAVAD = {
   PARTITION_GUID = Guid('0E23F40F-CDB3-4B9E-A36B-BD338CFA35BC'),
   CHASE_CAM_CONFIG = {
    CAMERA_GUID = Guid('2C21518F-5740-47FB-B755-BFE37A588C47'),   -- 追击相机组件的 GUID
    CAMERA_PARENT_GUID = Guid('2AB88908-CF47-46EF-AF5A-E5AB1AEFCAD9'),  -- 父组件的 GUID
  },
  CHASECAMERA_INDEX = 3,
  TARGET_OFFSET = Vec3(0, 0, 0),

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),


   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1, -4.5)),

   --[[Vec3( 1, 0, 0),                        --第三人称原始数据 
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5, -0.15000000596046448)]]
  },


  Tunguska = {
   PARTITION_GUID = Guid('3DB73059-32BD-11E0-931D-8D7AAE81C8B7'),
   CHASE_CAM_CONFIG = {
    CAMERA_GUID = Guid('BAAD7BA6-2ADD-49E4-9634-956F8DB95933'),   -- 追击相机组件的 GUID
    CAMERA_PARENT_GUID = Guid('4941C634-CD04-43B9-8E29-C534CA917C8C'),  -- 父组件的 GUID
  },
   CHASECAMERA_INDEX = 4,

   TARGET_OFFSET = Vec3(0, 0, 0),

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),


   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3(0, 1, -4)),

   --[[Vec3( 1, 0, 0),                        --第三人称原始数据 
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5, -0.15000000596046448)]]
  },



  M1128 = {
   PARTITION_GUID = Guid('3EE37540-9833-11E1-A26B-A2AC6EC60B20'),
   CHASE_CAM_CONFIG = {
    CAMERA_GUID = Guid('F23038C2-3C06-47DD-8737-299257EC948B'),   -- 追击相机组件的 GUID
    CAMERA_PARENT_GUID = Guid('0D34332D-6EE4-619F-BD04-21A1D23F2B9F'),  -- 父组件的 GUID
  },
   CHASECAMERA_INDEX = 5,
   TARGET_OFFSET = Vec3(0, 0, 0),

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),


   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 1, -4.0)),

   --[[Vec3( 1, 0, 0),                        --第三人称原始数据 
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5869722366333008, 0.6874621510505676)]]
  },


  SPRUT = {
   PARTITION_GUID = Guid('A069F34C-3AE9-4030-8808-29882A555FA1'),
   CHASE_CAM_CONFIG = {
    CAMERA_GUID = Guid('F2B12CE1-82C2-4583-9997-2E770F656CAE'),   -- 追击相机组件的 GUID
    CAMERA_PARENT_GUID = Guid('073BC698-9DF6-48B0-8CE6-878F8ED753B9'),  -- 父组件的 GUID
  },
   CHASECAMERA_INDEX = 2,

   TARGET_OFFSET = Vec3(0, 0, 0),

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
   Vec3(-1, 0, 0),
   Vec3( 0, 1, 0),
   Vec3( 0, 0,-1),
   Vec3( 0, 2, 5)),


   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
   Vec3(1, 0, 0),
   Vec3(0, 1, 0),
   Vec3(0, 0, 1),
   Vec3(0, 1, -4)),

   --[[Vec3( 1, 0, 0),                        --第三人称原始数据 
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5, -0.15000000596046448)]]
  },


  RHINO = { --VanModified
   PARTITION_GUID = Guid('193D1786-EC47-11E1-891F-82DA7A0DD2F4'),
   CHASE_CAM_CONFIG = {
    CAMERA_GUID = Guid('1520FE4F-2C93-4DD5-9C12-60F93FF85826'),   -- 追击相机组件的 GUID
    CAMERA_PARENT_GUID = Guid('AF0D90B7-F64A-655B-B13D-73A1504166A0'),  -- 父组件的 GUID
  },
   CHASECAMERA_INDEX = 3,
   TARGET_OFFSET = Vec3(0, 0, 0),

   REVERSED_TRANSFORM = LinearTransform( --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 5)),


   CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.19579553604125977, -5)), --  Vec3(0, 0.19579553604125977, -0.15000000596046448)]]

  },


  HIMARS = {
   PARTITION_GUID = Guid('ECE82307-9454-11E1-9418-9BD47D974A22'),
   CHASE_CAM_CONFIG = {
    CAMERA_GUID = Guid('C27026A2-6693-4C89-A339-AF42F825FEDF'),   -- 追击相机组件的 GUID
    CAMERA_PARENT_GUID = Guid('99E41318-EFD5-414E-A8BF-E4096456EF87'),  -- 父组件的 GUID
  },
   CHASECAMERA_INDEX = 3,

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

    --[[Vec3( 1, 0, 0),                        --第三人称原始数据 
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0.014251738786697388, 0.7238799333572388, -0.3216359615325928)]]

    TARGET_OFFSET = Vec3( 0, 0.6499999761581421, 0),

  },



  BM23 = {
    PARTITION_GUID = Guid('65CE090F-3CFC-11E1-BDB2-A81058AAD7AA'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('9486D6E1-446A-4BB7-9DF0-F9384AC68C50'),   -- 追击相机组件的 GUID
      CAMERA_PARENT_GUID = Guid('2159CBC7-7566-4F5E-B16A-29D7D90C1B71'),  -- 父组件的 GUID
    },
     CHASECAMERA_INDEX = 2,

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

    --[[Vec3( 1, 0, 0),                        --第三人称原始数据 
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( -0.09540998935699463, 0.8691021203994751, -0.13104963302612305)]]

    TARGET_OFFSET = Vec3( 0, 0.6499999761581421, 0),

  },
  
}