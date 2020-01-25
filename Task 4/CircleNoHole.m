function [ ans ] = CircleNoHole( img )
    %img = imread('morph.png');
    img = rgb2gray(img);
    img = im2bw(img);
    Mask = [-1 -1 -1; -1 1 0; -1 1 0];
    B=bwhitmiss(img,Mask);
    [imgL co]=bwlabel(img);
    squares = unique(imgL .* (B == 1));
    squares = squares(2:end);
    [imgL ans]=bwlabel(ismember(imgL,squares));
    img = img .* (im2bw(imgL)==0);
    %figure,imshow(img);
    %now we have circles only
    imgHoles = ~img;
    [imgHoles ans] = bwlabel(imgHoles);
    imgFixed = img + (imgHoles>1);
    [imgFixed ans]=bwlabel(imgFixed);
    %figure,imshow(label2rgb(imgFixed));
    squLab = unique( imgFixed .* (imgHoles>1) );
    squLab = squLab(2:end)
    [imgFixed ans]=bwlabel(ismember(imgFixed,squLab));
    imgFixed = imgFixed .* (img>0);
    figure,imshow(label2rgb(imgFixed));
end

