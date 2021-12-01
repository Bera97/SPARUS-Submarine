syms x;

%% Initialisation

%We will consider Cd, Cf and Re constant for the time being.
%!! We will adapt the value later if we have time

Re= 10000; %Reynolds number, arbitrary
Cf= 0.027/(Re^(1/7)); %friction coeff
V=1.5; %velocity, arbitrary
rho=1000;

%% Main body:

L = 1.6; % Total length of the submarine
R = 0.115; % Radius of the submarine

Cd_surge= 0.125; %because L/2R~7
Cd_sway= 0.3; %because circular rod
Cd_heave= Cd_sway; %because symmetry

K_main=zeros(6); %initialise an empty K matrix

S1a=pi*R^2; %surface of the first coeff
%We use the projected surface for the 2d and 3d coeff as the first one
S1b=2*R*L;
S1c=S1b;

K_main(1,1)= 1/2*rho*S1a*Cd_surge;
K_main(2,2)= 1/2*rho*Cd_sway*S1b;
K_main(3,3)= 1/2*rho*Cd_heave*S1c;
K_main(4,4)= Cf*(2*pi*R*L);
K_main(5,5)= int((x^2)*K_main(3,3), [-L/2,L/2]);
K_main(6,6)= int((x^2)*K_main(2,2), [-L/2,L/2]);
K_main(3,5)= int(x*K_main(3,3),[-L/2,L/2]);
K_main(5,3)=K_main(3,5);
K_main(2,6)= int(x*K_main(3,3), [-L/2,L/2]);
K_main(6,2)=K_main(2,6);

disp('K_main')
disp(K_main)

%% Antenna

W2 = 0.035; %Width of the Antena
H2 = 0.261; %Height of the Antena
T2 = 0.069; %Thickness of the Antena

Cd_surge= 2.2; %because T2/H2~0.26
Cd_sway= 2; %because W2/H2~0.13
Cd_heave= 2.5; %because W2/T2~0.5

K_antenna=zeros(6); %initialise an empty K matrix

S2a=H2*W2; %surface of the first coeff
S2b=H2*T2;
S2c=W2*T2;

K_antenna(1,1)= 1/2*rho*S2a*Cd_surge;
K_antenna(2,2)= 1/2*rho*Cd_sway*S2b;
K_antenna(3,3)= 1/2*rho*Cd_heave*S2c;
K_antenna(4,4)= Cf*(2*(H2*W2)+W2*T2);
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

Cd_surge= 0.3; %because circular rod
Cd_sway= Cd_surge; %because circular rod
Cd_heave= 2.3; %because H3/2R3~0.95

K_USBL=zeros(6); %initialise an empty K matrix

S3a=2*R3*H3; %surface of the first coeff
S3b=H3*2*R3;
S3c=pi*R3^2;

K_USBL(1,1)= 1/2*rho*S3a*Cd_surge;
K_USBL(2,2)= Cd_sway*1/2*rho*S3b;
K_USBL(3,3)= Cd_heave*1/2*rho*S3c;
K_USBL(4,4)= Cf*(2*(2*R3*H3)+pi*R3^2);
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

Cd_surge= 0.3; %because circular rod
Cd_sway= Cd_surge; %because circular rod
Cd_heave= 2.4; %because H4/2R4~0.95

K_QQ=zeros(6); %initialise an empty K matrix

S4a=2*R4*H4; %surface of the first coeff
S4b=2*R4*H4;
S4c=pi*R4^2;

K_QQ(1,1)= 1/2*rho*S4a*Cd_surge;      
K_QQ(2,2)= Cd_sway*1/2*rho*S4b;
K_QQ(3,3)= Cd_heave*1/2*rho*S4c;
K_QQ(4,4)= Cf*(2*(2*R4*H4)+pi*R4^2);
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

Cd_surge= 0.17; %because L5/2R5~2.7
Cd_sway= 0.3; %because circular rod
Cd_heave= Cd_sway; %because symmetry

S5a=pi*R5^2; %surface of the first coeff
S5b=2*W5*L5;
S5c=2*R5*L5;

K_M1(1,1)= 1/2*rho*S5a*Cd_surge;
K_M1(2,2)= Cd_sway*int(f5,[-R5, R5]);
K_M1(3,3)= K_M1(2,2);
K_M1(4,4)= Cf*(2*pi*R5*L5);
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