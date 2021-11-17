function [ MbamT ] = Thruster_added_mass( R, L, W, rho )

syms x;

% Surge direction added mass - m11 (using Prolate spheroid theory)

L1 = L - 2*R; %length of a cylinder
V = pi * R^2 * (L1 + (4/3)*R); %Volume of the entire submarine body

% Prolate spheroid parameters

b = R; %Smaller axis length

a = (3*V)/(4*pi*b^2); %longer axis length
mdf = (4/3)*rho*pi*a*b^2; %mass of displaced fluid

e = sqrt(1-(b^2/a^2)); %eccentricity
a0 = 2*((1-e^2)/e^3)*((0.5*log((1+e)/(1-e)))-e); %alpha0 coefficient
b0 = (1/e^2)-(((1-e^2)/(2*e^3))*log((1+e)/(1-e))); %beta0 coefficient

% K-coefficient

k1 = a0/(2-a0);

% Added mass m11

m11 = k1*mdf;

% Other added masses (using Slender Body theory)

%Integration coefficients

a22 = 0;
a33 = rho * pi * (L/2)^2;
a44 = rho * pi * (W/2)^2;
a55 = a33;
a66 = 0;

% Added mass m22

m22 = a22;

% Added mass m33

expr1 = x/x;

q1 = int(expr1, [-W/2 W/2]);

m33 = a33 * q1;
m33 = double(subs(m33));

% Added mass m44

expr2 = x^2;

q2 = int(expr2, [-L/2 L/2]);

m44 = a44 * q2;
m44 = double(subs(m44));

% Added mass m55

expr2 = x^2;

q3 = int(expr2, [-W/2 W/2]);

m55 = a55 * q3;
m55 = double(subs(m55));

% Added mass m66

m66 = a66;

% Added mass matrix

MbamT = zeros(6);
MbamT(1,1) = m11;
MbamT(2,2) = m22;
MbamT(3,3) = m33;
MbamT(4,4) = m44;
MbamT(5,5) = m55;
MbamT(6,6) = m66;
MbamT;
end

