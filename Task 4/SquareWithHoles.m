function [ ans ] = SquareWithHoles( img )
    img = imread('morph.png');
    img = rgb2gray(img);
    img = im2bw(img);
    
    
    Mask = [-1 -1 -1 -1; -1 1 0 0; -1 1 0 0];
    B=bwhitmiss(img,Mask);
    [imgL co]=bwlabel(img);
    
    squares = unique(imgL .* (B == 1));
    squares = squares(2:end);
    
    
    [imgL ans]=bwlabel(ismember(imgL,squares));
    %figure,imshow(label2rgb(imgL));
    
    img = im2bw(imgL);
    [imgH ans] = bwlabel(~img);
    imgH = (imgH>1);
    %figure,imshow(label2rgb(imgH));
    
    imgFix = img + imgH;
    [imgFix ans]=bwlabel(imgFix);
    %figure,imshow(label2rgb(imgH));
    
    co = unique(imgFix .* (imgH>0));
    co = co(2:end);
    
    [imgFix ans]=bwlabel(ismember(imgFix,co));
    figure,imshow(label2rgb(imgFix .* (imgH==0)));
    %main = main .* (imgFix == 0);
    %figure,imshow(label2rgb(main));

end

