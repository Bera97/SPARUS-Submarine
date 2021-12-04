function Para=Parameters()

Global_Mass_Matrix;
Thruster_Mapping;
Drag_Matrix;

global Para

%% Initial Speed and position in Earth-fixed frame

Para.ICPos = [0 0 2 0 0 0];
Para.ICSpeed = [0 0 0 0 0 0] ;

%% General parameters
Para.rho_water = 1000 ;                     % Masse volumique de l'eau (kg/m^3)
Para.R = 0.115 ;                             % Sparus Radius (m)
Para.L = 1.6;  	                            % Sparus length (m)
Para.m = 52 ; 	                            % Sparus mass (kg)
Para.mb = 52.1;                           	% Sparus buoyancy mass  (kg) 
Para.g = 9.81 ;                             % Earth Gravity (m*s^(-2))
Para.P = Para.m * Para.g;	                % Sparus weight (N)
Para.B = Para.mb * Para.g;	                % Buoyancy (N)

%% Center of gravity and Buoyancy position in body-fied frame

Para.xg = 0 ;    %x-positon of Center of gravity
Para.yg = 0 ;    %y-positon of Center of gravity
Para.zg = 0 ;    %z-positon of Center of gravity

Para.rg = [Para.xg Para.yg Para.zg]' ;


Para.xb = 0      ;    % x-positon of Center of Buoyancy
Para.yb = 0      ;    % y-positon of Center of Buoyancy
Para.zb = -0.02  ;    % z-positon of Center of Buoyancy

Para.rb = [Para.xb Para.yb Para.zb]' ;

%% Body positions

% Submarine body S0
Para.S0.r=0*rgSB; % Position (m)
% Antena S1
Para.S1.r=rgANT; % Position (m)
% QQ S2
Para.S2.r=rgQQ; % Position (m)
% USBL S3
Para.S3.r=rgUSBL; % Position (m)
% Left thruster S4
Para.S4.r=rgLT; % Position (m)
% Right thruster S5
Para.S5.r=rgRT; % Position (m)

%% Body Mass matrices


% Main Body S0;
%Para.S0.m= 1; 
%Para.S0.I_xx = 1;    
%Para.S0.I_yy = 1;    
%Para.S0.I_zz = 1;    

%Para.S0.Mb = -diag([Para.S0.m Para.S0.m Para.S0.m Para.S0.I_xx Para.S0.I_yy Para.S0.I_zz]) ; 

% First Body S1;
%Para.S1.m= 1; 
%Para.S1.I_xx = 1;    
%Para.S1.I_yy = 1;    
%Para.S1.I_zz = 1;    

%Para.S1.Mb = -diag([Para.S1.m Para.S1.m Para.S1.m Para.S1.I_xx Para.S1.I_yy Para.S1.I_zz]) ; 

% Second Body S2;
%Para.S2.m= 1; 
%Para.S2.I_xx = 1;    
%Para.S2.I_yy = 1;    
%Para.S2.I_zz = 1;    

%Para.S2.Mb = -diag([Para.S2.m Para.S2.m Para.S2.m Para.S2.I_xx Para.S2.I_yy Para.S2.I_zz]) ; 

%% Body added Mass matrices

% Main Body S0;
%Para.S0.ma_u = 0;    % surge
%Para.S0.ma_v = 0;    % sway
%Para.S0.ma_w = 0;    % heave
%Para.S0.ma_p = 0;    % roll
%Para.S0.ma_q = 0;    % pitch
%Para.S0.ma_r = 0;    % yaw

%Para.S0.Ma = -diag([Para.S0.ma_u Para.S0.ma_v Para.S0.ma_w Para.S0.ma_p Para.S0.ma_q Para.S0.ma_r]) ; 

% First Body S1;
%Para.S1.ma_u = 0;    % surge
%Para.S1.ma_v = 0;    % sway
%Para.S1.ma_w = 0;    % heave
%Para.S1.ma_p = 0;    % roll
%Para.S1.ma_q = 0;    % pitch
%Para.S1.ma_r = 0;    % yaw

%Para.S1.Ma = -diag([Para.S1.ma_u Para.S1.ma_v Para.S1.ma_w Para.S1.ma_p Para.S1.ma_q Para.S1.ma_r]) ; 

% Second Body S2;
%Para.S2.ma_u = 0;    % surge
%Para.S2.ma_v = 0;    % sway
%Para.S2.ma_w = 0;    % heave
%Para.S2.ma_p = 0;    % roll
%Para.S2.ma_q = 0;    % pitch
%Para.S2.ma_r = 0;    % yaw

