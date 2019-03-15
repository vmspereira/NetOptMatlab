function [congestion,mlu] = evalWeights(weights,adjacency,cap,demands,nodep)
W=applyWeights(weights,adjacency);
loads=DEFTLoads(W,demands,nodep);
[congestion,mlu]=phi(W,loads,demands,cap);
end

