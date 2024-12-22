t = (-2:0.01:5); %ranges from (-2,3) and the step size is 0.01 for the the time interval
p = @(t) 1.0.*((t>=0)&(t<1)); %Equation of the funtion
r = @(t) t .* p(t);
n = @(t)r(t) + r(-t+2);
n3 = @(t)n(t+1/4);
n4 = @(t)n3(t*1/2);

plot(t,n3(t),'b'); %plots the function
hold on; % need this for multiple graphs
plot(t,n4(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('n3(t) and n4(t)'); %label for the y-axis
title ('Graph for n3(t) and n4(t)')
grid; %shows as a grid
axis([-2 5 -.1 1.1]); %The x-axis intervals
legend ('n3(t)', 'n4(t)'); %indicates the blue and orange graph