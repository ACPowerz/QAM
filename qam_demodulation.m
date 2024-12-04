function [y_1, y_2, y_filt_1, y_filt_2] = qam_demodulation(rx, set_fc, fcut, Fs, t)
    % Demodulate the received signal
    y_1 = rx .* cos(2 * pi * set_fc * t).';
    y_2 = rx .* sin(2 * pi * set_fc * t).';

    % Use low-pass filter for the demodulated signals
    y_filt_1 = lowpass(y_1, fcut, Fs);
    y_filt_2 = lowpass(y_2, fcut, Fs);
    
    %graph portion

    %graphs demodulated signals 
    figure(7)
    p = tiledlayout('vertical');
    title(p,'Demodulated Signals')
    xlabel(p,'Time (s)')
    ylabel(p,'Magnitude')

    nexttile
    plot(t,y_1,'Color', "#0072BD")
    title('In Phase Component')

    nexttile
    plot(t,y_2,'Color', "#0072BD")
    title('Out of Phase Component')

    %graphs filtered signals 
    figure(8)
    q = tiledlayout('vertical');
    title(q,'Filtered Demodulated Signals')
    xlabel(q,'Time (s)')
    ylabel(q,'Magnitude')

    nexttile
    plot(t,y_filt_1,'Color',"#0072BD")
    title('In Phase Message Signal')

    nexttile
    plot(t,y_filt_2,'Color','#0072BD')
    title('Out of Phase Message Signal')
end
