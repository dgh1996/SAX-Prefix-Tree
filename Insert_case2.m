% alphabet = 5;
% leaf = [];
% example   node(1)=struct('char',0,'father',0,'children',zeros(1,alphabet),'accurate',1,'count',0);
% example   initially: node=struct('char',0,'father',0,'children',zeros(1,alphabet),'accurate',1,'count',0);
% example   [node,leaf]=Insert(node,5,[1,2,3,4,5],1,leaf)
function [Node,leaf,count] = Insert_case2(node,alphabet,ts,accurate,leaf)
%node:original node    char = 0  ->  empty node e.g. root node
%alphabet:size of alphabet
%accurate = 1 :true pattern ,otherwise: possible
%ts given string
%leaf:index of leaf node
n = length(node);%length of node, store nodes in sufix tree
node_n = 1;%index of node
new = 0;%if insert a new route to the tree,new = 1;
% if isempty(node)
%     node(1)=struct('char',0,'father',0,'children',zeros(1,alphabet),'accurate',1,'count',0);
% end
for i = 1:length(ts)
    if node(node_n).children(ts(i)) == 0
        n = n+1;
        node(n) = struct('char',ts(i),'father',node_n,'children',zeros(1,alphabet),'accurate',accurate,'count',0);
        node(node_n).children(ts(i)) = n;
        node_n = n;
        new = 1;
    else
        node_n = node(node_n).children(ts(i));
    end
end
if new == 1
%     leaf = [leaf,node_n];
    leaf = [leaf;accurate,ts];
else
    leaf = leaf;
end
node(node_n).count = node(node_n).count+1;
Node = node;
count = node(node_n).count;
end
            