return {

  LAVAD = {
   PARTITION_GUID = Guid('0E23F40F-CDB3-4B9E-A36B-BD338CFA35BC'),
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {2},
   CHASE_CAM_COMPONENT_PATH = {3, 2 ,3},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'

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
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {2},
   CHASE_CAM_COMPONENT_PATH = {4, 4 ,4},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'

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
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {3},
   CHASE_CAM_COMPONENT_PATH = {4, 2 ,5},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'

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
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {2},
   CHASE_CAM_COMPONENT_PATH = {3, 6 ,2},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'

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
   -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
   ENTRY_COMPONENT_PATH = {5},
   CHASE_CAM_COMPONENT_PATH = {5, 1 ,1 ,1, 3},
   -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'

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
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 3},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'

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
    -- Paths are relative to the ChassisComponentData  key word "Driver_AI_Entry"
    ENTRY_COMPONENT_PATH = {3},
    CHASE_CAM_COMPONENT_PATH = {3, 2},
    -- Index inside VehicleEntityData for LogicReferenceObject for 'Vehicles\common\SimpleCrosshair'

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