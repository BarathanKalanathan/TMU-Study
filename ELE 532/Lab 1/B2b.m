t = (-2:0.01:3); %ranges from (-2,3) and the step size is 0.01 for the the time interval
p = @(t) 1.0.*((t>=0)&(t<1)); %Equation of the funtion
r = @(t) t .* p(t);
n = @(t)r(t) + r(-t+2);

plot(t,n(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('n(t)'); %label for the y-axis
title ('Graph for n(t)')
grid; %shows as a grid
axis([-1 3 -.1 1.1]); %The x-axis intervals