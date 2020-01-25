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
## @deftypefn {} {@var{retval} =} add_man (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: arsan <arsan@DESKTOP-7SKESTV>
## Created: 2019-11-26

function img_plus_man = add_man (img, man_img)
  [h w c] = size(man_img);
  img = imresize(img, [h w]);
  img_plus_man = ((man_img == 0) .* img) + ((man_img != 0) .* man_img);
endfunction
