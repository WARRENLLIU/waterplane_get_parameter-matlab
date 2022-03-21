% This file is for simpson second rule
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
B = 2*max(yi)
% the correction factors
corr_disp = 130
corr_areamoment = 6
corr_areamoment_L = 0
corr_area = 3
corr_M = corr_area * L/2
corr_M_xoy = corr_disp * -0.16

% main code 
S22_A1 = 3/8 * Dd * sum(data_area(1:1,:) .* data_area(5:5,:))
S22_Aw = S22_A1 + corr_area
S22_M1 = 2 * 3/8 * sum(data(1:1,:) .* data(5:5,:) .*data(4:4,:)) * (dL)^2
S22_My = S22_M1 + corr_M
S22_xF = S22_My/S22_Aw 
S22_Cwp = S22_Aw/(L*B)
S22_It = 2 * 3/8 * 1/3 * sum(data(1:1,:).^3 .* data(5:5,:) ) * dL + corr_areamoment
S22_IL = 2 * 3/8 * sum((data(1:1,:) .* ((data(4:4,:) .^ 2))) .* data(5:5,:) ) * dL^3 + corr_areamoment_L
S22_ILF = S22_IL - S22_Aw * S22_xF^2 
S22_displacement = 3/8 * sum((data_area(1:1,:) .* data_area(5:5,:)))* Dd + corr_disp
S22_M_yoz = 3/8 * (sum((data_area(1:1,:) .* data_area(5:5,:)) .* data_area(4:4,:)) )* Dd
S22_M_xoy = 3/8 * (sum((data_area(1:1,:) .* data_area(5:5,:)) .* data_area(3:3,:)) )* Dd*Dd + corr_M_xoy

% main result
S22_xF
S22_It
S22_IL
S22_displacement
S22_BM = S22_It/S22_displacement
S22_BML = S22_ILF/S22_displacement
S22_Xb = S22_M_yoz/S22_displacement
S22_Zb = S22_M_xoy/S22_displacement
S22_GM = KG + S22_BM -S22_Zb
S22_GML = KG + S22_BML -S22_Zb








