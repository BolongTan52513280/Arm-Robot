% ////////////////////////big motor
%PID    // need to be changed
K  = 3;
Kp = 3;
Ki = 1;
Kd = 6;

%motor
Lw = 0.514e-3;
Rw = 2.68;

Km = 42.9e-3;

INL = 28.4e-3;
wNL = 5330.*pi./30; %rad/s
Bmotor = Km.*INL./wNL;
Jmotor = 21.2e-7;

%gear box
iBig = 30; %big motor
Jgear = 0;
Bgear = 0; %TODO

%load
Jload = 5.4; %15kg arm 600mm

Jarm = 0.42136; %7974065931.17e-9; %??

%dynamics
CF = 1300;

Jbig = Jmotor.*iBig.^2 + Jgear.*iBig.^2 + Jarm + Jload;
Bbig = Bmotor.*iBig.^2 + Bgear.*iBig.^2;

% ////////////////////////samll motor   

path = load('  ');  %file stores location !!!
x1 = path(:,1)';
y1 = path(:,2)';

sampletime = 0.1; % sampletime 
totaltime = (length(x1)-1)*sampletime;
Time = 0:sampletime:totaltime;

