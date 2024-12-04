%Run this script file to perform QAM
%NOTE: This automatically generates ALL graphs 
tic
clear,clc,close all;

input1 = '3ECEA_Group No.5_Deang, Khatelyn Jhuneryll_INPUT.wav';
input2 = '3ECEA_Group No.5_Enriquez, Mary Margot Sofia_INPUT.wav';

Fs = 500e3; %Sampling Frequency
Fc = 200e3; %Carrier Frequency

[x1_pad, x2_pad, Fs_orig, L] = load_input(input1,input2);
[x1_up, x2_up,t] = resample_signal(x1_pad, x2_pad, Fs, Fs_orig); 
[x_AM] = qam_modulation(x1_up, x2_up, Fc, t); 
[y_1, y_2, y_filt_1, y_filt_2] = qam_demodulation(x_AM, Fc, 20e3, Fs, t);
[y_down1, y_down2] = downsample_signal(y_filt_1, y_filt_2, Fs, Fs_orig);

%The following plays the demodulated audio signals
% sound(y_down1,Fs_orig);
% pause(5)
% sound(y_down2,Fs_orig)

toc