t= 0:0.0005:0.1;
h0 = @(t) 44.7*(-exp(-38.2*t)+exp(-261.8*t));
u = @(t) 1.0.*(t>=0);
h = @(t) h0(t).*u(t);

plot(t, h(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('h(t)'); %label for the y-axis
title ('Impulse Response of A.2')
grid; %shows as a grid
axis([0 0.1 -35 0]); %The x-axis intervals