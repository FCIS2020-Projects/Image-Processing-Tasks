function [ ans ] = SquareCounter( img )
    img = imread('morph.png');
    img = rgb2gray(img);
    img = im2bw(img);
    Mask = [-1 -1 -1 -1; -1 1 0 0; -1 1 0 0];
    B=bwhitmiss(img,Mask);
    ans = sum(sum(B));
    %figure,imshow(B)
    
end

