% INPUT PARAMETRS

% Thruster positions

rT1 = [0; 0; 0]; % Position of motor 1 (Vertical thruster)
rT2 = [-0.59; 0.17; 0]; % Position of motor 2 (Right thruster)
rT3 = [-0.59; -0.17; 0]; % Position of motor 3 (Left thruster)

% THRUSTER MAPPING

% Thruster position vectors

rgT1 = -rT1; % Distance between Thruster 1 body frame and the CG
rgT2 = -rT2; % Distance between Thruster 2 body frame and the CG
rgT3 = -rT3; % Distance between Thruster 3 body frame and the CG

% Thruster mapping matrix

Eb = [0         1         1;
      0         0         0;
      1         0         0;
      0         0         0;
      0         0         0;
      0         rgT2(2)   rgT3(2)]
  
pinv(Eb);