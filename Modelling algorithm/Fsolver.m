% script_fsolve_example

fhandle = @ftn_fsolve_example_TwithRz;
X0 = [0  0  0  0]; %Initial guess%
X = fsolve(fhandle, X0);
disp(X)

