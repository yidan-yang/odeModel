% prey-predator modol
% numerical solution by using ode45
% all parameters are postive real constant
% prey: dx/dt = a*x - b*x*y
% predator: dy/dt = -d*y + c*x*y

clear 
% parameters
a = 1; % prey growth rate
b = 0.1; % prey death rate when it encountered predator
c = 0.1*b; % predator growth rate(hunt rate)
d = 0.5*a; % predator death rate (prey is the only food source for predator) 

ICs = [30 4];

finaltime = 100; % 100 days
t = 0:1:finaltime; % time range, time interval = 1 day

[T,X] = ode45(@(t,x) dxdt(t,x,a,b,c,d),t,ICs);

% time series plot
fs = 20; % font size
plot(t,X(:,1), 'green', 'LineWidth', 1.4);
hold on;
plot(t,X(:,2), 'blue', 'LineWidth', 1.4)
xlabel('time(day)');
ylabel('population');
legend('x_1(t)','x_2(t)')
title('Prey and Predator Model')
hold off;


% 2D ode set up
function out = dxdt(t,x,a,b,c,d)
out(1,:) = a*x(1) - b*x(1)*x(2); % prey
out(2,:) = -d*x(2) + c*x(1)*x(2);  % predator
end