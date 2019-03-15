function W = applyWeights(weights,adjacency)
[n , ~]= size(adjacency);
W=zeros(n,n);
pointer =1;
for i=1:n
    for j=1:n
        if adjacency(i,j)==1
            W(i,j)=weights(pointer);
            pointer=pointer+1;
        end
    end
end
end

