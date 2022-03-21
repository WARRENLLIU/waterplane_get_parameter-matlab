% This file is for simpson 1st rule
% every rules is the same as waterplane.m
% the multiplier of 2nd simpson rule is in 5 row
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
B = 2*max(yi)
% the correction factors
corr_disp = 130
corr_areamoment = 6
corr_areamoment_L = 0
corr_area = 3
corr_M = corr_area * L/2
corr_M_xoy = corr_disp * -0.16

% main code 
S1_A1 = 1/3 * sum(data_area(1:1,:) .* data_area(6:6,:)) * Dd
S1_Aw = S1_A1 + corr_area
S1_M1 = 2 * 1/3 * sum(data(1:1,:) .* data(6:6,:) .*data(4:4,:)) * (dL)^2
S1_My = S1_M1 + corr_M
S1_xF = S1_My/S1_Aw 
S1_Cwp = S1_Aw/(L*B)
S1_It = 2 * 1/3 * 1/3 * sum((data(1:1,:).^3) .* data(6:6,:) ) * dL + corr_areamoment
S1_IL = 2 * 1/3 * sum((data(1:1,:) .* ((data(4:4,:) .^ 2))) .* data(6:6,:) ) * dL^3 + corr_areamoment_L
S1_ILF = S1_IL - S1_Aw * S1_xF^2 
S1_displacement = 1/3 * sum((data_area(1:1,:) .* data_area(6:6,:)))* Dd + corr_disp
S1_M_yoz = 1/3 * (sum((data_area(1:1,:) .* data_area(6:6,:)) .* data_area(4:4,:)) )* Dd
S1_M_xoy = 1/3 * (sum((data_area(1:1,:) .* data_area(6:6,:)) .* data_area(3:3,:)) )* Dd*Dd + corr_M_xoy

% main result
S1_xF
S1_It
S1_IL
S1_displacement
S1_BM = S1_It/S1_displacement
S1_BML = S1_ILF/S1_displacement
S1_Xb = S1_M_yoz/S1_displacement
S1_Zb = S1_M_xoy/S1_displacement
S1_GM = KG + S1_BM -S1_Zb
S1_GML = KG + S1_BML -S1_Zb

