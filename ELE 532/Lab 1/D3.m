load('ELE532_Lab1_Data.mat'); %contains the audio file that is found and loaded within the folder
x_audio_copy = x_audio; % can apply modifications to the copy version without affecting the orignal file
threshold = 0; %values in the audio signal will be compared to this threshold
x_audio_copy(abs(x_audio_copy) < threshold) = 0; %This line sets all values in x_audio_copy whose absolute values are less than the threshold to 0.
numZeros = sum(x_audio_copy == 0); % Count the number of 0
disp(['Number of 0: ', num2str(numZeros)]); %This line plays the modified audio stored in x_audio_copy at a sampling rate of 8000 Hz.
sound(x_audio_copy, 8000); % Play the compressed audio