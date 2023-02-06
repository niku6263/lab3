%{
This Matlab script is a demo of the bisection method, applied to the function 
x + cos(x) - 3 to solve the problem

x + cos(x) = 3 for x in [3,4]

APPM 4650 
Instructor: Eduardo Corona
%}

% Bisection method example (lectures 2-3) 
fun = @(x) x + cos(x) - 3; 

% We find an interval [a,b] to use (check graphically)
a=3; b=4; 
xx = linspace(a,b,100); 
plot(xx,fun(xx));
hold on; 
plot(xx,zeros(1,100),'r'); 
hold off; 

% Bisection method (using matlab function)
tol=1e-15; 
nmax = ceil(log2(1/tol)); %theoretical maximum number of iterations needed 
%to reach tol (based on reduction of the error by half)

% Apply bisect method function
[r,rn] = bisect_method(fun,a,b,tol,nmax);

% Plot of the error to determine convergence (linear)

% approximate error
e = abs(r-rn(1:end-1)); 
% length of interval
ln = (1/2).^(0:length(e)-1);

figure; 
plot(-log2(ln),log2(e),'-o')