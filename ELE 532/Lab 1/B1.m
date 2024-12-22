u = @(t) 1.0.*(t>=0);
t = (-1:0.01:2); %ranges from (-1,2) and the step size is 0.01 for the the time interval
p = @(t) 1.0.*((t>=0)&(t<1)); %Equation of the funtion(works somewhat like a boolean exp that returns 1)
plot(t,p(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('p(t) = u(t)-u(t-1)'); %label for the y-axis
title ('Plot for Figure 1.50')
grid; %shows as a grid
axis([-1 2 -.1 1.1]); %The x-axis intervals