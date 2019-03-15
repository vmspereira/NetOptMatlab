function p = penalty(l,c)
% Penalty convex piecewise linear function proposed by Fortz and Thurop
u = l/c;
if u < 1/3
	p = l;
elseif u < 2/3
	p = (3 * l - 2.0 / 3.0 * c);
elseif u < 0.9
	p= (10 * l - 16.0 / 3.0 * c);
elseif u < 1.0
	p= (70 * l - 178.0 / 3.0 * c);
elseif u < 1.1
	p= (500 * l - 1468.0 / 3.0 * c);
else
	p= (5000 * l - 16318.0 / 3.0 * c);	
end
end 