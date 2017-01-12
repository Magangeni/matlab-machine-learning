% Compute mass properties for F-16
mass = 12000;

b = [0 0 1;1 0  0;0 -1 0];

RotateOBJFile( 'F16.obj', [], b, 15.03 );
inr = InertiaFromOBJFile( 'F16_R', mass, 1 )

