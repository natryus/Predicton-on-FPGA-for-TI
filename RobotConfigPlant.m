clear all;


run('rvctools09/startup_rvc');
DegtoRad = pi/180;
RadtoDeg = 180/pi;

%(a) kinematic: link length (m)
L1 = 0.132; %m 
L2 = 0.132;
const=(3*pi/2);
%L3 = 0.025; %m
%A = 0.035; %m
%L4 = L1+A; %m

%(m) dynamic: link mass (kg)
MA=0.500;
MB=0.035;
MC=0.100;

%(I) dynamic: link inertia matrix, symmetric 3x3, about link COG.
IA=[0, 11.87e-4, 0];
IB=[0, 2.126e-4, 2.126e-4];
IC=[0, 6.075e-4, 6.075e-4];

%(r) dynamic: link COG wrt link coordinate frame 3x1
R1=[0, 0, 0];
R2=[L1/2, 0, 0];
R3=[L2/2, 0, 0];

%(B) dynamic: link viscous friction (motor referred)
BA=1.55e-3;
BB=1.187e-2;
BC=1.097e-2;

%(Tc) dynamic: link Coulomb friction
TCA=0;
TCB=0;
TCC=0;

Link1 = Revolute('d', 0, 'a', 0, 'alpha', (-pi/2),'m', MA,'B', BA, 'r', R1, 'I', IA,'Tc', TCA, 'G', 1,'Jm', 0 );
Link2 = Revolute('d', 0, 'a', L1, 'alpha', 0,'m', MB,'B', BB,'r', R2,'I', IB,'Tc', TCB,'G', 1,'Jm', 0 );
Link3 = Revolute('d', 0, 'a', L2, 'alpha', 0,'offset',(-pi/2), 'm', MC,'B', BC,'r', R3,'I', IC,'Tc',TCC,'G', 1,'Jm', 0 );

PhantomOmni = SerialLink([Link1,Link2,Link3], 'name', 'Phantom Omni');

qInitial = [0 0 0];
ts = 0.01;
NTB = 32; NBBP = 14;



