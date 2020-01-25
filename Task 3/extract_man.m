## Copyright (C) 2019 arsan
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} extract_man (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: arsan <arsan@DESKTOP-7SKESTV>
## Created: 2019-11-26

function man_img = extract_man (img) 
  blueness = img(:,:,3) - max(img(:,:,2), img(:,:,1));

  gImg = ~im2bw(blueness, 45/255);
  figure, imshow(gImg);
  gImg = uint8(gImg);
  gImg = gImg*255;
  eImg = edge(gImg, 'canny');
  figure, imshow(eImg);
  dImg = imdilate(eImg, ones(5,5));
  figure, imshow(dImg);
  nImg = ~dImg;
  figure, imshow(nImg);
  [L, num] = bwlabel(nImg);
  rgbImg = label2rgb(L);
  figure, imshow(rgbImg);

  [h w c] = size(img);
  thresh = h*w*0.02;
  objects = [];
  for i=1:num
    x=uint8(L == i);
    if (sum(sum(x)) < thresh)
      continue
    end
    d=zeros(size(img));
    d(:,:,1)=uint8(x).*img(:,:,1);
    d(:,:,2)=uint8(x).*img(:,:,2);
    d(:,:,3)=uint8(x).*img(:,:,3);
    objects = cat(4,objects, d);
  end
  man_img = objects(:,:,:,3);
endfunction
