
-- tank data
  --M1A2驾驶员数据
 M1A2_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1, -4.5))

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]
 M1A2_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 10))

  --M1A2炮手数据
 M1A2_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 2.2, -5))

 M1A2_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- 炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 




  --T90驾驶员数据
T90_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1, -3))

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

 T90_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 10))

  --T90炮手数据
 T90_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.8, -5))

T90_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- 炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 







--步战车数据
  --LAV-25驾驶员数据
  LAV25_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1, -4.5))

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

 LAV25_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

  --LAV25炮手数据
 LAV25_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 2.2, -5))

  --[[Vec3( 1, 0, 0),                        -- 炮手第三人称视角原始数据  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0, 0)]]

 LAV25_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- 炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 


  --BMP2驾驶员数据
 BMP2_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1, -4))

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

  BMP2_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

  --BMP2炮手数据
 BMP2_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.8, -5))
  --[[Vec3( 1, 0, 0),                        -- 炮手第三人称视角原始数据  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0, 0)]]

 BMP2_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- 炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 




  --BTR90炮手数据
  BTR90_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1, -4.5))
  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

 BTR90_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

 BTR90_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.8, -5))
  --[[Vec3( 1, 0, 0),                        -- 炮手第三人称视角原始数据  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0, 0)]]

 BTR90_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- 炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 



  --LAV-25(XP5)驾驶员数据
  LAV25XP5_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1, -4.5)) --  Vec3( 0, 0.5, -0.15000000596046448)]]

 LAV25XP5_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

  --LAV25(XP5)炮手数据
 LAV25XP5_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 2.2, -5)) --Vec3( 0, 0, 0)

 LAV25XP5_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- 炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 


  --BMP2(XP5)驾驶员数据
 BMP2XP5_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1, -4))   --Vec3( 0, 0.5, -0.15000000596046448)


 BMP2XP5_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

  --BMP2(XP5)炮手数据
 BMP2XP5_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.8, -5))    --Vec3( 0, 0, 0)

 BMP2XP5_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- 炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 



return{
M1A2_CAMERA_TRANSFORM = M1A2_CAMERA_TRANSFORM,
M1A2_RESERVE_CAMERA = M1A2_RESERVE_CAMERA,
M1A2_GunnerCAMERA_TRANSFORM = M1A2_GunnerCAMERA_TRANSFORM,
M1A2_GunnerTARGET_OFFECT = M1A2_GunnerTARGET_OFFECT,
T90_CAMERA_TRANSFORM = T90_CAMERA_TRANSFORM,
T90_RESERVE_CAMERA = T90_RESERVE_CAMERA,
T90_GunnerCAMERA_TRANSFORM =T90_GunnerCAMERA_TRANSFORM,
T90_GunnerTARGET_OFFECT = T90_GunnerTARGET_OFFECT,

LAV25_CAMERA_TRANSFORM = LAV25_CAMERA_TRANSFORM,
LAV25_RESERVE_CAMERA = LAV25_RESERVE_CAMERA,
LAV25_GunnerCAMERA_TRANSFORM = LAV25_GunnerCAMERA_TRANSFORM,
LAV25_GunnerTARGET_OFFECT = LAV25_GunnerTARGET_OFFECT,
BMP2_CAMERA_TRANSFORM = BMP2_CAMERA_TRANSFORM,
BMP2_RESERVE_CAMERA = BMP2_RESERVE_CAMERA,
BMP2_GunnerCAMERA_TRANSFORM = BMP2_GunnerCAMERA_TRANSFORM,
BMP2_GunnerTARGET_OFFECT = BMP2_GunnerTARGET_OFFECT,
BTR90_CAMERA_TRANSFORM= BTR90_CAMERA_TRANSFORM,
BTR90_RESERVE_CAMERA = BTR90_RESERVE_CAMERA,
BTR90_GunnerCAMERA_TRANSFORM = BTR90_GunnerCAMERA_TRANSFORM,
BTR90_GunnerTARGET_OFFECT = BTR90_GunnerTARGET_OFFECT,
LAV25XP5_CAMERA_TRANSFORM = LAV25XP5_CAMERA_TRANSFORM,
LAV25XP5_GunnerCAMERA_TRANSFORM = LAV25XP5_GunnerCAMERA_TRANSFORM,
LAV25XP5_GunnerTARGET_OFFECT = LAV25XP5_GunnerTARGET_OFFECT,
LAV25XP5_RESERVE_CAMERA = LAV25XP5_RESERVE_CAMERA,
BMP2XP5_CAMERA_TRANSFORM = BMP2XP5_CAMERA_TRANSFORM,
BMP2XP5_GunnerCAMERA_TRANSFORM = BMP2XP5_GunnerCAMERA_TRANSFORM,
BMP2XP5_GunnerTARGET_OFFECT = BMP2XP5_GunnerTARGET_OFFECT,
BMP2XP5_RESERVE_CAMERA = BMP2XP5_RESERVE_CAMERA,
}

