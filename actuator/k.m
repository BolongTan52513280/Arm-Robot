thetaD1 = 1;%pi/2;
thetaD2 = 1;%pi/2;

%PID
%Big
K  = 3;%3;%0.4;
Kp = 50;%300;%13.3329;
Ki = 1;
Kd = 10;%110;%44.4393;

%Small
K1  = 3;
Kp1 = 40;%1.7;%8.6953;
Ki1 = 1;
Kd1 = 12;%0.69;%18.9002;

%time
Tstop = 10;

%motor
Lw = 0.514e-3;
Rw = 2.68;

Km = 42.9e-3;

INL = 28.4e-3;
wNL = 5330.*pi./30; %rad/s
Bmotor = Km.*INL./wNL;
Jmotor = 21.2e-7;

%Big

%gear box
iBig = 30; %big motor
Jgear = 0;
Bgear = 0; %TODO

%load
Jload = 0.36; %1kg arm 600mm

Jarm = 0.42136; %7974065931.17e-9; %??

Jbig = Jmotor.*iBig.^2 + Jgear.*iBig.^2 + Jarm + Jload;
Bbig = Bmotor.*iBig.^2 + Bgear.*iBig.^2;

%Small

%gear box
iSmall = 20; %big motor

Jload1 = 0.25.^2;

Jarm1 = 49710813.85e-9;
Jsmall = Jmotor.*iSmall.^2 + Jgear.*iSmall.^2 + Jarm1 + Jload1;
Bsmall = Bmotor.*iSmall.^2 + Bgear.*iSmall.^2;

%dynamics
CF = 1300;

%sensor
Res = 1440./90.*180./pi;%1440;

%driver circuit
%use peak time to approximate 2nd order system
tp = 0.036; %Peak Time (msec)
fv = 22.847;
os = 23.578-fv;
zeta = sqrt(log((os./fv)).^2/(pi.^2+log((os./fv)).^2)); %ζ (pure)
beta = sqrt(1 - zeta.^2);
wn = pi./(beta.*tp.*1e-3); %ωn (rad/s)
ampTF = tf(wn.^2.*fv, [1, 2.*zeta.*wn, wn.^2]);

%DELETE
%Jbig = 0.05;
%Bbig = ;
%Jsmall = 0.05;
%Bsmall = ;

%extra

thetaD3 = pi/4;
ix = 20;
Jarmx = 143742457.22e-9;
Jx = Jmotor.*ix.^2 + Jgear.*iSmall.^2 + Jarmx + Jload1;
Bx = Bmotor.*ix.^2 + Bgear.*iSmall.^2;

K2  = 10;
Kp2 = 50;
Ki2 = 1;
Kd2 = 10;



