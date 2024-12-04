function [x_AM] = qam_modulation(x1_up, x2_up, set_fc, t)
    % Perform QAM modulation
    I_component = x1_up .* cos(2 * pi * set_fc * t).';
    Q_component = x2_up .* -sin(2 * pi * set_fc * t).';
    x_AM = I_component + Q_component;


    %graph portion
    in_phase = cos(2 * pi * set_fc * t);
    out_phase = -sin(2 * pi * set_fc * t);
    Fs = 500e3;
    
    figure(3)
    p = tiledlayout('vertical');
    title(p,'Carriers in the Time Domain')
    xlabel(p,'Time Index (s)')
    ylabel(p,'Magnitude')
    
    nexttile
    plot(t(1:100),in_phase(1:100),'Color', "#0072BD")
    title('In Phase Carrier')
    
    nexttile
    plot(t(1:100),out_phase(1:100),'Color', "#0072BD")
    title('Quadrature Carrier')

    %Plot of the carrier
    figure(4)
    fft_carrier = fft(in_phase,length(in_phase));
    deltaF2 = Fs/length(in_phase);
    f2 = -Fs/2:deltaF2:(Fs/2)-deltaF2;
    plot(f2,abs(fftshift(fft_carrier)),'Color',"#0072BD");
    title('Frequency Domain ')
    xlabel('Frequency Bins')
    ylabel('Magnitude')

    figure(5)
    d = tiledlayout('vertical');
    title(d,'Message Components of AM Signal')
    xlabel(d,'Time Index (s)')
    ylabel(d,'Magnitude')

    nexttile
    plot(t,I_component,"Color","#0072BD")
    title('In Phase Component')

    nexttile
    plot(t,Q_component,"Color","#0072BD")
    title('Out of Phase Component')

    %Plot of modulated signal
    figure(6) 
    s = tiledlayout('vertical');
    title(s,'Plot of the Modulated Signal')
    
    nexttile
    plot(t,x_AM,'Color',"#0072BD"); % AM in Time Domain
    title('Time Domain')
    xlabel('Time (s)')
    ylabel('Magnitude')
    
    nexttile
    fft_am = fft(x_AM,length(x_AM));
    deltaF3 = Fs/length(x_AM);
    f3 = -Fs/2:deltaF3:(Fs/2)-deltaF3;
    plot(f3,abs(fftshift(fft_am)),'Color',"#0072BD"); %AM in frequency domain
    
    title('Frequency Domain')
    xlabel('Frequency Bins')
    ylabel('Magnitude')

    
    
end

