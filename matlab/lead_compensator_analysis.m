clc;
clear;
close all;

%% Plant G(s) = 1 / (s (s + 6))
numG = 1;
denG = [1 6 0];
G = tf(numG, denG);

%% Lead compensator: C(s) = Kc * (s + z) / (s + p)
Kc = 11;
z = 3;
p = 2;
numC = Kc * [1 z];
denC = [1 p];
C = tf(numC, denC);

%% Uncompensated closed-loop (unity feedback)
T_uncomp = feedback(G, 1);

%% Compensated open-loop and closed-loop
L = series(C, G);
T_comp = feedback(L, 1);

%% Step response information
info_uncomp = stepinfo(T_uncomp);
info_comp = stepinfo(T_comp);

fprintf('Uncompensated system:\n');
fprintf(' Rise time = %.4f s\n', info_uncomp.RiseTime);
fprintf(' Settling time = %.4f s\n', info_uncomp.SettlingTime);
fprintf(' Overshoot = %.2f %%\n\n', info_uncomp.Overshoot);

fprintf('With lead compensator:\n');
fprintf(' Rise time = %.4f s\n', info_comp.RiseTime);
fprintf(' Settling time = %.4f s\n', info_comp.SettlingTime);
fprintf(' Overshoot = %.2f %%\n\n', info_comp.Overshoot);

%% Step responses
figure;
step(T_uncomp, 'r', T_comp, 'b');
legend('Uncompensated', 'Lead compensated');
title('Step Responses: Uncompensated vs Lead Compensated');
grid on;

%% Root locus
figure;
rlocus(G);
title('Root Locus - Uncompensated');
grid on;

figure;
rlocus(L);
title('Root Locus - Lead Compensator');
grid on;

%% Bode plots
figure;
bode(G);
title('Bode Plot - Uncompensated');
grid on;

figure;
bode(L);
title('Bode Plot - Lead Compensated');
grid on;

%% Pole-zero map of compensated closed-loop
figure;
pzmap(T_comp);
title('Pole-Zero Map - Lead Compensated Closed-Loop');
grid on;