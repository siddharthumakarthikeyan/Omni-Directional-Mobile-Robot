%% S matrix


p1 = sign(psi1_dot);
p2 = sign(psi2_dot);
p3 = sign(psi3_dot);
p4 = sign(psi4_dot);

psi_dot = [p1 p2 p3 p4];
S = diag(psi_dot);


%% Tow matrix

Tow_transpose = [tow1 tow2 tow3 tow4];
Tow = Tow_transpose.';

%% f matrix

f_transpose =[f1 f2 f3 f4];
F = f_transpose.';
