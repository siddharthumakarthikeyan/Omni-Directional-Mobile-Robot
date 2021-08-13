%% B matrix

x3 = pi/4;
l = 5;
alpha = pi/10;

b_1 = (cos()-sin(x3));
b_2 = (cos(x3)-sin(x3));
b_3 = (cos(x3)+sin(x3));
b_4 = (sin(x3)-cos(x3));
b_5 = (sqrt(2)*l)*(sin((pi/4)-alpha));


b11 = -b_1;
b12 = -b_3;
b13 = -b_5
b21 = -b_3;
b22 = -b_4;
b23 = -b_5
b31 = b_2;
b32 = b_3;
b33 = -b_5;
b41 = b_3;
b42 = b_4;
b43 = -b_5;

B = [b11 b12 b13;b21 b22 b23;b31 b32 b33;b41 b42 b43]

