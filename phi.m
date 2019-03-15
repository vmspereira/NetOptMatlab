function [cong,mlu] = phi(weights,loads,dem,cap)

% Returns the normalized congestion measure Phi^*.
[n , ~]= size(weights);
g = digraph(weights);
% Unit weights graph
gunit=digraph(adjacency(g));
dist = distances(gunit);
% Phi_Uncap
uncap = phiUncap(dem,dist);
% Links
usage= loads ./ cap; % 0/0 will return NaN ... no problem with that
mlu = max(usage,[],'all'); % the link index (i,j) is not needed
sum = 0;
for i = 1:n
    for j = 1:n
        if (loads(i,j)>0 && cap(i,j)>0)
            p = penalty(loads(i,j),cap(i,j));
            sum = sum + p;
        end    
    end
end
cong = sum /uncap;
end