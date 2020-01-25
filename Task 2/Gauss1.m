function M = Gauss1(Size,Sig) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

K = (Size-1)/2 ;
ii = 1;
jj = 1 ;

  for i = (-K):K
        for j = (-K):K
          M(ii,jj) =  (1/(2* pi * Sig*Sig))* exp(-( i*i + j*j )/(2 * Sig*Sig) );
          jj = jj + 1;
        end
        ii= ii + 1;
        jj=1;
  end
  M = M / sum(sum(M));
end

