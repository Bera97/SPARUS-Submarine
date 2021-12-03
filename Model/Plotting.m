%% here you can implement the code in order to have some figures ...
%%
close all
T= (1:size(PosE,1))*0.01;

figure(1)
set(gcf, 'Name', 'Velocities', 'NumberTitle' ,'off')
subplot(2,1,2)

plot(T,180*VitB_S(:,4)/pi)
hold on
plot(T,180*VitB_S(:,5)/pi)
plot(T,180*VitB_S(:,6)/pi)
hold off
grid on
legend('roll','pitch','yaw')
title('Angular velocities')
xlabel('t [s]');
ylabel('omega [deg/s]');

subplot(2,1,1)

plot(T,VitB_S(:,1))
hold on
plot(T,VitB_S(:,2))
plot(T,VitB_S(:,3))
hold off
grid on
legend('surge','sway','heave')
title('Velocities')
xlabel('t [s]');
ylabel('v [m/s]');


figure(2)
set(gcf, 'Name', 'Positions', 'NumberTitle' ,'off')
subplot(2,1,2)

plot(T,180*PosE_S(:,4)/pi)
hold on
plot(T,180*PosE_S(:,5)/pi)
plot(T,180*PosE_S(:,6)/pi)
hold off
grid on
legend('roll','pitch','yaw')
title('Attitude')
xlabel('t [s]');
ylabel('Angle [deg]');

subplot(2,1,1)

plot(T,PosE_S(:,1))
hold on
plot(T,PosE_S(:,2))
plot(T,PosE_S(:,3))
hold off
grid on
legend('surge','sway','heave')
title('Position')
xlabel('t [s]');
ylabel('Position [m]');


figure(3)
set(gcf, 'Name', 'Accelerations', 'NumberTitle' ,'off')
subplot(2,1,2)

plot(T,180*AccB_S(:,4)/pi)
hold on
plot(T,180*AccB_S(:,5)/pi)
plot(T,180*AccB_S(:,6)/pi)
hold off
grid on
legend('roll','pitch','yaw')
title('Angular acceleration')
xlabel('t [s]');
ylabel('alpha [deg/^2]');

subplot(2,1,1)

plot(T,AccB_S(:,1))
hold on
plot(T,AccB_S(:,2))
plot(T,AccB_S(:,3))
hold off
grid on
legend('surge','sway','heave')
title('Acceleration')
xlabel('t [s]');
ylabel('a [m/s^2]');


figure(4)
set(gcf, 'Name', 'Thruster forces', 'NumberTitle' ,'off')

plot(T,Thrust_S(:,1))
hold on
plot(T,Thrust_S(:,2))
plot(T,Thrust_S(:,3))
hold off
grid on
legend('vertical','right','left')
title('Thruster forces')
xlabel('t [s]');
ylabel('F [N]');