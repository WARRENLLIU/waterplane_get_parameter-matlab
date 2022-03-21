% This file is for Trapezoid rule
% every rules is the same as waterplane.m
% the multiplier of 1st simpson rule is in 3 and 6 row
%
%

data = textread('exercise_yi.txt');
data_area = textread('exercise_area.txt');
% principal dimension
L = 225
dL = L/9
D =4.200
Dd = 0.800
KG = 0.3
%main matrixs
yi = data(1:1,:)
R_m = data(2:2,:)
S_m = data(3:3,:)
B = 2*max(yi)
moment_arm = data(4:4,:)
Iy_3 = yi.^3

% the correction factors
corr_disp = 130
corr_areamoment = 6
corr_areamoment_L = 0
corr_area = 3
corr_M = corr_area * L/2
corr_M_xoy = corr_disp * -0.16


% main code

R_A1 = 1/2 * sum(data_area(1:1,:) .* data_area(2:2,:)) * Dd
R_Aw = R_A1 + corr_area
R_M1 = 2 * 1/2 * sum(data(1:1,:) .* data(2:2,:) .*data(4:4,:)) * (dL)^2
R_My = R_M1 + corr_M
R_xF = R_My/R_Aw 
R_Cwp = R_Aw/(L*B)
R_It = 2 * 1/2 * 1/3 * sum((data(1:1,:).^3) .* data(2:2,:) ) * dL + corr_areamoment
R_IL = 2 * 1/2 * sum((data(1:1,:) .* ((data(4:4,:) .^ 2))) .* data(2:2,:) ) * dL^3 + corr_areamoment_L
R_ILF = R_IL - R_Aw * R_xF^2 
R_displacement = 1/2 * sum((data_area(1:1,:) .* data_area(2:2,:)))* Dd + corr_disp
R_M_yoz = 1/2 * (sum((data_area(1:1,:) .* data_area(2:2,:)) .* data_area(4:4,:)) )* Dd
R_M_xoy = 1/2 * (sum((data_area(1:1,:) .* data_area(2:2,:)) .* data_area(3:3,:)) )* Dd*Dd + corr_M_xoy


% main result

R_xF
R_It
R_IL
R_displacement
R_BM = R_It/R_displacement
R_BML = R_ILF/R_displacement
R_Xb = R_M_yoz/R_displacement
R_Zb = R_M_xoy/R_displacement
R_GM = KG + R_BM -R_Zb
R_GML = KG + R_BML -R_Zb









