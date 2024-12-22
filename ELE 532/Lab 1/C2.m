u = @(t) 1.0.*(t>=0);
f = @(t) exp(-t).*cos(4*pi*t);
g = @(t) f(t).* u(t);
s = @(t) g(t+1);
t = (-2:0.01:4);                	%interval with 100 points per oscillation

plot(t,g(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('s(t)'); %label for the y-axis
title ('Graph for s(t)')
grid; %shows as a grid
axis([-2 4 -1.25 1.25]); %The x-axis intervals
