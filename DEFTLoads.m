% Function to compute DEFT load balancing for a given set of Link State link weights 
% a traffic matrix and a set of node-p values. 
% vitor.pereira@algoritmi.uminho.pt

function tload = DEFTLoads(weights,demands,nodep)


g = digraph(weights);
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
    [dut, p]=max(v);
    % node p is the farthest from t
    % and traffic with origin p and that arrives at p
    % with destination t is distributed.
    while dut > 0
        % next hops
        sgamma = zeros(1,n);
        for k = 1:n
            dvt = dist(k,t);
            if weights(p,k)>0 && dvt<dut
                w = weights(p,k);
                h= dvt+w-dut;
                [a,~]=size(nodep);
                if a==n
                    np= nodep(t,p); %distinct node-p values for each destination
                else
                    np= nodep(p);   %node-p values do not depend on the destination
                end
                sgamma(k)= ngamma(h,np);
            end
        end
        
        %load to be distributed
        l = demands(p,t) + sum( pload(:,p));
        % sum gamma
        s = sum(sgamma);
        for k = 1:n
            if sgamma(k)~=0
                pload(p,k)= pload(p,k)+ l*sgamma(k)/s;
            end
        end
        % remove p
        v(p)=0;
        [dut, p]=max(v);
    end
    % add partial loads to total loads
    tload = tload + pload;
end


end