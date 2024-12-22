% Load the data
load('Lab4_Data.mat');

% Plot the magnitude spectra
figure(1);
MagSpect(xspeech);
title('xspeech');

figure(2);
MagSpect(hLPF2000);
title('hLPF2000');

figure(3);
MagSpect(hLPF2500);
title('hLPF2500');

figure(4);
MagSpect(hChannel);
title('hChannel');

% Coder
% Apply lowpass filter to reduce  bandwidth of xspeech
filtered = conv(xspeech, hLPF2000, 'same');

% Tranform the filtered signal
 
[oscillator] = osc(4000, length(filtered), 32000); % Generate cosine oscillator
xmodulated = filtered .* oscillator; % Modulate the signal

%Modulated signal Graph
figure(5);
MagSpect(xmodulated);
title('Modulated Signal');

% Step 2: Simulate Channel Transmission
% Pass the modulated signal through the hchannel
pass = conv(xmodulated, hChannel, 'same');

figure(6);
MagSpect(pass);
title('pass = Modulated Signal * hChannel');

% Decoder
% Demodulate the received signal
xdemodulated = pass .* oscillator;

figure(7);
MagSpect(xdemodulated);
title('Demodulated Signal');

% Apply lowpass filter to recover the original signal
recovered = conv(xdemodulated, hLPF2000, 'same');

% Plot Recovered
figure(8);
MagSpect(recovered);
title('Recovered Signal');

% Step 4: Listen to Signals

sound(xspeech, 32000); 
pause(3);
sound(filtered, 32000); 
pause(3);
sound(xmodulated, 32000); 
pause(3);
sound(recovered, 32000);