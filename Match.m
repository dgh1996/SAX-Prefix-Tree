function [result] = Match(node,alphabet,ts)
%same as Insert
%example result = Match(node,5,[1,2,3,1,5])
node_n = 1;%index of node
match = struct('char',0,'father',0,'children',zeros(1,alphabet),'accurate',1,'count',0);
match_n = 0;
case12 = 1;
for i = 1:length(ts)
    if node(node_n).children(ts(i)) ~= 0
        match_n = match_n + 1;
        match(match_n) = node(node_n);
        node_n = node(node_n).children(ts(i));
        if i == length(ts)
            match(match_n+1)=node(node_n);
        end%copy leaf node
    else
        break;
    end
end
if match_n ~= length(ts)
    result = 3;
    return;%case 3
else
    for k = 1:(match_n+1)
        if match(k).accurate ~=1
            case12 = 2;
            break;
        end
    end
end

if case12 == 1
    result = 1;
    return;%case 1
else
    result = 2;
    return;%case 2
end
end
          