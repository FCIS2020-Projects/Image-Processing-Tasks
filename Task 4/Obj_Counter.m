function [ ans ] = Obj_Counter( img )
    img = imread('morph.png');
    img = rgb2gray(img);
    img = im2bw(img);
    [lbb ans]=bwlabel(img);
    %coloredLabelsImage = label2rgb (lbb); 
    %imshow(coloredLabelsImage);
    %ans

end

