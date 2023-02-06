function fixedpt_example

f1 = @(x) 1+0.5*sin(x);
% fixed pt alpha1 = 1.4987....
f2 = @(x) 3+2*sin(x);
% fixed pt alpha2 = 3.09...

Nmax = 100;
tol = 1e-10;

%test f1
x0 = 0;
[xstar,ier] = fixedpt(x0,f1,tol,Nmax);
xstar
ier 

% test f2
x0 = 0;
[xstar,ier] = fixedpt(x0,f2,tol,Nmax);

xstar 
ier 


return

function [xstar,ier] = fixedpt(x0,f,tol,Nmax)


for i = 1:Nmax
    x1 = f(x0);
    if abs(x1-x0)/abs(x1)<tol
        xstar = x1;
        ier = 0;
        i 
        return
    end
    x0 = x1;
end
xstar = x1;
ier = 1;

return
