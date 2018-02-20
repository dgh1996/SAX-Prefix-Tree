function [node,leaf] = train(y,n,a,w,epsilon,node,leaf)
%example:[node,leaf] = train(ECG3(1:2000,2)',n,a,w,epsilon,node,leaf)
%y:data     n:numbers of original data to form a symbol     a:alphabet size  w:window size
%a = [3,10]  recommended [5,8]
%w/n (word size)= [2,8](2003)             
% It is widely accepted that the impact of this parameter is small
%w>n
%epsilon:minimum std for constant ts with noise, say, 0.1


%node=struct('char',0,'father',0,'children',zeros(1,a),'accurate',1,'count',0);%initialize
%leaf = [];%index of leaf
if a<3 || a>10
     msgbox('a must be within the range [3,10]');
     return;
end
for index = 1 : (length(y)-w+1)
    temp = y(1,index:(index+w-1));
    norm = Normalize(temp,epsilon);
    paa = PAA(norm,n);
    sax = SAX(paa,a);
    [node,leaf]=Insert(node,a,sax,1,leaf);
end%original segmentations


end