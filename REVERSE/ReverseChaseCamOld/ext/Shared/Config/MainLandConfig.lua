
-- tank data
  --M1A2 pilot data
 M1A2_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1, -4.5))

  --[[Vec3( 1, 0, 0),                        --3p camera original data  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]
 M1A2_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 10))

  --M1A2 gunner data
 M1A2_GunnerCAMERA_TRANSFORM = LinearTransform( -- gunner 3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 2.2, -5))

 M1A2_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- gunner 3p camera target offset, original data is Vec3(1.0, 0, 0.029999999329447746) 




  --T90 pilot data
T90_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1, -3))

  --[[Vec3( 1, 0, 0),                        --3p camera original data  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

 T90_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 10))

  --T90 gunner data
 T90_GunnerCAMERA_TRANSFORM = LinearTransform( -- gunner 3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.8, -5))

T90_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- gunner 3p camera target offset, original data is Vec3(1.0, 0, 0.029999999329447746) 







--IFV data
  --LAV-25 pilot data
  LAV25_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1, -4.5))

  --[[Vec3( 1, 0, 0),                        --3p camera original data  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

 LAV25_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

  --LAV25 gunner data
 LAV25_GunnerCAMERA_TRANSFORM = LinearTransform( -- gunner 3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 2.2, -5))

  --[[Vec3( 1, 0, 0),                        -- gunner 3p camera original data  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0, 0)]]

 LAV25_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- gunner 3p camera target offset, original data is Vec3(1.0, 0, 0.029999999329447746) 


  --BMP2 pilot data
 BMP2_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1, -4))

  --[[Vec3( 1, 0, 0),                        --3p camera original data  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

  BMP2_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

  --BMP2 gunner data
 BMP2_GunnerCAMERA_TRANSFORM = LinearTransform( -- gunner 3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.8, -5))
  --[[Vec3( 1, 0, 0),                        -- gunner 3p camera original data  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0, 0)]]

 BMP2_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- gunner 3p camera target offset, original data is Vec3(1.0, 0, 0.029999999329447746) 




  --BTR90 gunner data
  BTR90_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1, -4.5))
  --[[Vec3( 1, 0, 0),                        --3p camera original data  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0.5, -0.15000000596046448)]]

 BTR90_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

 BTR90_GunnerCAMERA_TRANSFORM = LinearTransform( -- gunner 3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.8, -5))
  --[[Vec3( 1, 0, 0),                        -- gunner 3p camera original data  
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 0, 0)]]

 BTR90_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- gunner 3p camera target offset, original data is Vec3(1.0, 0, 0.029999999329447746) 



  --LAV-25(XP5) pilot data
  LAV25XP5_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1, -4.5)) --  Vec3( 0, 0.5, -0.15000000596046448)]]

 LAV25XP5_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

  --LAV25(XP5) gunner data
 LAV25XP5_GunnerCAMERA_TRANSFORM = LinearTransform( -- gunner 3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 2.2, -5)) --Vec3( 0, 0, 0)

 LAV25XP5_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- gunner 3p camera target offset, original data is Vec3(1.0, 0, 0.029999999329447746) 


  --BMP2(XP5) pilot data
 BMP2XP5_CAMERA_TRANSFORM = LinearTransform( --3p camera
  Vec3(1, 0, 0),
  Vec3(0, 1, 0),
  Vec3(0, 0, 1),
  Vec3(0, 1, -4))   --Vec3( 0, 0.5, -0.15000000596046448)


 BMP2XP5_RESERVE_CAMERA = LinearTransform(   --reserve camera data
  Vec3(-1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0,-1),
  Vec3( 0, 2, 5))

  --BMP2(XP5) gunner data
 BMP2XP5_GunnerCAMERA_TRANSFORM = LinearTransform( -- gunner 3p camera
  Vec3( 1, 0, 0),
  Vec3( 0, 1, 0),
  Vec3( 0, 0, 1),
  Vec3( 0, 1.8, -5))    --Vec3( 0, 0, 0)

 BMP2XP5_GunnerTARGET_OFFECT = Vec3(0, 0, 0)-- gunner 3p camera target offset, original data is Vec3(1.0, 0, 0.029999999329447746) 



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

