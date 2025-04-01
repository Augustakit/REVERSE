--fighter data
  --F18 data
 F18_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.9798853397369385, -4.482795238494873))

 F18_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, -0.9, 10))


  --SU35 data
 SU35_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1.9803240299224854, -4.482795238494873))

 SU35_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, -0.9, 10))


  --F35data
  F35_CAMERA_TRANSFORM = LinearTransform(  --3p camera, refer to BF4 for data
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 3.5, -12.5834))

 --[[Vec3( 1, 0, 0),                             --3p camera original data
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.2394065856933594, -5.0500664710998535)]]
 F35_RESERVE_CAMERA = LinearTransform(   --reserve camera data，Reference 4 ofdata
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, -1.639597, 20.58347))



--XP5 data
  --F18 Airdata
  F18Air_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.9798853397369385, -4.482795238494873))

 F18Air_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, -0.9, 10))

  --SU35 Airdata
 SU35Air_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1.9803240299224854, -4.482795238494873))

 SU35Air_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, -0.9, 10))



--If you are not satisfied with the initial data, here we offer you the parameters of the BF4 J-20 and SU-57 for you to change your favourite jet.
--J-20 3p camera
 J20_CAMERA_TRANSFORM = LinearTransform(
 Vec3(1, 0, 0),
 Vec3(0, 0.9999999, 0),
 Vec3(0, 0, 0.9999999),
 Vec3(0, 3.948547, -19.95694))

--J-20 3p reserve camera 
 J20_RESERVE_CAMERA = LinearTransform(
  Vec3( -1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, -1),
  Vec3( 0, -2.448547, 28.95694))

--SU-57 3p camera
 SU57_CAMERA_TRANSFORM = LinearTransform(
  Vec3(0.9999999, 0, 0),
  Vec3(0, 0.9999999, 0),
  Vec3(0, 0, 1),
  Vec3(0, 3.5, -13.84489))

--SU-57 3p reserve camera 
 SU57_RESERVE_CAMERA = LinearTransform(
  Vec3( -1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, -1),
  Vec3( 0, -2, 22.84489))





--CAS data
  --A10 data
 A10_CAMERA_TRANSFORM = LinearTransform( --3p camera，Reference 4 of A10 data
  Vec3(1, 0, 0),
  Vec3(0, 0.997564, 0.06975646),
  Vec3(0, -0.06975646, 0.997564),
  Vec3(0, 5.2, -14.73792))

--[[Vec3(1, 0, 0),                           --3p camera original data
  Vec3( 0, 1, -4.4223646966656815e-10),
  Vec3( 0, 4.4223646966656815e-10, 1),
  Vec3( 0, 1.126838207244873, -2.0555620193481445)]]

 A10_RESERVE_CAMERA = LinearTransform(   --reserve camera data，Reference 4 of data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, -2, 26.73792))

  --SU-25 data
 SU25_CAMERA_TRANSFORM = LinearTransform( --3p camera，Reference 4 ofSU25data
  Vec3(1, 0, 0),
  Vec3(0, 0.9984407, 0.0558215),
  Vec3(0, -0.0558215, 0.9984407),
  Vec3(0, 4.5, -8.899711))

--[[Vec3(1, 0, 0),
 Vec3( 0, 1, -4.4223646966656815e-10),
 Vec3( 0, 4.4223646966656815e-10, 1),
 Vec3( 0, 2.2747201919555664, -2.0047173500061035)]]

 SU25_RESERVE_CAMERA = LinearTransform(   --reserve camera data，Reference 4 ofdata
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, -2, 19.89971))




return {
  F18_CAMERA_TRANSFORM = F18_CAMERA_TRANSFORM,
  F18_RESERVE_CAMERA = F18_RESERVE_CAMERA,
  SU35_CAMERA_TRANSFORM = SU35_CAMERA_TRANSFORM,
  SU35_RESERVE_CAMERA = SU35_RESERVE_CAMERA,
  F18Air_CAMERA_TRANSFORM = F18Air_CAMERA_TRANSFORM,
  F18Air_RESERVE_CAMERA = F18Air_RESERVE_CAMERA,
  SU35Air_CAMERA_TRANSFORM = SU35Air_CAMERA_TRANSFORM,
  SU35Air_RESERVE_CAMERA = SU35Air_RESERVE_CAMERA,
  F35_CAMERA_TRANSFORM = F35_CAMERA_TRANSFORM,
  F35_RESERVE_CAMERA = F35_RESERVE_CAMERA,
  A10_CAMERA_TRANSFORM = A10_CAMERA_TRANSFORM,
  A10_RESERVE_CAMERA = A10_RESERVE_CAMERA,
  SU25_CAMERA_TRANSFORM = SU25_CAMERA_TRANSFORM ,
  SU25_RESERVE_CAMERA = SU25_RESERVE_CAMERA,
}