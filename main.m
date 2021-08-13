clear all
close all
clc

f1=@mecanumdynamics;

Tf=5;
T=[0:0.01:Tf];

x0 = [0 0 0 0 0 0];
xd = [0 0];

[t,x] = ode45(f1, T, x0);


%%PLOT
figure(1)
subplot(3,2,1)
plot(t, x(:,1))
title('x')
grid

subplot(3,2,2)
plot(t, x(:,4))
title('xdot')
grid

subplot(3,2,3)
plot(t, x(:,2))
title('y')
grid

subplot(3,2,4)
plot(t, x(:,5))
title('ydot')
grid

subplot(3,2,5)
plot(t, x(:,3))
title('thetha')
grid

subplot(3,2,6)
plot(t, x(:,6))
title('Thethadot')
grid


%Animation
 l =0.4;
 w = 0.2;
 mr_co = [-l/2,l/2,l/2,-l/2,-l/2;
          -w/2,-w/2,w/2,w/2,-w/2];
      
 figure(2)
 for i = 1:length(t)
     psi = x(i,3);
     R_psi = [cos(psi),-sin(psi);
              sin(psi),cos(psi);];
     v_pos = R_psi*mr_co;
     fill(v_pos(1,:)+x(i,1),v_pos(2,:)+x(i,2),'g')
     hold on, grid on
     axis([-3 3 -1 3]), axis square
     plot(x(1:i,1),x(1:i,2),'b-');
     legend('MR','Path')
     set(gca,'fontsize',24)
     xlabel('x,[m]'); ylabel('y,[m]');
     pause(0.1);
     hold off
 end
 
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     