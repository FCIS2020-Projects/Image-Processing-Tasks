function G = EdgeMagnit(I)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


MV = Sobel('V');
MV = double(MV);
R_MV = LinearFilter(I, MV, 'absolute');

MH = Sobel('H');
MH = double(MH);
R_MH = LinearFilter(I, MH, 'absolute');

G = R_MV + R_MH;
G = uint8(G);
end

