function g = ngamma(h,p)
if p==0 || h==0
    g = 1;
elseif p>0
    g=exp(-h/p);
else
    g = 1 - p /(h*h);
end

