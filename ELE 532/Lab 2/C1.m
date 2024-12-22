t = -8:0.0005:8;
u = @(t) 1.0.*(t>=0);
h1 = @(t) exp(0.2*t).*u(t);
h2 = @(t) 4*exp(-0.2*t).*u(t);
h3 = @(t) 4*exp(-t).*u(t);
h4 = @(t) 4*(exp(-0.2*t)-exp(-t)).*u(t);

figure(1);
plot(t, h1(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('h1(t)'); %label for the y-axis
title ('h1(t)')
grid; %shows as a grid
axis([-1 6 -1.5 5]); %The x-axis intervals

figure(2);
plot(t, h2(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('h2(t)'); %label for the y-axis
title ('h2(t)')
grid; %shows as a grid
axis([-1 6 -1.5 5]); %The x-axis intervals

figure(3);
plot(t, h3(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('h3(t)'); %label for the y-axis
title ('h3(t)')
grid; %shows as a grid
axis([-1 6 -1.5 5]); %The x-axis intervals

figure(4);
plot(t, h4(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('h4(t)'); %label for the y-axis
title ('h4(t)')
grid; %shows as a grid
axis([-1 6 -1.5 5]); %The x-axis intervals