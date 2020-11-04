% Nonlinear Dynamics and Chaos-Strogatz
% Numerical solution calculated via ode45

%%%%%%%%%%%%%%%%%%%%%%%
%    Example 1
%%%%%%%%%%%%%%%%%%%%%%%
% dx/dt = sin(x)

% sensitive to different initial conditions

ICs = [-2*pi:4/pi:2*pi];
t = 0:1:10;


for i = 1:length(ICs)
    [TOUT(:,i),YOUT(:,i)] = ode45(@(t,x) dxdt(t,x), t, ICs(i));
    plot(TOUT(:,i), YOUT(:,i)); hold on;
end

% [tout,yout] = ode45(@(t,x) dxdt(t,x), [0 100], pi/2);
% plot(tout, yout)

function out = dxdt(t,x)
out = sin(x);
end

