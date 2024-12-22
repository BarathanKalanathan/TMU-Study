t = (-2:0.01:7); %ranges from (-2,3) and the step size is 0.01 for the the time interval
p = @(t) 1.0.*((t>=0)&(t<1)); %Equation of the funtion
r = @(t) t .* p(t);
n = @(t)r(t) + r(-t+2);
n1 = @(t)n(1/2*t);
n2 = @(t)n1(t+1/2);

plot(t,n1(t),'b'); %plots the function
hold on; % need this for multiple graphs
plot(t,n2(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('n1(t) and n2(t)'); %label for the y-axis
title ('Graph for n1(t) and n2(t)')
grid; %shows as a grid
axis([-2 7 -.1 1.1]); %The x-axis intervals
legend ('n1(t)', 'n2(t)'); %indicates the blue and orange graph