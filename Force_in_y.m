clc
clear 

k = 200;
b = 40;
h = 90;
%Input vARIABLES%
x = 0;
y = -1;
z = 0;
Ry = 0;

%Definitions%
Yaxis = [0;1;0];
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
ThetaAF = acosd(dot(AFnew, Yaxis)/NewLAF);
DLAF = abs(OldL - NewLAF);
FSAF = k*DLAF;
FYAF = FSAF*cosd(ThetaAF);

%CFnew%
CFnew = -C+Fnew;
NewLCF = sqrt(sum(CFnew.^2));
ThetaCF = acosd(dot(CFnew, Yaxis)/NewLCF);
DLCF = abs(OldL - NewLCF);
FSCF = k*DLCF;
FYCF = FSCF*cosd(180-ThetaCF);

%CEnew%
CEnew = -C+Enew;
NewLCE = sqrt(sum(CEnew.^2));
ThetaCE = acosd(dot(CEnew, Yaxis)/NewLCE);
DLCE = abs(OldL - NewLCE);
FSCE = k*DLCE;
FYCE = FSCE*cosd(180-ThetaCE);

%BEnew%
BEnew = -B+Enew;
NewLBE = sqrt(sum(BEnew.^2));
ThetaBE = acosd(dot(BEnew, Yaxis)/NewLBE);
DLBE = abs(OldL - NewLBE);
FSBE = k*DLBE;
FYBE = FSBE*cosd(ThetaBE);

%BDnew%
BDnew = -B+Dnew;
NewLBD = sqrt(sum(BDnew.^2));
ThetaBD = acosd(dot(BDnew, Yaxis)/NewLBD);
DLBD = abs(OldL - NewLBD);
FSBD = k*DLBD;
FYBD = FSBD*cosd(180-ThetaBD);

%ADnew%
ADnew = -A+Dnew;
NewLAD = sqrt(sum(ADnew.^2));
ThetaAD = acosd(dot(ADnew, Yaxis)/NewLAD);
DLAD = abs(OldL - NewLAD);
FSAD = k*DLAD;
FYAD = FSAD*cosd(180-ThetaAD);

FYT = FYAF + FYCF + FYCE + FYBE + FYBD + FYAD