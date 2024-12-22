f = @(t) exp(-t).* cos(2*pi*t);   	%equation of the graph 1.46
t1 = (-2:2);                     	%interval for plotting

g = @(t) exp(-t).* cos(2*pi*t);  	%equation of the graph 1.47
t2 = (-2:0.01:2);                	%interval with 100 points per oscillation

subplot (2,1,1);              	%2 by 1 subplots
plot (t1, f(t1))
xlabel ('t1'); ylabel ('f(t1)'); grid;title("f (t) = e−t cos (2π t) for t = (-2:2).");

subplot (2,1,2);
plot (t2, g(t2))
xlabel ('t2'); ylabel ('g(t2)'); grid;title(" f (t) = e−t cos (2π t) for t = (-2:0.01:2).")