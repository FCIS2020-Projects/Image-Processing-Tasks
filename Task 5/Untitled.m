
im = imread('A.bmp');
im2 = zeros(size(im))

for c=1:3
    
    FT = fft2(double(im(:,:,c)));
    FT1 = fftshift(FT);%finding spectrum
    FT2 = abs(FT1);
    %figure, imshow(log(FT1),[]);
    m = size(im,1);
    n = size(im,2);
    for i=2:m-1
        for j = 2:n-1
            if i ~= n/2 && j ~= m/2
                if (sum(sum(FT2(i-1:i+1,j-1:j+1)))-FT2(i,j))/FT2(i,j) < 1.1
                    FT1(i,j) = 0;
                end
            end
        end
    end
    figure, imshow(log(FT1),[]);
    output = ifft2(ifftshift(FT1));
    im2(:,:,c) = output;
end

figure, imshow(uint8(im2),[]);


