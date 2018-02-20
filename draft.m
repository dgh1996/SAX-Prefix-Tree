node=struct('char',0,'father',0,'children',zeros(1,a),'accurate',1,'count',0);%initialize
leaf = [];%index of leaf
[node,leaf] = train(ECG3(1:3000,2)',n,a,w,epsilon,node,leaf);
[result] = test2(ECG3(:,2)',n,a,w,epsilon,node,leaf,mu);
find(result>0)