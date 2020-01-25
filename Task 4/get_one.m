function [ ans ] = get_one( img )
    img = imread('morph.png');
    img = rgb2gray(img);
    img = im2bw(img);
    [L W x]= size(img);
    %ans = ones(1,L) * img * ones(W,1)/(L*W);
    ans = sum(sum(img))/(L*W)*100;
end

