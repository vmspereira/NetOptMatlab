function p = phiUncap(demands,distances)
p = sum( demands .* distances , 'all');
end 