%Para.S2.Ma = -diag([Para.S2.ma_u Para.S2.ma_v Para.S2.ma_w Para.S2.ma_p Para.S2.ma_q Para.S2.ma_r]) ; 

%% Generalized mass matrix

%Para.S0.Mg = Para.S0.Mb + Para.S0.Ma ; 
%Para.S1.Mg = Para.S1.Mb + Para.S1.Ma ;
%Para.S2.Mg = Para.S2.Mb + Para.S2.Ma ;

Para.Mg = MGb;

%Para.Mg = Para.S0.Mg + Para.S1.Mg + Para.S2.Mg ; 

%% Generalized coriolis matrix

% Computed in RovModel.m

%% Friction matrices

% Submarine body S0
%Para.S0.kuu = 0;    % surge
%Para.S0.kvv = 0;    % sway
%Para.S0.kww = 0;    % heave
%Para.S0.kpp = 0;    % roll
%Para.S0.kqq = 0;    % pitch
%Para.S0.krr = 0;    % yaw

Para.S0.Kq = K_main;    %Quadratic friction matrix

% Antena S1
%Para.S1.kuu = 0;    % surge
%Para.S1.kvv = 0;    % sway
%Para.S1.kww = 0;    % heave
%Para.S1.kpp = 0;    % roll
%Para.S1.kqq = 0;    % pitch
%Para.S1.krr = 0;    % yaw

Para.S1.Kq = K_antenna;    %Quadratic friction matrix


% QQ S2
%Para.S2.kuu = 0;    % surge
%Para.S2.kvv = 0;    % sway
%Para.S2.kww = 0;    % heave
%Para.S2.kpp = 0;    % roll
%Para.S2.kqq = 0;    % pitch
%Para.S2.krr = 0;    % yaw

Para.S2.Kq = K_QQ;    %Quadratic friction matrix

% USBL S3
%Para.S3.kuu = 0;    % surge
%Para.S3.kvv = 0;    % sway
%Para.S3.kww = 0;    % heave
%Para.S3.kpp = 0;    % roll
%Para.S3.kqq = 0;    % pitch
%Para.S3.krr = 0;    % yaw

Para.S3.Kq = K_USBL;    %Quadratic friction matrix

% Left thruster S4
%Para.S4.kuu = 0;    % surge
%Para.S4.kvv = 0;    % sway
%Para.S4.kww = 0;    % heave
%Para.S4.kpp = 0;    % roll
%Para.S4.kqq = 0;    % pitch
%Para.S4.krr = 0;    % yaw

Para.S4.Kq = K_M2;    %Quadratic friction matrix

% Right thruster S5
%Para.S5.kuu = 0;    % surge
%Para.S5.kvv = 0;    % sway
%Para.S5.kww = 0;    % heave
%Para.S5.kpp = 0;    % roll
%Para.S5.kqq = 0;    % pitch
%Para.S5.krr = 0;    % yaw

Para.S5.Kq = K_M1;    %Quadratic friction matrix

%% Thruster modelling

%Thruster positions in body-fixed frame

Para.d1x = 0        ; 
Para.d1y = 0        ;
Para.d1z = 0.08     ;
Para.d2x = -0.59    ; 
Para.d2y = 0.17     ;
Para.d2z = 0        ;
Para.d3x = -0.59    ;
Para.d3y = -0.17    ;
Para.d3z = 0        ;


Para.rt1 = [Para.d1x, Para.d1y, Para.d1z]' ;
Para.rt2 = [Para.d2x, Para.d2y, Para.d2z]' ;
Para.rt3 = [Para.d3x, Para.d3y, Para.d3z]' ;


Para.rt = [Para.rt1 Para.rt2 Para.rt3] ;

%Thruster gains

Para.Rkt1 = 28.5;
Para.Rkt2 = 30;
Para.Rkt3 = 30;

Para.Fkt1 = 55;
Para.Fkt2 = 71.5;
Para.Fkt3 = 71.5;


%Thruster gain vectors

Para.RKt=[Para.Rkt1;Para.Rkt2;Para.Rkt3];

Para.FKt=[Para.Fkt1;Para.Fkt2;Para.Fkt3];

%Thruster time constants

Para.Tau1 = 0.4 ;
Para.Tau2 = 0.8 ;
Para.Tau3 = 0.8 ;


%Thruster time constant vectors

Para.Tau = [Para.Tau1;Para.Tau2;Para.Tau3] ;

% Mapping of thruster

%Para.Eb_F = zeros(3,3);
    
%Para.Eb_M = zeros(3,3)  ;

Para.Eb = Eb;

%Para.Eb = [ Para.Eb_F ; Para.Eb_M ] ;

% Inverse Mapping of thruster
Para.Ebinv = pinv(Para.Eb) ;

end





 
           

