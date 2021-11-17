% INPUT PARAMETERS

L = 1.6; % Total length of the submarine
R = 0.115; % Radius of the submarine
m = 52; % Submarine mass

R1 = 0.029; %Radius of the USBL
H1 = 0.055; %Height of the USBL

R2 = 0.029; %Radius of the QQ
H2 = 0.0355; %Height of the QQ

W3 = 0.069; %Width of the Antena
H3 = 0.261; %Height of the Antena
T3 = 0.035; %Thickness of the Antena

L4 = 0.241; % Aproximatve length of the thruster assembly
R4 = 0.045; % Aproximative radius of the thruster assembly
W4 = 0.106; % Aproximative width of the thruster assembly

Ig = [0.4 0 0.04; 0 10.06 0; 0.04 0 10.07]; % Inertia matrix of the submarine

rho = 1000; % Water density 

% DISTANCE BETWEEN CG AND DIFFERENT CO'S - rg VECTORS

rgSB = [-0.0548; 0; 0]; % Distance between Submarine body frame and the CG
rgUSBL = [-0.44; 0; 0.14]; % Distance between USBL bidy frame and the CG
rgQQ = [-0.7032; 0; 0.13]; % Distance between QQ bidy frame and the CG
rgANT = [0.3903; 0; 0.245]; % Distance between Antena bidy frame and the CG
rgRT = [0.49; -0.162; 0]; % Distance between Right Thruster bidy frame and the CG
rgLT = [0.49; 0.162; 0]; % Distance between Left Thruster bidy frame and the CG

% BODY MASS MATRIX (in the center of gravity)

M = [52 52 52]; % mass vector - not important
MBb = [diag(M) zeros(3); zeros(3) Ig]; % BODY MASS MATRIX

% ADDED MASS MATRIX OF THE SUBMARINE BODY

MbamSB = Submarine_body_added_mass(R, L, rho); % added mass matrix - CO
MgamSB = applytogravityc(rgSB, MbamSB); % added mass matrix - CG

% ADDED MASS MATRIX OF THE USBL

MbamUSBL = Submarine_body_added_mass(R1, H1, rho); % added mass matrix - CO
MgamUSBL = applytogravityc(rgUSBL, MbamUSBL); % added mass matrix - CG

% ADDED MASS MATRIX OF THE QQ

MbamQQ = Submarine_body_added_mass(R2, H2, rho); % added mass matrix - CO
MgamQQ = applytogravityc(rgQQ, MbamQQ); % added mass matrix - CG

% ADDED MASS MATRIX OF THE ANTENA

MbamANT = Antena_added_mass(W3, H3, T3, rho); % added mass matrix - CO
MgamANT = applytogravityc(rgANT, MbamANT); % added mass matrix - CG

% ADDED MASS MATRIX OF THE RIGHT THRUSTER

MbamT = Thruster_added_mass(R4, L4, W4, rho); % added mass matrix - CO
MgamRT = applytogravityc(rgRT, MbamT); % added mass matrix - CG

% ADDED MASS MATRIX OF THE LEFT THRUSTER

MgamLT = applytogravityc(rgLT, MbamT); % added mass matrix - CG

% ADDED MASS MATRIX OF THRUSTERS

MgamT = MgamLT + MgamRT; % added mass matrix - CG

% ADDED MASS MATRIX (in the center of gravity)

MAb = MgamT + MgamANT + MgamQQ + MgamUSBL + MgamSB % ADDED MASS MATRIX

% GENERALIZED MASS MATRIX (in the center of gravity)

MGb = MBb + MAb % GENERALIZED MASS MATRIX