function b = getb(a)
[U,S,V] = svd(a);
bl = V(:,6);
b = [bl(1) bl(2) bl(3) ; bl(2) bl(4) bl(5) ; bl(3) bl(5) bl(6)];
b = (b + b.')/2;
end