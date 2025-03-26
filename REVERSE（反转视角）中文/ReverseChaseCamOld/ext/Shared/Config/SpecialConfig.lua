--M1114 HMMWV(HumveeArmored)   7F75FD36-50A3-452C-BC3A-CB1C3E458FAF
 M1114_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(-0.6888092756271362, 1.1296229362487793, -0.2585226595401764))   --Vec3(-0.6888092756271362, 1.1296229362487793, -0.2585226595401764)

 M1114_TARGET_OFFECT = Vec3(0, 0, 1.2999999523162842)--第三人称视角目标偏移，原数据为Vec3(0, 0, 1.2999999523162842) 
 M1114_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( -1.2, 0, 5))

  --M114炮手  7CDE5896-A2A0-4C7E-9893-8AA252789D81
 M1114_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.7, -3)) --Vec3(0, -0.09808516502380371, 0.4861708879470825)

 M1114_GunnerTARGET_OFFECT = Vec3(1.0, 0, 0.029999999329447746)-- 炮手第三人称视角目标偏移 --Vec3(1.0, 0, 0.029999999329447746)



--GAZ-3937 
 GAZ3937_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0.013305723667144775, 0.7222952246665955, 0.04108428955078125))   --0.013305723667144775, 0.7222952246665955, 0.04108428955078125

 GAZ3937_TARGET_OFFECT = Vec3(0, 0, 0)--第三人称视角目标偏移，原数据为Vec3(0, 0.6499999761581421, 0) 
 GAZ3937_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 0, 5))

--GAZ-3937炮手  
 GAZ3937_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.7, -3)) --Vec3(0, -0.09808516502380371, 0.4861708879470825)

 GAZ3937_GunnerTARGET_OFFECT = Vec3(1.0, 0, 0.029999999329447746)-- 炮手第三人称视角目标偏移 --Vec3(1.0, 0, 0.029999999329447746)



  --AAV-7A1驾驶员数据
 AAV_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 2.34451961517334, 1.9013230800628662))

 AAV_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

 AAV_TARGET_OFFECT = Vec3(0, 2.0, -6.5)

  --AAV炮手数据
 AAV_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0.02780759334564209, -0.23745942115783691, -0.3251523971557617))

 AAV_GunnerTARGET_OFFECT = Vec3(1.0, 0, 0.029999999329447746)-- 炮手第三人称视角目标偏移，原数据为 Vec3(1.0, 0, 0.029999999329447746) 



  --HIMARS驾驶员数据
  HIMARS_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
   Vec3(1, 0, 0),
   Vec3(0, 1, 0),
   Vec3(0, 0, 1),
   Vec3(0.014251738786697388, 0.7238799333572388, -5))

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0.014251738786697388, 0.7238799333572388, -0.3216359615325928)]]
  HIMARS_RESERVE_CAMERA = LinearTransform(   --反转视角数据
   Vec3(-1, 0, 0),
   Vec3( 0, 1, 0),
   Vec3( 0, 0,-1),
   Vec3( 0, 2, 5))

  HIMARS_TARGET_OFFECT = Vec3( 0, 0.6499999761581421, 0)


  --BM23驾驶员数据
  BM23_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
   Vec3(1, 0, 0),
   Vec3(0, 1, 0),
   Vec3(0, 0, 1),
   Vec3(-0.09540998935699463, 0.8691021203994751, -5.2))

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( -0.09540998935699463, 0.8691021203994751, -0.13104963302612305)]]
  BM23_RESERVE_CAMERA = LinearTransform(   --反转视角数据
   Vec3(-1, 0, 0),
   Vec3( 0, 1, 0),
   Vec3( 0, 0,-1),
   Vec3( 0, 2, 5))

  BM23_TARGET_OFFECT = Vec3( 0, 0.6499999761581421, 0)



  --RHINO(VanModified)驾驶员数据
  RHINO_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
   Vec3( 1, 0, 0),
   Vec3( 0, 1, 0),
   Vec3( 0, 0, 1),
   Vec3( 0, 0.19579553604125977, -5)) --  Vec3(0, 0.19579553604125977, -0.15000000596046448)]]


  RHINO_RESERVE_CAMERA = LinearTransform(   --反转视角数据
   Vec3(-1, 0, 0),
   Vec3( 0, 1, 0),
   Vec3( 0, 0,-1),
   Vec3( 0, 0, 5))




  --Humvee-ASRAD驾驶员数据
  ASRAD_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
   Vec3(1, 0, 0),
   Vec3(0, 1, 0),
   Vec3(0, 0, 1),
   Vec3(-0.6888092756271362, 1.1296229362487793, -0.2585226595401764))

  ASRAD_TARGET_OFFECT = Vec3(0, 0, 1.2999999523162842)  -- 目标偏移数据
  ASRAD_RESERVE_CAMERA = LinearTransform(   --反转视角数据
   Vec3(-1, 0, 0),
   Vec3( 0, 1, 0),
   Vec3( 0, 0,-1),
   Vec3( -1.2, 0, 5))

  --Humvee-ASRAD炮手数据
 ASRAD_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.7, -3)) --Vec3( 0, -0.09808516502380371, 0.4861708879470825)

 ASRAD_GunnerTARGET_OFFECT = Vec3(1.0, 0.5, -0.5)-- 炮手第三人称视角目标偏移


  --VodnikPhoenix驾驶员数据
 VodnikPhoenix_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0.013305723667144775, 0.7222952246665955, 0.04108428955078125))

 VodnikPhoenix_TARGET_OFFECT = Vec3(0, 0.6499999761581421, 0) --目标偏移数据
 VodnikPhoenix_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0.02, 1.3, 5))

  --VodnikPhoenix炮手数据
 VodnikPhoenix_GunnerCAMERA_TRANSFORM = LinearTransform( -- 炮手第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.7, -2.5)) --  Vec3( 0, -0.09808516502380371, 0.4861708879470825)

 VodnikPhoenix_GunnerTARGET_OFFECT = Vec3(1.0, 1.0, -1.0)-- 炮手第三人称视角目标偏移



