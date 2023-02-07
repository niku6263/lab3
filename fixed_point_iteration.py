import numpy as np
import math


def fun(x):
    return x**4 - 3*x**2;

def fixed_point_iteration(f,x0,a,b,tol,nmax,vrb=False):

    def g(x):
        return f(x) + x;

    n=0;
    xn=x0;
    r=xn;

    while n<=nmax:
        if np.abs(f(xn)-xn)<tol:
            break;
        
        n+=1;
        xn = g(xn);

    r=xn;

    return r;

r = fixed_point_iteration(fun,1,1,2,10**-2,100)
print(r)