function [result] = Main(y,n,a,w,epsilon)%y:data     n:numbers of original data to form a symbol     a:alphabet size  w:window size
%a = [3,10]  recommended [5,8]
%w/n (word size)= [2,8](2003)                 
% It is widely accepted that the impact of this parameter is small
%w>n
%epsilon:minimum std for constant ts with noise
%data=csvread("C:\Users\shion\Desktop\SAX\x.csv")
if a<3 || a>10
     msgbox('a must be within the range [3,10]');
     return;
end


Mem = zeros(length(y)-w+1,w);%original segmentations -- def

if mod(w,n) == 0
    Processed = zeros(length(y)-w+1,floor(w/n));%for PAA
    Processed2 = zeros(length(y)-w+1,floor(w/n));%for SAX
else
    Processed = zeros(length(y)-w+1,floor(w/n)+1);
    Processed2 = zeros(length(y)-w+1,floor(w/n)+1);
end%after SAX -- def

for index = 1 : (length(y)-w+1)
    Mem(index,:) = y(1,index:(index+w-1));
end%original segmentations


for index2 = 1:size(Mem,1)
    norm = Normalize(Mem(index2,:),epsilon);
    Processed(index2,:) = PAA(norm,n);
end%PAA



pre = zeros(1,w);
now = zeros(1,w);
pointer = zeros(length(y)-w+1,1);
point = 1;
for index3 = 1:size(Processed,1)
    now = SAX(Processed(index3,:),a);
    if index3 == 1 || abs(isequal(pre,now)-1)
    Processed2(point,:)=now;
    pointer(point,1) = index3;
    point = point +1;
    pre = now;
    else
        continue;
    end
end%SAX

i=size(Processed2,1);
if point < (length(y)-w+1)
while (i>=point)
    Processed2(i,:)=[];
    pointer(i)=[];
    i=i-1;
end
end%delete unused place

result = [pointer Processed2];

end
%y=[1,2,...48,22,30]
%n=2
%a=4
%w=6
%epsilon?