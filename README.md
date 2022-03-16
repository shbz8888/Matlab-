# Matlab- This function calls one of the three functions below and attempts to solve it using numerical analysis #
fhandle = @ftn_fsolve_example_TwithRz;
X0 = [0  0  0  0]; %Initial guess%
X = fsolve(fhandle, X0);
disp(X)
