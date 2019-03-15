function tload = ECMPLoads(W,demands)

% W is the weight matrix
% and demands matrix

g = digraph(W);
[n , ~]= size(g.Nodes);
dist = distances(g);
% total loads
tload = zeros(n);

% for each destination
for t = 1:n
    % partial load
    pload = zeros(n);
    % distances to destination t
    v = dist(:,t);
    [d, p]=max(v);
    % node p is the farthest from t
    % and traffic with origin p and that arrives at p
    % with destination t is distributed.
    while d > 0
        % next hops
        out = [];
        for k = 1:n
            if W(p,k)>0
                w = W(p,k);
                dut = dist(k,t);
                if w+dut == d
                    out = [out,k];
                end
            end
        end
        
        %load to be distributed
        l = demands(p,t) + sum( pload(:,p));
        % out degree
        [~, deg] = size(out);
        
        la = l/deg;
        for k= 1:deg
            pload(p,out(k))= pload(p,out(k))+ la;
        end
        % remove p
        v(p)=0;
        [d, p]=max(v);
    end
    % add partial loads to total loads
    tload = tload + pload;
end



end