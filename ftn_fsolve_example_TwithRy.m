function F = ftn_fsolve_example_TwithRy(X)
%Definitions%

k = 200; %N/mm
b = 40; %mm%
h = 90; %mm%

%VARIABLES%
x = X(1);
y = X(2);
z = X(3);
Ry = X(4);

%Definitions%
%Top platform%
Fnew = [-b/2*cos(Ry);b*sqrt(3)/6;b/2*sin(Ry)];
Dnew = [0;-b*sqrt(3)/3;0];
Enew = [b/2*cos(Ry);b*sqrt(3)/6;-b/2*sin(Ry)];
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

%Force (N) in X, Y, Z and Moment (Nmm) about Y%
FxT = FSAF(1) + FSCF(1) + FSCE(1) + FSBE(1) + FSBD(1) + FSAD(1)
FyT = FSAF(2) + FSCF(2) + FSCE(2) + FSBE(2) + FSBD(2) + FSAD(2)
FzT = FSAF(3) + FSCF(3) + FSCE(3) + FSBE(3) + FSBD(3) + FSAD(3)
MTRy = MAF(2) + MCF(2) + MCE(2) + MBE(2) + MBD(2) + MAD(2)
%calculation%



F = [FxT; FyT; FzT; MTRy];



