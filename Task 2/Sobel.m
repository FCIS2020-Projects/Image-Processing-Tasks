function M = Sobel(Mask)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
        if Mask == 'H'
          M = [-1 -2 -1 ; 0 0 0 ; 1 2 1];
        elseif Mask == 'V'
          M = [-1 0 1 ; -2 0 2 ; -1 0 1];
        end
    
end

