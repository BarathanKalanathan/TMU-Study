% Problem A.1

N = 100;
PulseWidth = 10;
t = 0:(N-1);
x = [ones(1, PulseWidth), zeros(1, N-PulseWidth)];
u = @(t) 1.0 .* (t >= 0);
z = @(t) t .* u(t) - 2 .* (t - 10) .* u(t - 10) + (t - 20) .* u(t - 20);

figure(1);
subplot(2, 1, 1);
stairs(t, x);
title("x(t) = u(t) - u(t-10)");
xlabel('t');
ylabel('x(t)');
grid on;
axis([-2, 25, -0.1, 1.1]);

subplot(2, 1, 2);
plot(t, z(t));
title("z(t) = x(t) * x(t)");
xlabel('t');
ylabel('z(t)');
grid on;
axis([-2, 25, -0.1, 10.1]);


% Problem A.2

N = 100;
PusleWidth = 10;
x = [ones(1, PusleWidth), zeros(1, N-PusleWidth)];
X = fft(x);
Z = (X.*X);

% Problem A.3 

N = 100;
PulseWidth = 10;
x = [ones(1, PulseWidth), zeros(1, N - PulseWidth)];
X = fft(x);
f = (-(N / 2):(N / 2) - 1) * (1 / N);
w = 2 * pi * f;
Z = X .* X;

figure(1);
subplot(2, 1, 1);
plot(w, fftshift(abs(Z)));
title("Magnitude of Z(w)");
xlabel('w');
ylabel('|Z(w)|');
grid on;
axis([-3, 3, -1, 101]);

subplot(2, 1, 2);
plot(w, fftshift(angle(Z)));
title("Angle of Z(w)");
xlabel('w');
ylabel('angle(Z(w))');
grid on;
axis([-3, 3, -4, 4]);


% Problem A.4
N = 100;
PulseWidth = 10;
t = 0:1:(N-1);
x = [ones(1, PulseWidth), zeros(1, N - PulseWidth)];
t_conv = 0:(2 * N - 2);
X = fft(x);
Z = X .* X;

z_tdFunc = conv(x, x);
z_tdFunc = z_tdFunc(1:2*N-1); % Ensure correct length
z_fdFunc = ifft(Z, 'symmetric');

figure(1);
subplot(2, 1, 1);
plot(t_conv, z_tdFunc);
title("z(t) computed using time-domain MATLAB operations");
xlabel('t');
ylabel('z(t)');
grid on;
axis([-5, 20, -0.1, 10.1]);

subplot(2, 1, 2);
plot(t, z_fdFunc(1:N));
title("z(t) computed using frequency-domain MATLAB operations");
xlabel('t');
ylabel('z(t)');
grid on;
axis([-5, 20, -0.1, 10.1]);

% Problem A.5
PulseWidth = 10;
x_width10 = [ones(1, PulseWidth), zeros(1, N - PulseWidth)];
X_width10 = fft(x_width10);

figure(1);
subplot(2, 1, 1);
plot(w, fftshift(abs(X_width10)));
title("Magnitude of X_{width=10}(w)");
xlabel('w');
ylabel('|X_{width=10}(w)|');
grid on;
axis([-3, 3, -0.1, 10.1]);

subplot(2, 1, 2);
plot(w, fftshift(angle(X_width10)));
title("Angle of X_{width=10}(w)");
xlabel('w');
ylabel('angle(X_{width=5}(10))');
grid on;
axis([-3, 3, -3, 3]);


PulseWidth = 5;
x_width5 = [ones(1, PulseWidth), zeros(1, N - PulseWidth)];
X_width5 = fft(x_width5);

figure(2);
subplot(2, 1, 1);
plot(w, fftshift(abs(X_width5)));
title("Magnitude of X_{width=5}(w)");
xlabel('w');
ylabel('|X_{width=5}(w)|');
grid on;
axis([-3, 3, -0.1, 5.1]);

subplot(2, 1, 2);
plot(w, fftshift(angle(X_width5)));
title("Angle of X_{width=5}(w)");
xlabel('w');
ylabel('angle(X_{width=5}(w))');
grid on;
axis([-3, 3, -3, 3]);

PulseWidth = 25;
x_width25 = [ones(1, PulseWidth), zeros(1, N - PulseWidth)];
X_width25 = fft(x_width25);

figure(3);
subplot(2, 1, 1);
plot(w, fftshift(abs(X_width25)));
title("Magnitude of X_{width=25}(w)");
xlabel('w');
ylabel('|X_{width=25}(w)|');
grid on;
axis([-3, 3, -0.1, 25.1]);

subplot(2, 1, 2);
plot(w, fftshift(angle(X_width25)));
title("Angle of X_{width=25}(w)");
xlabel('w');
ylabel('angle(X_{width=25}(w))');
grid on;
axis([-3, 3, -3.5, 3.5]);


% Problem A.6

N = 100;
PulseWidth = 10;
t = 0:(N-1);
x = [ones(1, PulseWidth), zeros(1, N - PulseWidth)];
f = (-(N / 2):(N / 2) - 1) * (1 / N);
w = 2 * pi * f;

w_plus = @(t) x .* exp(1i * (pi / 3) * t);
W_plus = fft(w_plus(t));

w_minus = @(t) x .* exp(-1i * (pi / 3) * t);
W_minus = fft(w_minus(t));

w_c = @(t) x.*cos((pi/3).*t);
W_c = fft(w_c(t));

figure(1);
subplot(2, 1, 1);
plot(w, fftshift(abs(W_plus)));
title("Magnitude of W_+");
xlabel('w');
ylabel('|W_+|');
grid on;
axis([-3, 3, -0.1, 10.1]);

subplot(2, 1, 2);
plot(w, fftshift(angle(W_plus)));
title("Angle of W_+");
xlabel('w');
ylabel('angle(W_+)');
grid on;
axis([-3, 3, -3, 3]);

figure(2);
subplot(2, 1, 1);
plot(w, fftshift(abs(W_minus)));
title("Magnitude of W_-");
xlabel('w');
ylabel('|W_-|');
grid on;
axis([-3, 3, -0.1, 10.1]);

subplot(2, 1, 2);
plot(w, fftshift(angle(W_minus)));
title("Angle of W_-");
xlabel('w');
ylabel('angle(W_-)');
grid on;
axis([-3, 3, -3, 3]);

figure(3);
subplot(2, 1, 1);
plot(w, fftshift(abs(W_c)));
title("Magnitude of W_c");
xlabel('w');
ylabel('|W_-|');
grid on;
axis([-3, 3, -0.1, 10.1]);

subplot(2, 1, 2);
plot(w, fftshift(angle(W_c)));
title("Angle of W_c");
xlabel('w');
ylabel('angle(W_c)');
grid on;
axis([-3, 3, -3, 3]);