--武直数据
  --AH1Z data
  AH1Z_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5693534016609192, -4.482795238494873))

 AH1Z_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, -0.5693534016609192, 4.482795238494873))

 AH1Z_TARGET_OFFECT = Vec3(0, 3.0, -7.0)--第三人称视角目标偏移，原数据为Vec3(2.799999952316284, 3.0, -7.0) 
 AH1Z_WantDistance = 12 --12 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。

  --mi-28 data
 Mi28_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0, 0))

 Mi28_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 0, 0))

 Mi28_TARGET_OFFECT = Vec3(0, 3.0, -11.5)--第三人称视角目标偏移，原数据为Vec3(4.300000190734863, 3.0, -11.5) 
 Mi28_WantDistance = 25 --12 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。



--scout helicopterdata
  --AH6 data
 AH6_CAMERA_TRANSFORM = LinearTransform( --第三人称视角，参考了BF4的数据
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.774159, -2.759414)) --Here the first data is adjusted so that it is no longer to the right.The original data for BF4 is Vec3( -0.4536046, 1.774159, -2.759414)

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0, 0)]]

 AH6_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 6, 15))

 AH6_TARGET_OFFECT = Vec3(0, 0, 0)--第三人称视角目标偏移，原数据为Vec3(2.0, 2.0, -2.0) 
 AH6_WantDistance = 13 --8 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。



  --Z-11W data
 Z11W_CAMERA_TRANSFORM = LinearTransform( --第三人称视角，参考了BF4的数据
  Vec3( 1, -2.980232E-080, 0),
  Vec3( 5.960464E-08, 1, -3.72529E-09),
  Vec3( 0, -1.862645E-09, 1),
  Vec3( 0, 1.695798, -5.588745)) --Here the first data is adjusted so that it is no longer to the right.The original data for BF4 is Vec3( -0.4312353, 1.695798, -5.588745)

  --[[Vec3( 1, 0, 0),                        --第三人称视角原始数据
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0, 0)]]

 Z11W_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 6, 15))

 Z11W_TARGET_OFFECT = Vec3(0, 0, 0)--第三人称视角目标偏移，原数据为Vec3(2.0, 3.0, -2.0) 
 Z11W_WantDistance = 14 --10 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。




--transport plane data
  --UH-1Y VENOM data
 Venom_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, -1.4959161281585693, -3.123964309692383))

 Venom_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 0, 15))

 Venom_TARGET_OFFECT = Vec3(2.799999952316284, 3.0, -7.0) --第三人称视角目标偏移原始数据
 Venom_WantDistance = 10 --10 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。

  --KA-60 data
 KA60_CAMERA_TRANSFORM = LinearTransform( --第三人称视角
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0.4939870834350586, 0.2902224063873291, -0.11299633979797363))

 KA60_RESERVE_CAMERA = LinearTransform(   --反转视角数据
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 0, 15))

 KA60_TARGET_OFFECT = Vec3(2.0, 3.0, -11.5)--第三人称视角目标偏移原始数据
 KA60_WantDistance = 12 --12 大致意思为第三人称视角时机身到自己视野的距离，并不影响机身本身大小，数值越大，机身越小，数值越小，机身越大。



return {

  AH1Z_CAMERA_TRANSFORM = AH1Z_CAMERA_TRANSFORM,
  AH1Z_RESERVE_CAMERA =  AH1Z_RESERVE_CAMERA,
  AH1Z_TARGET_OFFECT =  AH1Z_TARGET_OFFECT,
  AH1Z_WantDistance = AH1Z_WantDistance,

  Mi28_CAMERA_TRANSFORM = Mi28_CAMERA_TRANSFORM,
  Mi28_RESERVE_CAMERA = Mi28_RESERVE_CAMERA,
  Mi28_TARGET_OFFECT = Mi28_TARGET_OFFECT,
  Mi28_WantDistance = Mi28_WantDistance,

  AH6_CAMERA_TRANSFORM = AH6_CAMERA_TRANSFORM,
  AH6_RESERVE_CAMERA = AH6_RESERVE_CAMERA,
  AH6_TARGET_OFFECT = AH6_TARGET_OFFECT,
  AH6_WantDistance = AH6_WantDistance,

  Z11W_CAMERA_TRANSFORM = Z11W_CAMERA_TRANSFORM,
  Z11W_RESERVE_CAMERA = Z11W_RESERVE_CAMERA,
  Z11W_TARGET_OFFECT = Z11W_TARGET_OFFECT,
  Z11W_WantDistance = Z11W_WantDistance,

  Venom_CAMERA_TRANSFORM = Venom_CAMERA_TRANSFORM,
  Venom_RESERVE_CAMERA = Venom_RESERVE_CAMERA,
  Venom_TARGET_OFFECT = Venom_TARGET_OFFECT,
  Venom_WantDistance = Venom_WantDistance,

  KA60_CAMERA_TRANSFORM = KA60_CAMERA_TRANSFORM,
  KA60_RESERVE_CAMERA = KA60_RESERVE_CAMERA,
  KA60_TARGET_OFFECT = KA60_TARGET_OFFECT,
  KA60_WantDistance = KA60_WantDistance,

}