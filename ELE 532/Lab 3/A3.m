%A1 x1(t)
function [DnA1] = findDnA1(n_start, n_end)
        matrix_length = abs(n_start) + abs(n_end) + 1;
        DnA1 = zeros (1, matrix_length);
        array_index_mod = ((abs(n_start) + abs(n_end))/2) + 1;
        for n = n_start:1:n_end
            if n== -1
                Dn = 1/4;
                DnA1(1, n + array_index_mod) = Dn;
            end
            if n == 1
                Dn = 1/4;
                DnA1(1, n + array_index_mod) = Dn;
            end
            if n == 3
                Dn = 1/2;
                DnA1(1, n + array_index_mod) = Dn;
            end 
            if n == -3
                Dn = 1/2;
                DnA1(1, n + array_index_mod) = Dn;
            end
        end
end
% Function for A2 x2(t)
function [DnA2_x2] = findDnA2_x2(n_start, n_end)
    matrix_length = abs(n_start) + abs(n_end) + 1;
    DnA2_x2 = zeros(1, matrix_length);
    array_index_mod = ((abs(n_start) + abs(n_end)) / 2) + 1;
    
    for n = n_start:n_end
        if n == 0
            Dn = 1/2;
        elseif rem(n, 2) == 0
            Dn = 0;
        else
            Dn = (1 / (n * pi)) * sin((pi / 2) * n);
        end
        DnA2_x2(1, n + array_index_mod) = Dn;
    end
end

% Function for A2 x3(t)
function [DnA2_x3] = findDnA2_x3(n_start, n_end)
    matrix_length = abs(n_start) + abs(n_end) + 1;
    DnA2_x3 = zeros(1, matrix_length);
    array_index_mod = ((abs(n_start) + abs(n_end)) / 2) + 1;
    
    for n = n_start:n_end
        if n == 0
            Dn = 1/4;
        elseif rem(n, 4) == 0
            Dn = 0;
        else
            Dn = (1 / (n * pi)) * sin((pi / 4) * n);
        end
        DnA2_x3(1, n + array_index_mod) = Dn;
    end
end

%A.4a
n_start = -5; 
n_end = 5;

% Compute Fourier coefficients for each function
DnA1 = findDnA1(n_start, n_end);
DnA2_x2 = findDnA2_x2(n_start, n_end);
DnA2_x3 = findDnA2_x3(n_start, n_end);

% Frequency index for plotting (from n_start to n_end)
n = n_start:n_end;

% Plot for x1(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA1), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x1(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA1), 'filled'); % Phase spectrum
title('Phase Spectrum of x1(t)');
xlabel('n'); ylabel('Phase(D_n)');

% Plot for x2(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA2_x2), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x2(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA2_x2), 'filled'); % Phase spectrum
title('Phase Spectrum of x2(t)');
xlabel('n'); ylabel('Phase(D_n)');

% Plot for x3(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA2_x3), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x3(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA2_x3), 'filled'); % Phase spectrum
title('Phase Spectrum of x3(t)');
xlabel('n'); ylabel('Phase(D_n)');

%A.4b
n_start = -20; 
n_end = 20;

% Compute Fourier coefficients for each function
DnA1 = findDnA1(n_start, n_end);
DnA2_x2 = findDnA2_x2(n_start, n_end);
DnA2_x3 = findDnA2_x3(n_start, n_end);

% Frequency index for plotting (from n_start to n_end)
n = n_start:n_end;

% Plot for x1(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA1), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x1(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA1), 'filled'); % Phase spectrum
title('Phase Spectrum of x1(t)');
xlabel('n'); ylabel('Phase(D_n)');

% Plot for x2(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA2_x2), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x2(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA2_x2), 'filled'); % Phase spectrum
title('Phase Spectrum of x2(t)');
xlabel('n'); ylabel('Phase(D_n)');

% Plot for x3(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA2_x3), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x3(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA2_x3), 'filled'); % Phase spectrum
title('Phase Spectrum of x3(t)');
xlabel('n'); ylabel('Phase(D_n)');

%A.4c
n_start = -50; 
n_end = 50;

