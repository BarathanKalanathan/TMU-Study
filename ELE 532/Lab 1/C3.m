u = @(t) 1.0.*(t>=0);
t = [0:0.01:4]; 

alpha = [1, 3, 5, 7];
hold on;
    for i = 1:length(alpha) 
        s = exp(-2) .* exp(-alpha(i) .* t) .* cos(4 * pi * t) .* u(t);                                                  
        plot(t, s);                 %plot function
    end
xlabel('t');
ylabel('s_{\alpha}(t)');
legend('alpha = 1', 'alpha = 3', 'alpha = 5', 'alpha = 7');
title ('S[alpha](t)');


