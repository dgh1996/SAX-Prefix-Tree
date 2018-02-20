function [minidistance] = Find_minimum(sax,leaf,node,n,a)
% Find_minimum([1,2,3,2,1],leaf,node,n,a,w)
minidistance = inf;
temp = zeros(1,length(sax));
index = 0;
for i=1:size(leaf,1)
% for i=1:length(leaf)
    if leaf(i,1) ~= 1
        continue;
    else
        temporal = Distance(leaf(i,2:size(leaf,2)),sax,a,n);
        if temporal < minidistance
            minidistance = temporal;
        end
    end
end
%     if node(leaf(i)).accurate == 0
%         continue;
%     else
%         index = leaf(i);
%         for j=1:length(temp)
%             char = node(index).char;
%             temp(1,length(temp)+1-j) = char;
%             index = node(index).father;
%         end
%         temporal = Distance(temp,sax,a,n);
%         if temporal < minidistance
%             minidistance = temporal;
%         end
%     end

end