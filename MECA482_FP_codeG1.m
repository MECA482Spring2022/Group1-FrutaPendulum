% Group 1 member Daniel V, Isaac P, Phin, Emmett, Jacobhanson

g = 9.81; % gravity m/s^2
% 1 - Arm ; 2 - Pendulum 
m1 = 0.5; m2 = 0.5; % pendulum mass (kg)
La = 0.07; Lp = 0.16; % arms length (m)
M = 0.054; %
J = 3.5256e-4; % mass that is turning Pendulum inertia kg m^2
kb_p = 4.7940e-04 ; 
kb_m = 6.75e-4 ; 
ke = 0.5; 
Re = 14.5; %Medido 
alpha = J + (M+m1/3+m2)*La^2; 
beta = (M + m2/3)*Lp^2; 
gamma = (M + m2/2)*Lp*La; 
sigma = (M + m2/2)*g*Lp; 
%% sims parameters 
initial_state = pi; 
Ts = 0.001; 
dtDisc = 0.01; 
Reference = [0 0 0 0]; 
Zn = 3; %Dead Zone 
StepX = 10; 
distrub = 12; 
disturb = distrub*pi/180; 
%% linearization 
% Ax matrix 
A = zeros(4,4); 
A(1,2) = 1; 
A(2,3) = -(sigma*gamma)/(alpha*beta-gamma^2); 
A(3,4) = 1; 
A(4,3) = (alpha*sigma)/(alpha*beta-gamma^2); 
% B matrix 
B = zeros(4,2); 
B(2,1) = beta/(alpha*beta-gamma^2); 
B(2,2) = -gamma/(alpha*beta-gamma^2); 
B(4,1) = -gamma/(alpha*beta-gamma^2); 
B(4,2) = alpha/(alpha*beta-gamma^2); 
% C matrix 
C = [0 0 1 0; 
 0 0 0 1]; 
%% pseudo_linear_system 
% pseudo Ax matrix 
Ap = zeros(4,4); 
Ap(1,2) = 1; 
Ap(2,1) = 0; Ap(2,2) = -B(2,1)*(ke^2/Re + kb_m); 
Ap(2,3) = A(2,3); Ap(2,4) = -B(2,2)*kb_p; 
Ap(3,4) = 1; 
Ap(4,1) = 0; Ap(4,2) = -B(4,1)*(ke^2/Re + kb_m); 
Ap(4,3) = A(4,3); Ap(4,4) = -B(4,2)*kb_p; 
% Pseudo B matrix 
Bp = zeros(4,1); 
Bp(2) = B(2,1)*ke/Re; 
Bp(4) = B(4,1)*ke/Re; 
% Controlability and Observability 
Control = rank(ctrb(Ap,Bp)); 
Observ = rank(obsv(Ap,C)); 
Q = [0.1 0 0 0; 0 0.01 0 0; 0 0 100 0; 0 0 0 10]; 
R = 10; 
[K, ~, E] = lqr(Ap,Bp,Q,R); 

%% while down (pi) 
% pseudo A matrix 
Ap2 = zeros(4,4); 
Ap2(1,2) = 1; 
Ap2(2,1) = 0; Ap2(2,2) = -B(2,1)*(ke^2/Re + kb_m); 
Ap2(2,3) = A(2,3); Ap2(2,4) = B(2,2)*kb_p; 
Ap2(3,4) = 1; 
Ap2(4,1) = 0; Ap2(4,2) = B(4,1)*(ke^2/Re + kb_m); 
Ap2(4,3) = -A(4,3); Ap2(4,4) = -B(4,2)*kb_p; 
% pseudo B matrix
Bp2 = zeros(4,1); 
Bp2(2) = B(2,1)*ke/Re; 
Bp2(4) = -B(4,1)*ke/Re; 
K2 = place(Ap2,Bp2,[-5 -4 -2+2j -2-2j]); 
R2 = 1; 
Q2=[1 0 0 0; 0 10 0 0; 0 0 1000 0;  0 0 0 10]; 
[K2, ~, E] = lqr(Ap2,Bp2,Q2,R2); 
%% break in code
%The following  is for the Furuta Pendulums broken donw even more
sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
sim.simxFinish(-1); % just in case, close all opened connections
    clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);
if (clientID>-1)
else 
    disp('Failed connecting to remote API server');
    end
    sim.delete(); % call the destructor!
    
    disp('Program ended');
view(135,20) %staring point
AL = 5; %linits of graphs 
axis([-AL AL -AL AL -AL AL]); 
grid on 
La=3; % arm length 
Lp=2; %pendulum length 
Xh=[0 ; La]'; 
Yh=[0 ; 0]'; 
Zh=[0 ; 0]'; 
Xv=[Xh(2) ; La]'; 
Yv=[Yh(2) ; 0]'; 
Zv=[Zh(2) ; -Lp]'; 
hold on 
Harm = fill3(Xh,Yh,Zh,'b'); 
Varm = fill3(Xv,Yv,Zv,'g'); 
s=8; 
M=scatter3(Xv(2),Yv(2),Zv(2),s,'filled','MarkerFaceColor','b','MarkerEdgeColor','k'); 
theta=0; 
phi=0; 
c = [0 0 0]; 
% video 
v = VideoWriter('simulation'); 
open(v); 
TXT=title('Time: '); 
for t=1:10:size(sind(theta),1) 
 TXT2=sprintf('Time:%.2f',sind(t)); 
 set(TXT,'String',TXT2); 
 %
 phi=sim(t); 
 theta =-1*sim(t); 
 %
 Xh(2)= La*cos(phi); 
 Yh(2)=La*sin(phi); 
 %
 Xva = 0; 
 Yva = Lp*sin(theta); 
 Zva = -Lp*cos(theta); 
 %
 Xvb = Xva*cos(phi)-Yva*sin(phi)+La*cos(phi); 
 Yvb = Xva*sin(phi)+Yva*cos(phi) + La*sin(phi); 
 Zvb = Zva; 
 %
 Xv=[Xh(2);Xvb]'; 
 Yv=[Yh(2);Yvb]'; 
 Zv=[ 0 ;Zvb]'; 
 %
 set(Harm,'XData',Xh); 
 set(Harm,'YData',Yh); 
 set(Harm,'ZData',Zh); 
 %
 set(Varm,'XData',Xv); 
 set(Varm,'YData',Yv); 
 set(Varm,'ZData',Zv); 
 %
 rem(t,30) 
 %
 %tracer lines of the pendulum 
 %scatter3(Xv(2),Yv(2),Zv(2),s,'filled','MarkerFaceColor',c,'MarkerEdgeColor','k'); 
 %
 set(M,'XData',Xv(2)); 
 set(M,'YData',Yv(2)); 
 set(M,'ZData',Zv(2)); 
 %
 %save video 
 frame = getframe(gcf); 
 writeVideo(v, frame); 
 if(simt(t) > 5) %break after given time 
 break; 
 end 
end 
close(v);