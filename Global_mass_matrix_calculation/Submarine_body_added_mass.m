function [ MbamSB ] = Submarine_body_added_mass( R, L, rho )

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

a22 = rho*pi*R^2;
a33 = a22;
a44 = 0;
a55 = a33;
a66 = a22;

% Added mass m22

expr1 = 1-(((x+L1/2)^2)/R^2);
expr2 = x/x;
expr3 = 1-(((x-L1/2)^2)/R^2);

q1 = int(expr1, [((-L1/2)-R) -L1/2]);
q2 = int(expr2, [-L1/2 L1/2]);
q3 = int(expr3, [L1/2 (L1/2)+R]);

m22 = a22 * (q1+q2+q3);
m22 = double(subs(m22));

% Added mass m33

m33 = a33 * (q1+q2+q3);
m33 = double(subs(m33));

% Added mass m44

m44 = a44 * (q1+q2+q3);
m44 = double(subs(m44));

% Added mass m55

expr4 = x^2*(1-(((x+L1/2)^2)/R^2));
expr5 = x^2;
expr6 = x^2*(1-(((x-L1/2)^2)/R^2));

q4 = int(expr4, [((-L1/2)-R) -L1/2]);
q5 = int(expr5, [-L1/2 L1/2]);
q6 = int(expr6, [L1/2 (L1/2)+R]);

m55 = a55 * (q4+q5+q6);
m55 = double(subs(m55));

% Added mass m66

m66 = a66 * (q4+q5+q6);
m66 = double(subs(m66));

% Added mass matrix

MbamSB = zeros(6);
MbamSB(1,1) = m11;
MbamSB(2,2) = m22;
MbamSB(3,3) = m33;
MbamSB(4,4) = m44;
MbamSB(5,5) = m55;
MbamSB(6,6) = m66;
MbamSB;

end

