return {

  LAVAD = {
   PARTITION_GUID = Guid('0E23F40F-CDB3-4B9E-A36B-BD338CFA35BC'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {2},
   CHASE_CAM_COMPONENT_PATH = {3, 2 ,3},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 55,
   CROSSHAIR_LOGIC_INDEX  = 4,
   CROSSHAIR_ERASE_INDEX = 41,

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

   --[[Vec3( 1, 0, 0),                        --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5, -0.15000000596046448)]]
  },


  Tunguska = {
   PARTITION_GUID = Guid('3DB73059-32BD-11E0-931D-8D7AAE81C8B7'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {2},
   CHASE_CAM_COMPONENT_PATH = {4, 4 ,4},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 55,
   CROSSHAIR_LOGIC_INDEX  = 10,
   CROSSHAIR_ERASE_INDEX = 41,

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

   --[[Vec3( 1, 0, 0),                        --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5, -0.15000000596046448)]]
  },



  M1128 = {
   PARTITION_GUID = Guid('3EE37540-9833-11E1-A26B-A2AC6EC60B20'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {3},
   CHASE_CAM_COMPONENT_PATH = {4, 2 ,5},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 55,
   CROSSHAIR_LOGIC_INDEX  = 11,
   CROSSHAIR_ERASE_INDEX = 25,

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

   --[[Vec3( 1, 0, 0),                        --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5869722366333008, 0.6874621510505676)]]
  },


  SPRUT = {
   PARTITION_GUID = Guid('A069F34C-3AE9-4030-8808-29882A555FA1'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {2},
   CHASE_CAM_COMPONENT_PATH = {3, 6 ,2},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 55,
   CROSSHAIR_LOGIC_INDEX  = 22,
   CROSSHAIR_ERASE_INDEX = 67,

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

   --[[Vec3( 1, 0, 0),                        --这里调整了第一个数据，使其不再偏右。采用了BF4的原始数据，原始数据为  
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5, -0.15000000596046448)]]
  },


  RHINO = { --VanModified
   PARTITION_GUID = Guid('193D1786-EC47-11E1-891F-82DA7A0DD2F4'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {5},
   CHASE_CAM_COMPONENT_PATH = {5, 1 ,1 ,1, 3},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'
   AlTERNATEVIEW = 55,
   CROSSHAIR_LOGIC_INDEX  = 15,
   CROSSHAIR_ERASE_INDEX = 17,

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

}