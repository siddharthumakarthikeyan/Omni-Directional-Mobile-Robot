%% C matrix


mb = 5;
d1 = 6;
d2 = 3;
x3 = pi/4;
x6 = pi/4;


c11 = 0;
c12 = 0;
c21 = 0;
c22 = 0;
c31 = 0;
c32 = 0;
c33 = 0;
c13 = (mb*x6)*((d1)*cos(x3))-(d2*sin(x3));
c23 = (mb*x6)*((d1)*sin(x3))+(d2*cos(x3));

C_q = [c11 c12 c13;c21 c22 c23;c31 c32 c33];
q_dot = [x4;x5;x6];

C = C_q*q_dot;