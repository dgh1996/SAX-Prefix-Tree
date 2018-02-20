function [Y] = PAA(y,n)%y:normalized data     n:symbol size     a:alphabet size  
    imax = floor(size(y,2)/n);
    residual = size(y,2) - imax*n;
    Y = zeros(1,imax+1);
    for i = 1:imax
        Y(1,i) = mean(y(1,(i-1)*n+1 : i*n));
    end
    if residual == 0
        Y(:,imax+1) = [];
    else
        Y(1,imax+1) = mean(y(1,size(y,2)-n+1:size(y,2)));
    end
end