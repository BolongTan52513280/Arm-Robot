k;
s = tf('s');
G1 = ampTF;
Ye = tf(1, [Lw Rw]);
Ym = tf(1, [Jsmall Bsmall]);
G2 = Ye*Ym*Km*iSmall/(1+Ye*Ym*Km*iSmall*Km*iSmall);
G = G1*G2/s;
H = tf(2*CF, [1 2*CF]);

%figure; rla(G*H);

[~,~,PXO,~] = margin(G*H);

p = 2*CF;
Ki = 1;

z = 0.23;
Kp = 2./z - 1./p;
Kd = 1./(z.*z) - Kp./p;
D = Kp + Ki/s + Kd*p*s/(s+p);
%figure; margin(D*G*H);
%figure; nyqlog(D*G*H);

K = 1/abs(freqresp(D*G*H,z));
figure; margin(K*D*G*H);
%figure; nyqlog(K*D*G*H);
%figure; rla(K*D*G*H);

[Ku,~] = margin(D*G*H);

t = 0:1e-4:10;
K1 = 0.01; y1 = step(K1*D*G/(1+K1*D*G*H),t);
K2 = 0.04; y2 = step(K2*D*G/(1+K2*D*G*H),t);
K3 = 0.08; y3 = step(K3*D*G/(1+K3*D*G*H),t);
K4 = 0.02; y4 = step(K4*D*G/(1+K4*D*G*H),t);

figure;
plot(...
    t,y1,...
    t,y2,...
    t,y3,...
    t,y4,...
    'LineWidth',3);
grid on;
legend('K=0.01','K=0.04','K=0.08','K=0.02');

Kp
Ki
Kd