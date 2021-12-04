%SUBMARINE BODY

%Input parameters 

V = 0.06328; %Volume of the real body you are aproximating with a spheroid
b = 0.115; %Length of 2 smaller axes

%Constant values

rho = 1000; %Density of water

%Calculating body related variables

a = (3*V)/(4*pi*b^2); %Length of the longer axis
mdf = (4/3)*rho*pi*a*b^2; %mass of displaced fluid
Ixdf = (mdf/5)*(b^2+b^2); %Moment of inertia on the x-axis
Iydf = (mdf/5)*(a^2+b^2); %Moment of inertia on the y-axis
Izdf = (mdf/5)*(a^2+b^2); %Moment of inertia on the z-axis

%Sphere related variables

e = sqrt(1-(b^2/a^2)); %eccentricity
a0 = 2*((1-e^2)/e^3)*((0.5*log((1+e)/(1-e)))-e); %alpha0 coefficient
b0 = (1/e^2)-(((1-e^2)/(2*e^3))*log((1+e)/(1-e))); %beta0 coefficient

% K-coefficients

k1 = a0/(2-a0);
k2 = b0/(2-b0);
k4 = 0;
k5 = (e^4*(b0-a0))/((2-e^2)*(2*e^2-(2-e^2)*(b0-a0)));

% Added masses

m11 = k1*mdf;
m22 = k2*mdf;
m33 = k2*mdf;
m44 = k4*Ixdf;
m55 = k5*Iydf;
m66 = k5*Izdf;

% Added mass matrix

MgapsSB = zeros(6);
MgapsSB(1,1) = m11;
MgapsSB(2,2) = m22;
MgapsSB(3,3) = m33;
MgapsSB(4,4) = m44;
MgapsSB(5,5) = m55;
MgapsSB(6,6) = m66;
MgapsSB