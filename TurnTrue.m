function [Node,leaf] = TurnTrue(node,ts,leaf)
node_n = 1;%index of node
new = 0;%if insert a new route to the tree,new = 1;
for i = 1:length(ts)
    if node(node_n).children(ts(i)) == 0
        new = 1;
        "error occured TurnTrue"
    else
        node_n = node(node_n).children(ts(i));
    end
end
if new == 0
    while (node(node_n).accurate~=1)
        node(node_n).accurate = 1;
        node_n = node(node_n).father;
    end
end
Node=node;

find = 0;
for i = 1:size(leaf,1)
    if leaf(i,1) == 1
        continue;
    end
    find = 1;
    for j = 2:size(leaf,2)
        if leaf(i,j) ~= ts(1,j-1)
            find = 0;
            break;
        end
    end
    if find == 1
        leaf(i,1) = 1;
        break;
    end
end
leaf = leaf;

        

        