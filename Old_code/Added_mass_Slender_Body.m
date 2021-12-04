syms x;

%SUBMARINE BODY

%Input parameters 

L1 = 1.6; %Total length
R = 0.115; %Radius of a cylinder and semi-sphere
L = L1 - 2*R; %Length of the Cylinder

%Constant values

rho = 1000; %Density of water

%Integration coefficients

a22 = rho*pi*R^2;
a33 = a22;
a44 = 0;
a55 = a33;
a66 = a22;

%Computing m22

expr1 = 1-(((x+L/2)^2)/R^2);
expr2 = x/x;
expr3 = 1-(((x-L/2)^2)/R^2);

q1 = int(expr1, [((-L/2)-R) -L/2]);
q2 = int(expr2, [-L/2 L/2]);
q3 = int(expr3, [L/2 (L/2)+R]);

m22 = a22 * (q1+q2+q3);
m22 = double(subs(m22));

%Computing m33

m33 = a33 * (q1+q2+q3);
m33 = double(subs(m33));

%Computing m44

m44 = a44 * (q1+q2+q3);
m44 = double(subs(m44));

%Computing m55

expr4 = x^2*(1-(((x+L/2)^2)/R^2));
expr5 = x^2;
expr6 = x^2*(1-(((x-L/2)^2)/R^2));

q4 = int(expr4, [((-L/2)-R) -L/2]);
q5 = int(expr5, [-L/2 L/2]);
q6 = int(expr6, [L/2 (L/2)+R]);

m55 = a33 * (q4+q5+q6);
m55 = double(subs(m55));

%Computing m66

m66 = a22 * (q4+q5+q6);
m66 = double(subs(m66));

% Added mass matrix

MgasbSB = zeros(6);
MgasbSB(2,2) = m22;
MgasbSB(3,3) = m33;
MgasbSB(4,4) = m44;
MgasbSB(5,5) = m55;
MgasbSB(6,6) = m66;
MgasbSB

% USBL

H = 0.055; %USBL Height
R_ = 0.029; %Radius of the USBL

a11_ = rho*pi*R_^2;
a22_ = a11_;
a66_ = 0;

%computing m11_

expr1_ = x/x;

q1_ = int(expr1_, [-H/2 H/2]);

m11_ = a11_ * q1_;
m11_ = double(subs(m11_));

%computing m22_

m22_ = a22_ * q1_;
m22_ = double(subs(m22_));

%computing m33_

m33_ = 0;

%computing m44_

expr2_ = x^2;

q2_ = int(expr2_, [-H/2 H/2]);

m44_ = a11_ * q2_;
m44_ = double(subs(m44_));

%computing m55_

m55_ = a22_ * q2_;
m55_ = double(subs(m55_));

%computing m66_

m66_ = a66_ * q1_;
m66_ = double(subs(m66_));

% Added mass matrix

MgasbUSBL = zeros(6);
MgasbUSBL(1,1) = m11_;
MgasbUSBL(2,2) = m22_;
MgasbUSBL(3,3) = m33_;
MgasbUSBL(4,4) = m44_;
MgasbUSBL(5,5) = m55_;
MgasbUSBL(6,6) = m66_;
MgasbUSBL

% ??

H_ = 0.0355; %?? Height
R__ = 0.029; %Radius of the ??

a11__ = rho*pi*R__^2;
a22__ = a11_;
a66__ = 0;

%computing m11__

expr1__ = x/x;

q1__ = int(expr1__, [-H_/2 H_/2]);

m11__ = a11__ * q1__;
m11__ = double(subs(m11__));

%computing m22__

m22__ = a22__ * q1__;
m22__ = double(subs(m22__));

%computing m33__

m33__ = 0;

%computing m44__

expr2__ = x^2;

q2__ = int(expr2__, [-H_/2 H_/2]);

m44__ = a11__ * q2__;
m44__ = double(subs(m44__));

%computing m55__

m55__ = a22__ * q2__;
m55__ = double(subs(m55__));

%computing m66__

m66__ = a66__ * q1__;
m66__ = double(subs(m66__));

% Added mass matrix

MgasbQQ = zeros(6);
MgasbQQ(1,1) = m11__;
MgasbQQ(2,2) = m22__;
MgasbQQ(3,3) = m33__;
MgasbQQ(4,4) = m44__;
MgasbQQ(5,5) = m55__;
MgasbQQ(6,6) = m66__;
MgasbQQ

% ANTENA

W = 0.069; %Width of the Antena
H__ = 0.261; %Height of the Antena
T = 0.035; %Thickness of the Antena

% computing coefficients

a11___ = 1.7 * pi * rho * (T/2)^2;
a22___ = 1.36 * pi * rho * (W/2)^2;
a33___ = 0;
a44___ = a22___;
a55___ = a11___;
a66___ = 0.15 * pi * rho * (W/2)^4;

%computing m11___

expr1___ = x/x;

q1___ = int(expr1___, [-H__/2 H__/2]);

m11___ = a11___ * q1___;
m11___ = double(subs(m11___));

%computing m22___

m22___ = a22___ * q1___;
m22___ = double(subs(m22___));

%computing m33___

m33___ = 0;

%computing m44___

expr2___ = x^2;

q2___ = int(expr2___, [-H__/2 H__/2]);

m44___ = a44___ * q2___;
m44___ = double(subs(m44___));

%computing m55___

m55___ = a55___ * q2___;
m55___ = double(subs(m55___));

%computing m66___

m66___ = a66___ * q1___;
m66___ = double(subs(m66___));

% Added mass matrix

MgasbAT = zeros(6);
MgasbAT(1,1) = m11___;
MgasbAT(2,2) = m22___;
MgasbAT(3,3) = m33___;
MgasbAT(4,4) = m44___;
MgasbAT(5,5) = m55___;
MgasbAT(6,6) = m66___;
MgasbAT

% THRUSTER