function [ MbamANT ] = Antena_added_mass( W, H, T, rho )

syms x;

%Integration coefficients

a11 = 1.7 * pi * rho * (T/2)^2;
a22 = 1.36 * pi * rho * (W/2)^2;
a33 = 0;
a44 = a22;
a55 = a11;
a66 = 0.15 * pi * rho * (W/2)^4;

% Added mass m11

expr1 = x/x;

q1 = int(expr1, [-H/2 H/2]);

m11 = a11 * q1;
m11 = double(subs(m11));

% Added mass m22

m22 = a22 * q1;
m22 = double(subs(m22));

% Added mass m33

m33 = a33;

% Added mass m44

expr2 = x^2;

q2 = int(expr2, [-H/2 H/2]);

m44 = a44 * q2;
m44 = double(subs(m44));

% Added mass m55

m55 = a55 * q2;
m55 = double(subs(m55));

%computing m66_

m66 = a66 * q1;
m66 = double(subs(m66));

% Added mass matrix

MbamANT = zeros(6);
MbamANT(1,1) = m11;
MbamANT(2,2) = m22;
MbamANT(3,3) = m33;
MbamANT(4,4) = m44;
MbamANT(5,5) = m55;
MbamANT(6,6) = m66;
MbamANT;
end

