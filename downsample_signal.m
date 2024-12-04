function [y_down1, y_down2] = downsample_signal(y_filt_1, y_filt_2, Fs, Fs_orig)
    % Downsample the signals to the original sampling frequency
    y_down1 = resample(y_filt_1, Fs_orig, Fs);
    y_down2 = resample(y_filt_2, Fs_orig, Fs);
end
