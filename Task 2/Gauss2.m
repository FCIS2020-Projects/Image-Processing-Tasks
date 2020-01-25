function M = Gauss2(Sig) 
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Size = uint8(3.7 * Sig - 0.5); 
Size = double(Size);

K = Size;
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

