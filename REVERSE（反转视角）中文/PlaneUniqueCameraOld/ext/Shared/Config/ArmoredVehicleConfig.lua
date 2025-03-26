  --LAV-AD驾驶员数据
  LAVAD_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1, -4.5))

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

 LAVAD_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

  --Tunguska驾驶员数据
 Tunguska_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1, -4))

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

 Tunguska_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))



  --M1128驾驶员数据
  M1128_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
   Vec3( 1, 0, 0),
   Vec3( 0, 1, 0),
   Vec3( 0, 0, 1),
   Vec3( 0, 1, -4.0))

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5869722366333008, 0.6874621510505676)]]

  M1128_RESERVE_CAMERA = LinearTransform(   --反转视角数据
   Vec3(-1, 0, 0),
   Vec3( 0, 1, 0),
   Vec3( 0, 0,-1),
   Vec3( 0, 2, 5))

  --SPRUT驾驶员数据
  SPRUT_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
    Vec3(1, 0, 0),
    Vec3(0, 1, 0),
    Vec3(0, 0, 1),
    Vec3(0, 1, -4))

    --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据 
    Vec3( 0, 1, 0),
    Vec3( 0, 0, 1),
    Vec3( 0, 0.5, -0.15000000596046448)]]

  SPRUT_RESERVE_CAMERA = LinearTransform(   --反转视角数据
    Vec3(-1, 0, 0),
    Vec3( 0, 1, 0),
    Vec3( 0, 0,-1),
    Vec3( 0, 2, 5))


return{
LAVAD_CAMERA_TRANSFORM = LAVAD_CAMERA_TRANSFORM,
LAVAD_RESERVE_CAMERA = LAVAD_RESERVE_CAMERA,
Tunguska_CAMERA_TRANSFORM = Tunguska_CAMERA_TRANSFORM,
Tunguska_RESERVE_CAMERA = Tunguska_RESERVE_CAMERA,
M1128_CAMERA_TRANSFORM = M1128_CAMERA_TRANSFORM,
M1128_RESERVE_CAMERA = M1128_RESERVE_CAMERA,
SPRUT_CAMERA_TRANSFORM = SPRUT_CAMERA_TRANSFORM,
SPRUT_RESERVE_CAMERA = SPRUT_RESERVE_CAMERA,
}

