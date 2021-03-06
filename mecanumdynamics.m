function [Xp] = mecanumdynamics(t, x)

a = 0.2;  %Center of robot to wheel (Along X)
b = 0.3;  %Center of robot to wheel (Along Y)
l = 0.25;  %Point of robot center to wheel center
r = 0.0508;   %radius of the wheel
mb = 12; %mass of platform
mw = 0.313; %mass of wheel
I = 0.00040378; %moment of inertia of the wheels
Ib = 0.5; %e moment of inertia of the platform
f1 = -0.05;
f2 = 0.05;
f3 = 0.05;
f4 = -0.05;
tow1 = 2;
tow2 = -2;
tow3 = -2;
tow4 = 2;

Xp = zeros(6,1);
Xd = zeros(2,1);

d1 = 0;
d2 = 0;

%% Alpha
alpha = atan(b/a);

%% psi_dot
psi_dot = ((-sqrt(2))/r)*[(sqrt(2)/2) (sqrt(2)/2) (l*sin((pi/4)-alpha));(sqrt(2)/2) (-(sqrt(2)/2)) (l*sin((pi/4)-alpha));(-(sqrt(2)/2)) (-(sqrt(2)/2)) (l*sin((pi/4)-alpha));(-(sqrt(2)/2)) (sqrt(2)/2) (l*sin((pi/4)-alpha))]*[cos(x(3)) sin(x(3)) 0; (-sin(x(3))) cos(x(3)) 0;0 0 1]*[x(4);x(5);x(6)];

psi1_dot = psi_dot(1,1);
psi2_dot = psi_dot(2,1);
psi3_dot = psi_dot(3,1);
psi4_dot = psi_dot(4,1);


%% M matrix

m11 = mb + (4*(mw+(I/(r^2))));
m22 = mb + (4*(mw+(I/(r^2))));
m12 = 0;
m21 = 0;
m13 = mb*((d1*sin(x(3)))+(d2*cos(x(3))));
m31 = mb*((d1*sin(x(3)))+(d2*cos(x(3))));
m23 = mb*(((-d1)*cos(x(3)))+(d2*sin(x(3))));
m32 = mb*(((-d1)*cos(x(3)))+(d2*sin(x(3))));
m33 = (mb*((d1^2)+(d2^2))) + Ib + (8*(l^2)*(mw+(I/(r^2)))*((sin((pi/4)-alpha)))^2);

M = [m11 m12 m13;m21 m22 m23;m31 m32 m33];
M_inv = inv(M)

%% C matrix

c11 = 0;
c12 = 0;
c21 = 0;
c22 = 0;
c31 = 0;
c32 = 0;
c33 = 0;
c13 = (mb*(x(6)))*((d1)*cos(x(3)))-(d2*sin(x(3)));
c23 = (mb*(x(6)))*((d1)*sin(x(3)))+(d2*cos(x(3)));

C_q = [c11 c12 c13;c21 c22 c23;c31 c32 c33];
q_dot = [x(4);x(5);x(6)];

C = C_q*q_dot;


%% B matrix

b_1 = (cos(x(3))-sin(x(3)));
b_2 = (cos(x(3))-sin(x(3)));
b_3 = (cos(x(3))+sin(x(3)));
b_4 = (sin(x(3))-cos(x(3)));
b_5 = (sqrt(2)*l)*(sin((pi/4)-alpha));


b11 = -b_1;
b12 = -b_3;
b13 = -b_5;
b21 = -b_3;
b22 = -b_4;
b23 = -b_5;
b31 = b_2;
b32 = b_3;
b33 = -b_5;
b41 = b_3;
b42 = b_4;
b43 = -b_5;

B = [b11 b12 b13;b21 b22 b23;b31 b32 b33;b41 b42 b43];
B_trans = B.';

%% F matrix

f_transpose =[f1 f2 f3 f4];
F = f_transpose.';


%% S matrix

p1 = sign(psi1_dot);
p2 = sign(psi2_dot);
p3 = sign(psi3_dot);
p4 = sign(psi4_dot);

psi_dot_matrix = [p1 p2 p3 p4];
S = diag(psi_dot_matrix);


%% Tow matrix

Tow_transpose = [tow1 tow2 tow3 tow4];
Tow = Tow_transpose.';


%% State space equation

Statespace = (M_inv*((1/r)*(B_trans)*(Tow))-(C)-((B_trans)*S*F));


%% Equations

%x
Xp(1) = x(4);
Xp(4) = Statespace(1,1);

%y
Xp(2) = x(5);
Xp(5) = Statespace(2,1);


%thetha
Xp(3) = x(6);
Xp(6) = Statespace(3,1);



