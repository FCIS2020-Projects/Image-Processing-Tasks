function [ ans ] = Holes_Counter( img )
    %img = imread('morph.png');
    img = rgb2gray(img);
    img = ~im2bw(img);
    [lbb ans]=bwlabel(img);
    ans = ans-1
    coloredLabelsImage = label2rgb (lbb); 
    imshow(coloredLabelsImage);
end

