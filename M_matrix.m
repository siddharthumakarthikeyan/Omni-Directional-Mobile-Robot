%% M Matrix

% mb = 5;
% mw = 5;
% I = 2;
% r = 1;
% d1 = 6;
% d2 = 3;
% x3 = pi/4;
% Ib = 2;
% alpha = pi/6;
% l=10;

m11 = mb + (4*(mw+(I/r^2)));
m22 = mb + (4*(mw+(I/r^2)));
m12 = 0;
m21 = 0;
m13 = mb*((d1*sin(x3))+(d2*cos(x3)));
m31 = mb*((d1*sin(x3))+(d2*cos(x3)));
m23 = mb*(((-d1)*cos(x3))+(d2*sin(x3)));
m32 = m23;
m33 = (mb*((d1^2)+(d2^2))) + Ib + (8*(l^2)*(mw+(I/r^2))*sin((pi/4)-alpha));

M = [m11 m12 m13;m21 m22 m23;m31 m32 m33] 