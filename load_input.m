function [x1_pad, x2_pad, Fs_orig, L] = load_input(input1_file, input2_file)
    % Load the audio files
    [x1_orig, Fs1] = audioread(input1_file);
    [x2_orig, Fs2] = audioread(input2_file);

    % Test if sampling frequencies are matching
    if Fs1 ~= Fs2
        error('Sampling frequencies do not match.');
    end
    Fs_orig = Fs1; % Set original sampling frequency

    % If length does not match, pad zeros
    L1 = length(x1_orig);
    L2 = length(x2_orig);
    if L1 > L2
        x1_pad = x1_orig;
        x2_pad = [x2_orig; zeros(L1 - L2, 1)];
    else
        x1_pad = [x1_orig; zeros(L2 - L1, 1)];
        x2_pad = x2_orig;
    end
    
    L = max(L1, L2);

    %plot of message signals
    t1 = 0:1/Fs_orig:(length(x1_pad)-1)/Fs_orig;

    figure(1)
    d = tiledlayout('vertical');
    title(d,'Time Domain')
    xlabel(d,'Time (s)')
    ylabel(d,'Magnitude')

    nexttile
    plot(t1,x1_pad,'Color',"#0072BD");
    title('x1_{pad}')

    nexttile
    plot(t1,x2_pad,'Color',"#0072BD");
    title('x2_{pad}')

    %Plotting the Signals in the frequency domain
    deltaF = Fs_orig/L;
    f1 = -Fs_orig/2:deltaF:(Fs_orig/2)-deltaF;
    f1 = f1';
    X1 = fft(x1_pad,L);
    X2 = fft(x2_pad,L);

    figure(2)
    plot(f1,abs(fftshift(X1)),'Color',"#0072BD");
    title('Frequency Domain')
    subtitle('x1_{pad}')
    xlabel('Frequency Bins')
    ylabel('Magnitude')
    
end