return{
M1114_CAMERA_TRANSFORM = M1114_CAMERA_TRANSFORM,
M1114_GunnerCAMERA_TRANSFORM = M1114_GunnerCAMERA_TRANSFORM,
M1114_GunnerTARGET_OFFECT = M1114_GunnerTARGET_OFFECT,
M1114_RESERVE_CAMERA = M1114_RESERVE_CAMERA,
M1114_TARGET_OFFECT = M1114_TARGET_OFFECT,
GAZ3937_CAMERA_TRANSFORM = GAZ3937_CAMERA_TRANSFORM,
GAZ3937_GunnerCAMERA_TRANSFORM = GAZ3937_GunnerCAMERA_TRANSFORM,
GAZ3937_GunnerTARGET_OFFECT = GAZ3937_GunnerTARGET_OFFECT,
GAZ3937_RESERVE_CAMERA = GAZ3937_RESERVE_CAMERA,
GAZ3937_TARGET_OFFECT = GAZ3937_TARGET_OFFECT,
AAV_CAMERA_TRANSFORM = AAV_CAMERA_TRANSFORM,
AAV_RESERVE_CAMERA = AAV_RESERVE_CAMERA,
AAV_TARGET_OFFECT = AAV_TARGET_OFFECT,
AAV_GunnerCAMERA_TRANSFORM = AAV_GunnerCAMERA_TRANSFORM,
AAV_GunnerTARGET_OFFECT = AAV_GunnerTARGET_OFFECT,
HIMARS_CAMERA_TRANSFORM = HIMARS_CAMERA_TRANSFORM,
HIMARS_RESERVE_CAMERA = HIMARS_RESERVE_CAMERA,
HIMARS_TARGET_OFFECT = HIMARS_TARGET_OFFECT,
BM23_CAMERA_TRANSFORM = BM23_CAMERA_TRANSFORM,
BM23_RESERVE_CAMERA = BM23_RESERVE_CAMERA,
BM23_TARGET_OFFECT = BM23_TARGET_OFFECT,
RHINO_CAMERA_TRANSFORM = RHINO_CAMERA_TRANSFORM,
RHINO_RESERVE_CAMERA  = RHINO_RESERVE_CAMERA,
ASRAD_CAMERA_TRANSFORM = ASRAD_CAMERA_TRANSFORM,
ASRAD_GunnerCAMERA_TRANSFORM = ASRAD_GunnerCAMERA_TRANSFORM,
ASRAD_GunnerTARGET_OFFECT = ASRAD_GunnerTARGET_OFFECT,
ASRAD_RESERVE_CAMERA = ASRAD_RESERVE_CAMERA,
ASRAD_TARGET_OFFECT = ASRAD_TARGET_OFFECT,
VodnikPhoenix_CAMERA_TRANSFORM = VodnikPhoenix_CAMERA_TRANSFORM,
VodnikPhoenix_GunnerCAMERA_TRANSFORM = VodnikPhoenix_GunnerCAMERA_TRANSFORM,
VodnikPhoenix_GunnerTARGET_OFFECT =VodnikPhoenix_GunnerTARGET_OFFECT,
VodnikPhoenix_RESERVE_CAMERA = VodnikPhoenix_RESERVE_CAMERA,
VodnikPhoenix_TARGET_OFFECT = VodnikPhoenix_TARGET_OFFECT,

}

