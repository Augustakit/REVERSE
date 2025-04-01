return {

  HIMARS = {
   PARTITION_GUID = Guid('ECE82307-9454-11E1-9418-9BD47D974A22'),
    CHASE_CAM_CONFIG = {
    CAMERA_GUID = Guid('C27026A2-6693-4C89-A339-AF42F825FEDF'),   -- GUID of the chase camera component
    CAMERA_PARENT_GUID = Guid('99E41318-EFD5-414E-A8BF-E4096456EF87'),  -- GUID of the parent component
  },
   CHASECAMERA_INDEX = 3,
    AlTERNATEVIEW = 55,
    ERASE_INDEX = 61,
    Or_ClONE = 35,

    REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

    CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3(0.014251738786697388, 0.7238799333572388, -5)),

    --[[Vec3( 1, 0, 0),                        --Here the first data is adjusted so that it is no longer to the right. raw data from BF4  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0.014251738786697388, 0.7238799333572388, -0.3216359615325928)]]

    TARGET_OFFSET = Vec3( 0, 0.6499999761581421, 0),

  },



  BM23 = {
    PARTITION_GUID = Guid('65CE090F-3CFC-11E1-BDB2-A81058AAD7AA'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('9486D6E1-446A-4BB7-9DF0-F9384AC68C50'),   -- GUID of the chase camera component
      CAMERA_PARENT_GUID = Guid('2159CBC7-7566-4F5E-B16A-29D7D90C1B71'),  -- GUID of the parent component
    },
     CHASECAMERA_INDEX = 2,
    AlTERNATEVIEW = 55,
    ERASE_INDEX = 56,
    Or_ClONE = 28,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5)),

    CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3(-0.09540998935699463, 0.8691021203994751, -5.2)),

    --[[Vec3( 1, 0, 0),                        --Here the first data is adjusted so that it is no longer to the right. raw data from BF4  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( -0.09540998935699463, 0.8691021203994751, -0.13104963302612305)]]

    TARGET_OFFSET = Vec3( 0, 0.6499999761581421, 0),

  },
}