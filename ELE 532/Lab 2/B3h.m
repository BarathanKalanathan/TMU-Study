t = -8:0.0005:8;
u = @(t) 1.0.*(t>=0);
x1 = @(t) exp(t).*(u(t+2) - u(t)); 
x2 = @(t) exp(-2*t).*(u(t)-u(t-1));
x = x1;
h = x2;

figure(1);
plot(t, x1(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('x1(t)'); %label for the y-axis
title ('x1(t)')
grid; %shows as a grid
axis([-3 3 -1.5 1.5]); %The x-axis intervals

figure(2);
plot(t, x2(t)); %plots the function
xlabel('t'); %labels the x-axis
ylabel('x2(t)'); %label for the y-axis
title ('x2(t)')
grid; %shows as a grid
axis([-3 3 -1.5 1.5]); %The x-axis intervals

% CH2MP4.m : Chapter 2, MATLAB Program 4
% Script M-file graphically demonstrates the convolution process.
figure(3) % Create figure window and make visible on screen
dtau = 0.005; tau = -3:dtau:3;
ti = 0; tvec = -3:.1:3;
y = NaN*zeros(1,length(tvec)); % Pre-allocate memory
for t = tvec,
    ti = ti+1; % Time index
    xh = x(t-tau).*h(tau); lxh = length(xh);
    y(ti) = sum(xh.*dtau); % Trapezoidal approximation of convolution integral
    subplot(2,1,1),plot(tau,h(tau),'k-',tau,x(t-tau),'k--',t,0,'ok');
    axis([tau(1) tau(end) -1.5 1.5]);
    patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)],...
        [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
        [.8 .8 .8],'edgecolor','none');
    xlabel('\tau'); title('h(\tau) [solid], x(t-\tau) [dashed], h(\tau)x(t-\tau) [gray]');
    c = get(gca,'children'); set(gca,'children',[c(2);c(3);c(4);c(1)]);
    subplot(2,1,2),plot(tvec,y,'k',tvec(ti),y(ti),'ok');
    xlabel('t'); ylabel('y(t) = \int h(\tau)x(t-\tau) d\tau');
    axis([tau(1) tau(end) -1.5 1.5]); grid;
    %drawnow;
end