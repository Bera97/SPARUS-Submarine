clear all;
clc;

Global_Mass_Matrix;
Thruster_Mapping;

MaxTF1 = [55; 71.5; 71.5];
MaxTF2 = [55; 71.5; -30];
MaxTF3 = [55; 0; 0];
MaxTF4 = [0; 71.5; 71.5];
MaxTF5 = [0; -30; 71.5];

MaxFM1 = Eb * MaxTF1;
MaxFM2 = Eb * MaxTF2;
MaxFM3 = Eb * MaxTF3;
MaxFM4 = Eb * MaxTF4;
MaxFM5 = Eb * MaxTF5;

MGb

MGbt = MGb;
MGbt(5,1) = 0;
MGbt

x1 = MGb \ MaxFM1
x2 = MGb \ MaxFM2
x3 = MGb \ MaxFM3
x4 = MGb \ MaxFM4
x5 = MGb \ MaxFM5

%x1t = MGbt \ MaxFM1;
%x2t = MGbt \ MaxFM2;
%x3t = MGbt \ MaxFM3;
%x4t = MGbt \ MaxFM4;
%x5t = MGbt \ MaxFM5;

t = 10;

x1_m_rad = x1.*t^2/2

%x1t_m_rad = x1t.*t^2/2

x2_m_rad = x2.*t^2/2
%x2t_m_rad = x2t.*t^2/2

x3_m_rad = x3.*t^2/2
%x3t_m_rad = x3t.*t^2/2

x4_m_rad = x4.*t^2/2
%x4t_m_rad = x4t.*t^2/2

x5_m_rad = x5.*t^2/2
%x5t_m_rad = x5t.*t^2/2