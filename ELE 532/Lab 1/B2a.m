u = @(t) 1.0.*(t>=0);
t = (-1:0.01:2); %ranges from (-1,2) and the step size is 0.01 for the the time interval
p = @(t) 1.0.*((t>=0)&(t<1)); %Equation of the funtion
r = @(t) t .* p(t); 


plot(t,r(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('r(t) = t*p(t)'); %label for the y-axis
title ('Graph for r(t) = tp(t)')
grid; %shows as a grid
axis([-1 2 -.1 1.1]); %The x-axis intervals