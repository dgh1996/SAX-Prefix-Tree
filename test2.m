%function [node,leaf,result] = test2(y,n,a,w,epsilon,node,leaf,mu)
%[result] = test2(randomwalk(1:20000),n,a,w,epsilon,node,leaf,mu)
function [result] = test2(y,n,a,w,epsilon,node,leaf,mu)
%example:[node,leaf] = train(data,2,6,20,0.01)
%y:data     n:numbers of original data to form a symbol     a:alphabet size  w:window size
%a = [3,10]  recommended [5,8]
%w/n (word size)= [2,8](2003)                
% It is widely accepted that the impact of this parameter is small
%w>n
%epsilon:minimum std for constant ts with noise, say, 0.1
%mu:upperbound for an abnormal ts
%temporarily no transformation from black to red is offered
result = zeros(1,length(y)-w+1);%0:normal   1:abnormal

for index = 1 : (length(y)-w+1)
    temp = y(1,index:(index+w-1));
    norm = Normalize(temp,epsilon);
    paa = PAA(norm,n);
    sax = SAX(paa,a);
    case0 = Match(node,a,sax);
    if case0 == 1
        [node,leaf]=Insert(node,a,sax,1,leaf);
    elseif case0 == 2
        [node,leaf]=Insert(node,a,sax,1,leaf);
    else
        dis=Find_minimum(sax,leaf,node,n,a);
         if dis > mu
             result(index) = dis;
         end
%         if dis < mu
%         [node,leaf]=Insert(node,a,sax,2,leaf);
%         end
%         result(index) = dis;
    end
end
x_ax = 1:length(y);
plot(x_ax',y');
hold on
abnormal_index = find(result>0);
abnormal_ax = zeros(1,length(y));
for i = 1:length(abnormal_index)
    for j = 1 : w
        if abnormal_ax(abnormal_index(i)+j-1) == 0
            abnormal_ax(abnormal_index(i)+j-1) = 1;
        end
    end
end
p_ax = find(abnormal_ax>0);
%plot(p_ax',y(p_ax)','--*r');
plot(p_ax',y(p_ax)','.');
end
%testdata=csvread("C:\Users\shion\Desktop\SAX\test.csv")
%[node,leaf,result] = test(testdata,n,a,w,0.01,node,leaf,1)