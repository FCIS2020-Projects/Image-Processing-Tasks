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
## @deftypefn {} {@var{retval} =} LinearFilter (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: arsan <arsan@DESKTOP-7SKESTV>
## Created: 2019-10-15

function Out = LinearFilter (I, Filter, Postproc)
    [maskL maskW] = size(Filter);
    [imgL imgW imgC] = size(I);
    n = floor(maskL/2);
    m = floor(maskW/2);
    Padded = zeros(imgL+maskL-1, imgW+maskW-1, imgC);
  for c=1:imgC
    Padded(n+1:n+imgL,m+1:m+imgW,c) = I(:,:,c);
    Padded = double(Padded);
    
    for i = n+1:n+imgL
      for j = m+1:m+imgW
        Out(i-n,j-m,c) = sum(sum(Padded(i-n:i+n,j-m:j+m,c).*Filter ));
      end
    end
  end
  if strcmp(Postproc,'cutoff')
    Out = uint8(Out);
  elseif strcmp(Postproc,'absolute')
    Out = abs(Out);
  end
end
