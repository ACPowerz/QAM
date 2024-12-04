function [x1_up, x2_up,t,Fs] = resample_signal(x1_pad, x2_pad, Fs, Fs_orig)
     % Upsample the signals
    x1_up = resample(x1_pad, Fs, Fs_orig);
    x2_up = resample(x2_pad, Fs, Fs_orig);

    t = 0:1/Fs:(length(x1_up)-1)/Fs;
    
end


