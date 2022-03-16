# Matlab- This function calls one of the three functions below and attempts to solve it using numerical analysis #
fhandle = @ftn_fsolve_example_TwithRz;
X0 = [0  0  0  0]; %Initial guess%
X = fsolve(fhandle, X0);
disp(X)

#This funtion defines how the device behaves when subjected to forces in X,Y,Z with a moment about X #
function F = ftn_fsolve_example_TwithRx(X) 
%Definitions%

k = 200; %N/mm
b = 40; %mm%
h = 90; %mm%

%VARIABLES%
x = X(1);
y = X(2);
z = X(3);
Rx = X(4);

%Definitions%
%Top platform%
Fnew = [-b/2;b*sqrt(3)/6*cos(Rx);b*sqrt(3)/6*sin(Rx)];
Dnew = [0;-b*sqrt(3)/3*cos(Rx);-b*sqrt(3)/3*sin(Rx)];
Enew = [b/2;b*sqrt(3)/6*cos(Rx);b*sqrt(3)/6*sin(Rx)];
%Bottom platform%
A = [-b-x; -b*sqrt(3)/3-y; -h-z];
B = [b-x; -b*sqrt(3)/3-y; -h-z];
C = [0-x; 2*b*sqrt(3)/3-y; -h-z];
OldL = sqrt(b^2+h^2);

%AFnew%
AFnew = -A+Fnew;
NewLAF = sqrt(sum(AFnew.^2));
AFUnew = AFnew/norm(AFnew);
DLAF = NewLAF - OldL;
FSAF = k*DLAF*AFUnew;
MAF = cross(Fnew,FSAF);

%CFnew%
CFnew = -C+Fnew;
NewLCF = sqrt(sum(CFnew.^2));
CFUnew = CFnew/norm(CFnew);
DLCF = NewLCF- OldL;
FSCF = k*DLCF*CFUnew;
MCF = cross(Fnew,FSCF);

%CEnew%
CEnew = -C+Enew;
NewLCE = sqrt(sum(CEnew.^2));
CEUnew = CEnew/norm(CEnew);
DLCE = NewLCE - OldL;
FSCE = k*DLCE*CEUnew;
MCE = cross(Enew,FSCE);

%BEnew%
BEnew = -B+Enew;
NewLBE = sqrt(sum(BEnew.^2));
BEUnew = BEnew/norm(BEnew);
DLBE = NewLBE - OldL;
FSBE = k*DLBE*BEUnew;
MBE = cross(Enew,FSBE);

%BDnew%
BDnew = -B+Dnew;
NewLBD = sqrt(sum(BDnew.^2));
BDUnew = BDnew/norm(BDnew);
DLBD = NewLBD - OldL;
FSBD = k*DLBD*BDUnew;
MBD = cross(Dnew,FSBD);

%ADnew%
ADnew = -A+Dnew;
NewLAD = sqrt(sum(ADnew.^2));
ADUnew = ADnew/norm(ADnew);
DLAD = NewLAD - OldL;
FSAD = k*DLAD*ADUnew;
MAD = cross(Dnew,FSAD);

%Force (N) in X, Y, Z and Moment (Nmm) about X&
FxT = FSAF(1) + FSCF(1) + FSCE(1) + FSBE(1) + FSBD(1) + FSAD(1)
FyT = FSAF(2) + FSCF(2) + FSCE(2) + FSBE(2) + FSBD(2) + FSAD(2)
FzT = FSAF(3) + FSCF(3) + FSCE(3) + FSBE(3) + FSBD(3) + FSAD(3)
MTRx = MAF(1) + MCF(1) + MCE(1) + MBE(1) + MBD(1) + MAD(1)

%calculation%





