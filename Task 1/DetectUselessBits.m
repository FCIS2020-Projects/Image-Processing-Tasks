function [ BIS ] = DetectUselessBits(Img, Per)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [l w c] = size(Img);
    BIS = [];
    grayImg = rgb2gray(Img);
    bitPos = 1;
    for i =1:8
        layer = bitand(grayImg,bitPos);
        layer = layer/bitPos;

        bitPos = bitsll(bitPos,1);
        numOfOnes = sum(sum(layer));
        percentage = numOfOnes/(l*w);
        if( percentage < Per)
            BIS = [BIS i];
        end
    end
    
end
