syms x;

%% Initialisation

%We will consider Cd, Cf and Re constant for the time being.
%!! We will adapt the value later if we have time

Re= 10000; %Reynolds number, arbitrary
Cf= 0.027/(Re^(1/7)); %friction coeff
V=0.5; %velocity, arbitrary
rho=1000;

%% Main body:

L = 1.6; % Total length of the submarine
R = 0.115; % Radius of the submarine

Cd_surge= 0.1; %because L/2R~7 Drag coeff
Cd_sway= 2.2; %because 2R/L~0.2
%Cd_heave= Cd_sway; %because 2R/L~0.2 symmetry

K_main=zeros(6); %initialise an empty K matrix

S1=pi*R^2; %surface of the first coeff

f1= 1/2*rho*Cd_sway*2*R*x/x; %function of the second coeff

K_main(1,1)= 1/2*rho*S1*Cd_surge;
K_main(2,2)= int(f1,[-R, R]);
K_main(3,3)= int(f1,[-R, R]);
K_main(4,4)= Cf*2*pi*R*L/2*R^2;
K_main(5,5)= int((x^2)*K_main(3,3), [-L/2,L/2]);
K_main(6,6)= int((x^2)*K_main(2,2), [-L/2,L/2]);
K_main(3,5)= int(x*K_main(3,3),[-L/2,L/2]);
K_main(5,3)=K_main(3,5);
K_main(2,6)= int(x*K_main(3,3), [-L/2,L/2]);
K_main(6,2)=K_main(2,6);

disp('K_main')
disp(K_main)

%% Antenna

W2 = 0.069; %Width of the Antena
H2 = 0.261; %Height of the Antena
T2 = 0.035; %Thickness of the Antena

Cd_surge= 2.2; %because W2/H2~0.26 Drag coeff
Cd_sway= 2.2; %because T2/H2~0.13
Cd_heave= 1.05; %the closest is the cube...

K_antenna=zeros(6); %initialise an empty K matrix

S2=H2*W2; %surface of the first coeff

f2= 1/2*rho*2*T2*x/x; %function of the second coeff

K_antenna(1,1)= 1/2*rho*S2*Cd_surge;
K_antenna(2,2)= Cd_sway*int(f2,[-W2/2, W2/2]);
K_antenna(3,3)= Cd_heave*int(f2,[-H2/2, H2/2]);
K_antenna(4,4)= Cf*(H2*(T2+W2)+W2*T2);
K_antenna(5,5)= int((x^2)*K_antenna(3,3), [-T2/2,T2/2]);
K_antenna(6,6)= int((x^2)*K_antenna(2,2), [-T2/2,T2/2]);
K_antenna(3,5)= int(x*K_antenna(3,3),[-T2/2,T2/2]);
K_antenna(5,3)=K_antenna(3,5);
K_antenna(2,6)= int(x*K_antenna(3,3), [-T2/2,T2/2]);
K_antenna(6,2)=K_antenna(2,6);

disp('K_antenna')
disp(K_antenna)

%% USBL

R3 = 0.029; %Radius of the USBL
H3 = 0.055; %Height of the USBL

Cd_surge= 2.2; %because 2R3/H3~1.05 Drag coeff
Cd_sway= Cd_surge; %because L/R~0.2
Cd_heave= 2.2; %because L/R~0.2

K_USBL=zeros(6); %initialise an empty K matrix

S3=2*pi*R3*H3; %surface of the first coeff

f1= 1/2*rho*2*R3*x/x; %function of the second coeff

K_USBL(1,1)= 1/2*rho*S3*Cd_surge;
K_USBL(2,2)= Cd_sway*int(f1,[-R3, R3]);
K_USBL(3,3)= Cd_heave*int(1/2*rho*H3*x/x,[-H3/2,H3/2]);
K_USBL(4,4)= Cf*(2*pi*R3*H3+pi*pi^2);
K_USBL(5,5)= int((x^2)*K_USBL(3,3), [-R3/2,R3/2]);
K_USBL(6,6)= int((x^2)*K_USBL(2,2), [-R3/2,R3/2]);
K_USBL(3,5)= int(x*K_USBL(3,3),[-R3/2,R3/2]);
K_USBL(5,3)=K_USBL(3,5);
K_USBL(2,6)= int(x*K_USBL(3,3), [-R3/2,R3/2]);
K_USBL(6,2)=K_USBL(2,6);

disp('K_USBL')
disp(K_USBL)

%% QQ

R4 = 0.029; %Radius of the QQ
H4 = 0.0355; %Height of the QQ

Cd_surge= 1.95; %because 2R4/H4~1.63 Drag coeff
Cd_sway= Cd_surge; %because cylinder
Cd_heave= 1; %because H4/2R4~0.61

K_QQ=zeros(6); %initialise an empty K matrix

S4=2*R4*H4; %surface of the first coeff

f4= 1/2*rho*2*R4*x/x; %function of the second coeff

K_QQ(1,1)= 1/2*rho*S4*Cd_surge;      
K_QQ(2,2)= Cd_sway*int(f4,[-R4, R4]);
K_QQ(3,3)= Cd_heave*int(pi*R4^2*x/x,[-H4/2;H4/2]);
K_QQ(4,4)= Cf*(2*pi*R4*H4+pi*R4^2);
K_QQ(5,5)= int((x^2)*K_QQ(3,3), [-R4/2,R4/2]);
K_QQ(6,6)= int((x^2)*K_QQ(2,2), [-R4/2,R4/2]);
K_QQ(3,5)= int(x*K_QQ(3,3),[-R4/2,R4/2]);
K_QQ(5,3)=K_QQ(3,5);
K_QQ(2,6)= int(x*K_QQ(3,3), [-R4/2,R4/2]);
K_QQ(6,2)=K_QQ(2,6);

disp('K_QQ')
disp(K_QQ)

%% Motors

L5 = 0.241; % Aproximatve length of the thruster assembly
R5 = 0.045; % Aproximative radius of the thruster assembly
W5 = 0.106; % Aproximative width of the thruster assembly

    %Motor 1

K_M1=zeros(6); %initialise an empty K matrix

Cd_surge= 0.175; %because L5/2R5~2.7 Drag coeff
Cd_sway= 2.2; %because 2R5/L5~0.37
Cd_heave= 2.2; %because 2R5/L5~0.37

S5=pi*R5^2; %surface of the first coeff

f5= 1/2*rho*Cd_sway*2*R5*x/x; %function of the second coeff

K_M1(1,1)= 1/2*rho*S5*Cd_surge;
K_M1(2,2)= int(f5,[-R5, R5]);
K_M1(3,3)= K_M1(2,2);
K_M1(4,4)= Cf*2*pi*R5*L5/2*R5^2;
K_M1(5,5)= int((x^2)*K_M1(3,3), [-L5/2,L5/2]);
K_M1(6,6)= int((x^2)*K_M1(2,2), [-L5/2,L5/2]);
K_M1(3,5)= int(x*K_M1(3,3),[-L5/2,L5/2]);
K_M1(5,3)=K_M1(3,5);
K_M1(2,6)= int(x*K_M1(3,3), [-L5/2,L5/2]);
K_M1(6,2)=K_M1(2,6);

disp('K_M1')
disp(K_M1)

    %Motor 2

K_M2=K_M1;

disp('K_M2')
disp(K_M2)