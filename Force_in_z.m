clc
clear 

k = 200;
b = 40;
h = 90;
%Input vARIABLES%
x = 1;
y = 1;
z = 1;
Ry = 0.05;

%Definitions%
Zaxis = [0;0;1];
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
ThetaAF = acosd(dot(AFnew, Zaxis)/NewLAF);
DLAF = abs(OldL - NewLAF);
FSAF = k*DLAF;
FZAF = FSAF*cosd(ThetaAF);

%CFnew%
CFnew = -C+Fnew;
NewLCF = sqrt(sum(CFnew.^2));
ThetaCF = acosd(dot(CFnew, Zaxis)/NewLCF);
DLCF = abs(OldL - NewLCF);
FSCF = k*DLCF;
FZCF = FSCF*cosd(ThetaCF);

%CEnew%
CEnew = -C+Enew;
NewLCE = sqrt(sum(CEnew.^2));
ThetaCE = acosd(dot(CEnew, Zaxis)/NewLCE);
DLCE = abs(OldL - NewLCE);
FSCE = k*DLCE;
FZCE = FSCE*cosd(ThetaCE);

%BEnew%
BEnew = -B+Enew;
NewLBE = sqrt(sum(BEnew.^2));
ThetaBE = acosd(dot(BEnew, Zaxis)/NewLBE);
DLBE = abs(OldL - NewLBE);
FSBE = k*DLBE;
FZBE = FSBE*cosd(ThetaBE);

%BDnew%
BDnew = -B+Dnew;
NewLBD = sqrt(sum(BDnew.^2));
ThetaBD = acosd(dot(BDnew, Zaxis)/NewLBD);
DLBD = abs(OldL - NewLBD);
FSBD = k*DLBD;
FZBD = FSBD*cosd(ThetaBD);

%ADnew%
ADnew = -A+Dnew;
NewLAD = sqrt(sum(ADnew.^2));
ThetaAD = acosd(dot(ADnew, Zaxis)/NewLAD);
DLAD = abs(OldL - NewLAD);
FSAD = k*DLAD;
FZAD = FSAD*cosd(ThetaAD);

FZT = FZAF + FZCF + FZCE + FZBE + FZBD + FZAD