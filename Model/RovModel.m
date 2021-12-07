function [AccG] = RovModel(Thrust,PosE,VitB)

global Para


%% Attitudes in earth frame
% z=PosE(3,1);
phi     = PosE(4,1)	;
theta   = PosE(5,1)	;

%% Gravity Force

Fg = 1* [-Para.P * sin(theta) ;
        Para.P * cos(theta)*sin(phi) ;
        Para.P * cos(theta)*cos(phi) ;
        0 ;
        0 ;
        0 ];
    
% Expressed in b and computed in G
    
%% Force d'Archimède

Fa_F = [Para.B * sin(theta) ;
        -Para.B * cos(theta)*sin(phi) ;
        -Para.B * cos(theta)*cos(phi) ;
        ];
%  Expressed in b


Fa_M = S_(Para.rb-Para.rg) * Fa_F ; % Computed in G

Fa = [ Fa_F ; Fa_M ] ;
%  Expressed in b and computed in G

%% Force de Coriolis


p = VitB(4,1)   ;   %Body fixed velocity roll (rad*s^(-1))
q = VitB(5,1)   ;   %Body fixed velocity pitch (rad*s^(-1))
r = VitB(6,1)   ;   %Body fixed velocity yaw (rad*s^(-1))
W_ = [p;q;r]     ;  %General vector


% Wb :
Wb = [  S_(W_)       zeros(3,3) ;
        zeros(3,3)      S_(W_)       ];
    
% General coriolis matrix :
C_all = Wb * Para.Mg ;

%coriolis Force :
Fc = C_all * VitB   ;

%% Friction forces

% Submarine body
Vit_0 = Displace_velocity(Para.S0.r,VitB);
Ffb_0 =  Para.S0.Kq * abs(Vit_0).*Vit_0 ;
Ff_0 = Drag_force_to_gravity_center(Para.S0.r,Ffb_0);

% Antena
Vit_1 = Displace_velocity(Para.S1.r,VitB);
Ffb_1 =  Para.S1.Kq * abs(Vit_1).*Vit_1 ;
Ff_1 = Drag_force_to_gravity_center(Para.S1.r,Ffb_1);

% QQ
Vit_2 = Displace_velocity(Para.S2.r,VitB);
Ffb_2 =  Para.S2.Kq * abs(Vit_2).*Vit_2 ;
Ff_2 = Drag_force_to_gravity_center(Para.S2.r,Ffb_2);

% USBL
Vit_3 = Displace_velocity(Para.S3.r,VitB);
Ffb_3 =  Para.S3.Kq * abs(Vit_3).*Vit_3 ;
Ff_3 = Drag_force_to_gravity_center(Para.S3.r,Ffb_3);

% Left thruster
Vit_4=Displace_velocity(Para.S4.r,VitB);
Ffb_4 =  Para.S4.Kq * abs(Vit_4).*Vit_4 ;
Ff_4 = Drag_force_to_gravity_center(Para.S4.r,Ffb_4);

% Right thruster
Vit_5=Displace_velocity(Para.S5.r,VitB);
Ffb_5 =  Para.S5.Kq * abs(Vit_5).*Vit_5 ;
Ff_5 = Drag_force_to_gravity_center(Para.S5.r,Ffb_5);

%% Propulsions Forces
Fp = Para.Eb * Thrust ;


%% Accelearion computation :
AccG = Para.Mg\ ((1*Ff_0+1*Ff_1+1*Ff_2+1*Ff_3+1*Ff_4+1*Ff_5) + Fa + Fg + Fp - Fc) ; % Mg\ = Mg^-1 computed at the gravity center of the Sparus

