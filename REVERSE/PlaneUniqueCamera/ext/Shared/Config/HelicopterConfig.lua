return {
  AH6 = {
    PARTITION_GUID = Guid('FD8AB747-FF4D-11DD-A7B1-F7C6DEEC9D32'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('15AB2B36-FF4E-11DD-A7B1-F7C6DEEC9D32'),   -- GUID of the chase camera component
      CAMERA_PARENT_GUID = Guid('15AADD0B-FF4E-11DD-A7B1-F7C6DEEC9D32'),  -- GUID of the parent component
    },
     CHASECAMERA_INDEX = 4,
    AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 6, 15)),


    CAMERA_TRANSFORM = LinearTransform( --Third person view, referencing BF4 stats
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3( 0, 1.774159, -2.759414)), --Here the first data is adjusted so that it is no longer to the right. raw data from BF4 Vec3( -0.4536046, 1.774159, -2.759414)

    --[[Vec3( 1, 0, 0),                        --Third person view initial data  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0, 0]]
    TARGET_OFFSET = Vec3(0, 0, 0),--Third-person view of the gunner's target offset Vec3(2.0, 2.0, -2.0) 

    WANT_DISTANCE = 13, --8 The general idea is that the distance from the aircraft to one's field of view when in third-person view does not affect the size of the aircraft itself; the larger the value, the smaller the fuselage, and the smaller the value, the larger the fuselage.
  },



  Z11W = {
    PARTITION_GUID = Guid('D78088E5-38B7-11DE-BF1C-984D9AEE762C'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('D780B023-38B7-11DE-BF1C-984D9AEE762C'),   -- GUID of the chase camera component
      CAMERA_PARENT_GUID = Guid('D780B01A-38B7-11DE-BF1C-984D9AEE762C'),  -- GUID of the parent component
    },
    CHASECAMERA_INDEX = 4,
    AlTERNATEVIEW = 55,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 6, 15)),


    CAMERA_TRANSFORM = LinearTransform( --Third person view, referencing BF4 stats
    Vec3( 1, -2.980232E-080, 0),
    Vec3( 5.960464E-08, 1, -3.72529E-09),
    Vec3( 0, -1.862645E-09, 1),
    Vec3( 0, 1.695798, -5.588745)),  --Here the first data is adjusted so that it is no longer to the right. raw data from BF4 Vec3( -0.4312353, 1.695798, -5.588745)
  
    --[[Vec3( 1, 0, 0),                        --Third person view initial data  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0, 0]]
    TARGET_OFFSET = Vec3(0, 0, 0),--Third-person view of the gunner's target offset Vec3(2.0, 3.0, -2.0) 

    WANT_DISTANCE = 14, --10 The general idea is that the distance from the aircraft to one's field of view when in third-person view does not affect the size of the aircraft itself; the larger the value, the smaller the fuselage, and the smaller the value, the larger the fuselage.
  },



  AH1Z = {
    PARTITION_GUID = Guid('643135EA-6CA7-11DF-B6FA-F715AA601362'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('1CB888EE-F85D-42C8-B126-703EB7EAF2B9'),   -- GUID of the chase camera component
      CAMERA_PARENT_GUID = Guid('2BC443E0-53B3-417A-A609-AEDBEC154C4C'),  -- GUID of the parent component
    },
    CHASECAMERA_INDEX = 4,
    AlTERNATEVIEW = 45,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, -0.5693534016609192, 4.482795238494873)),


    CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5693534016609192, -4.482795238494873)),

    TARGET_OFFSET = Vec3(0, 3.0, -7.0), --Third person view target offset, original data is Vec3(2.799999952316284, 3.0, -7.0) 

    WANT_DISTANCE = 12, --12 The general idea is that the distance from the aircraft to one's field of view when in third-person view does not affect the size of the aircraft itself; the larger the value, the smaller the fuselage, and the smaller the value, the larger the fuselage.
  },



  MI28 = {
    PARTITION_GUID = Guid('89BE53B6-2FF4-11DE-8C23-DAB1D69416DE'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('89BEA216-2FF4-11DE-8C23-DAB1D69416DE'),   -- GUID of the chase camera component
      CAMERA_PARENT_GUID = Guid('89BEA1FA-2FF4-11DE-8C23-DAB1D69416DE'),  -- GUID of the parent component
    },
    CHASECAMERA_INDEX = 4,
    AlTERNATEVIEW = 45,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 0)),


    CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0, 0)),

    TARGET_OFFSET = Vec3(0, 3.0, -11.5),--Third person view target offset, original data is Vec3(4.300000190734863, 3.0, -11.5) 

    WANT_DISTANCE = 25, --12 The general idea is that the distance from the aircraft to one's field of view when in third-person view does not affect the size of the aircraft itself; the larger the value, the smaller the fuselage, and the smaller the value, the larger the fuselage.
  },



  Venom = {
    PARTITION_GUID = Guid('97945D87-011D-11E0-B97C-FC495C335A52'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('724B3184-58EF-4C45-B949-5FC5DC7545FA'),   -- GUID of the chase camera component
      CAMERA_PARENT_GUID = Guid('98A7B028-EC93-4A59-A8F6-81B3EF119FCE'),  -- GUID of the parent component
    },
    CHASECAMERA_INDEX = 6,
    AlTERNATEVIEW = 60,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 15)),


    CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, -1.4959161281585693, -3.123964309692383)),

    TARGET_OFFSET = Vec3(2.799999952316284, 3.0, -7.0),--Third person view target offset

    WANT_DISTANCE = 10, --10 The general idea is that the distance from the aircraft to one's field of view when in third-person view does not affect the size of the aircraft itself; the larger the value, the smaller the fuselage, and the smaller the value, the larger the fuselage.
  },



  KA60 = {
    PARTITION_GUID = Guid('2C5892FC-37CB-4A4E-92E2-2DD7BAF08A5C'),
    CHASE_CAM_CONFIG = {
      CAMERA_GUID = Guid('D21CBB04-8F69-4DA4-8C78-96A34245807C'),   -- GUID of the chase camera component
      CAMERA_PARENT_GUID = Guid('16286E81-9D0A-4FEB-A6D6-759AF6BDE53C'),  -- GUID of the parent component
    },
    CHASECAMERA_INDEX = 6,
    AlTERNATEVIEW = 45,

   REVERSED_TRANSFORM = LinearTransform( --Reverse view data
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 0, 15)),


    CAMERA_TRANSFORM = LinearTransform( --third-person view
    Vec3( 1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0.4939870834350586, 0.2902224063873291, -0.11299633979797363)),

    TARGET_OFFSET = Vec3(2.0, 3.0, -11.5),--Third person view target offset

    WANT_DISTANCE = 12, --12 The general idea is that the distance from the aircraft to one's field of view when in third-person view does not affect the size of the aircraft itself; the larger the value, the smaller the fuselage, and the smaller the value, the larger the fuselage.
  },


}