% Compute Fourier coefficients for each function
DnA1 = findDnA1(n_start, n_end);
DnA2_x2 = findDnA2_x2(n_start, n_end);
DnA2_x3 = findDnA2_x3(n_start, n_end);

% Frequency index for plotting (from n_start to n_end)
n = n_start:n_end;

% Plot for x1(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA1), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x1(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA1), 'filled'); % Phase spectrum
title('Phase Spectrum of x1(t)');
xlabel('n'); ylabel('Phase(D_n)');

% Plot for x2(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA2_x2), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x2(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA2_x2), 'filled'); % Phase spectrum
title('Phase Spectrum of x2(t)');
xlabel('n'); ylabel('Phase(D_n)');

% Plot for x3(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA2_x3), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x3(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA2_x3), 'filled'); % Phase spectrum
title('Phase Spectrum of x3(t)');
xlabel('n'); ylabel('Phase(D_n)');

%A.4d
n_start = -500; 
n_end = 500;

% Compute Fourier coefficients for each function
DnA1 = findDnA1(n_start, n_end);
DnA2_x2 = findDnA2_x2(n_start, n_end);
DnA2_x3 = findDnA2_x3(n_start, n_end);

% Frequency index for plotting (from n_start to n_end)
n = n_start:n_end;

% Plot for x1(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA1), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x1(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA1), 'filled'); % Phase spectrum
title('Phase Spectrum of x1(t)');
xlabel('n'); ylabel('Phase(D_n)');

% Plot for x2(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA2_x2), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x2(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA2_x2), 'filled'); % Phase spectrum
title('Phase Spectrum of x2(t)');
xlabel('n'); ylabel('Phase(D_n)');

% Plot for x3(t)
figure;
subplot(2,1,1);
stem(n, abs(DnA2_x3), 'filled'); % Magnitude spectrum
title('Magnitude Spectrum of x3(t)');
xlabel('n'); ylabel('|D_n|');

subplot(2,1,2);
stem(n, angle(DnA2_x3), 'filled'); % Phase spectrum
title('Phase Spectrum of x3(t)');
xlabel('n'); ylabel('Phase(D_n)');

%A.5
function [reconstructed_waveform] = find_original_waveform(Dn, n, fundamental_frequency, t)
    t_set = t;
    n_set = n;
    start_for_t = t_set(1);
    end_for_t = t_set(end);
    start_for_Dn = n_set(1);
    end_for_Dn = n_set(end);
    wo = fundamental_frequency;
    array_index_mod_Dn = floor(length(Dn) / 2) + 1;
    array_index_mod_t = floor(length(t_set) / 2) + 1;
    
    reconstructed_waveform = zeros(size(t_set));
    
    for t_loop = start_for_t:end_for_t
        for n_loop = start_for_Dn:end_for_Dn
            Dn_set = Dn(n_loop + array_index_mod_Dn);
            reconstructed_waveform(t_loop + array_index_mod_t) = reconstructed_waveform(t_loop + array_index_mod_t) + (Dn_set * exp(1i * n_loop * wo * t_loop));
        end
    end
end


%A.6
t = -300:1:300;
n = -20:1:20;
n1 = -500:1:500;

% Reconstruction of x1(t)
Dn_x1 = findDnA1(-20, 20);
waveform_x1 = find_original_waveform(Dn_x1, n, pi/10, t);
figure(1);
plot(t, waveform_x1);
title("x1(t) using Equation 1 for -20 <= n <= 20");
xlabel('t');
ylabel('x1(t)');
grid;

% Reconstruction of x2(t)
Dn_x2 = findDnA2_x2(-500, 500);
waveform_x2 = find_original_waveform(Dn_x2, n1, pi/10, t);
figure(2);
plot(t, waveform_x2);
title("x2(t) using Equation 1 for -500 <= n <= 500");
xlabel('t');
ylabel('x2(t)');
grid;

% Reconstruction of x3(t)
Dn_x3 = findDnA2_x3(-500, 500);
waveform_x3 = find_original_waveform(Dn_x3, n1, pi/20, t);
figure(3);
plot(t, waveform_x3);
title("x3(t) using Equation 1 for -500 <= n <= 500");
xlabel('t');
ylabel('x3(t)');
grid;
