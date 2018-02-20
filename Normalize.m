function [normalized] = Normalize(y,epsilon)%y: data     
%standardize and normalize
m = mean(y);
s = std(y,1);%ÓÐÆ«·½²î
normalized = zeros(1,length(y));
for i = 1:length(y)
    normalized(1,i) = (y(1,i)-m)/s;
end%standardize and normalize

if s <= epsilon 
for i = 1:length(y)
    normalized(1,i) = 0;
end%prevent from the situation where constant time series and noise coexist
end