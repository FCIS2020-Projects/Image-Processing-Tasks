img = imread('jump.jpg');
img_man = extract_man(img);
back = imread('jump2.jpg');
result = add_man(back, img_man);
figure, imshow(result);