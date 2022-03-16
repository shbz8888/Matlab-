clc
clear 

k = 200;
b = 40;
h = 90;
%Input vARIABLES%
x = 1;
y = 0;
z = 0;
Ry = 0;

%Definitions%
Xaxis = [1;0;0];
ZDaxis = [sin(Ry);0;cos(Ry)];
Fnew = [-b/2*cos(Ry);b*sqrt(3)/6;b/2*sin(Ry)];
Dnew = [0;-b*sqrt(3)/3;0];
Enew = [b/2*cos(Ry);b*sqrt(3)/6;-b/2*sin(Ry)];
A = [-b-x; -b*sqrt(3)/3-y; -h-z];
B = [b-x; -b*sqrt(3)/3-y; -h-z];
C = [0-x; 2*b*sqrt(3)/3-y; -h-z];
OldL = sqrt(b^2+h^2);

%AFnew%
AFnew = -A+Fnew;
NewLAF = sqrt(sum(AFnew.^2));
ThetaAF = acosd(dot(AFnew, Xaxis)/NewLAF);
DLAF = abs(OldL - NewLAF);
FSAF = k*DLAF;
FxAF = FSAF*cosd(ThetaAF);

%CFnew%
CFnew = -C+Fnew;
NewLCF = sqrt(sum(CFnew.^2));
ThetaCF = acosd(dot(CFnew, Xaxis)/NewLCF);
DLCF = abs(OldL - NewLCF);
FSCF = k*DLCF;
FxCF = FSCF*cosd(180-ThetaCF);

%CEnew%
CEnew = -C+Enew;
NewLCE = sqrt(sum(CEnew.^2));
ThetaCE = acosd(dot(CEnew, Xaxis)/NewLCE);
DLCE = abs(OldL - NewLCE);
FSCE = k*DLCE;
FxCE = FSCE*cosd(ThetaCE);

%BEnew%
BEnew = -B+Enew;
NewLBE = sqrt(sum(BEnew.^2));
ThetaBE = acosd(dot(BEnew, Xaxis)/NewLBE);
DLBE = abs(OldL - NewLBE);
FSBE = k*DLBE;
FxBE = FSBE*cosd(180-ThetaBE);

%BDnew%
BDnew = -B+Dnew;
NewLBD = sqrt(sum(BDnew.^2));
ThetaBD = acosd(dot(BDnew, Xaxis)/NewLBD);
DLBD = abs(OldL - NewLBD);
FSBD = k*DLBD;
FxBD = FSBD*cosd(180-ThetaBD);

%ADnew%
ADnew = -A+Dnew;
NewLAD = sqrt(sum(ADnew.^2));
ThetaAD = acosd(dot(ADnew, Xaxis)/NewLAD);
DLAD = abs(OldL - NewLAD);
FSAD = k*DLAD;
FxAD = FSAD*cosd(ThetaAD);

FxT = FxAF + FxCF + FxCE + FxBE + FxBD + FxAD

