function [ ans ] = Objs_With_Holes( img )
    img = imread('morph.png');
    img = rgb2gray(img);
    imgOrg = im2bw(img);
    imgInv = ~imgOrg;
    [imgOrgL Onum]=bwlabel(imgOrg);
    [imgInvL Inum]=bwlabel(imgInv);
    %figure,imshow( label2rgb(imgOrgL) );
    %figure,imshow( label2rgb(imgInvL) );
    imgFixed = imgOrg + (imgInvL>1);
    %figure,imshow( imgFixed );
    [imgOrgL Onum] = bwlabel(imgFixed);
    %figure,imshow( label2rgb(imgOrgL) );
    imgAns = imgOrgL .* (imgInvL>1);
    %figure,imshow( label2rgb(imgAns) );
    [ans x] = size(unique(imgAns));
    ans = ans-1
end

