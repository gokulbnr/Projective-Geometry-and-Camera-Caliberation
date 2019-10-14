function tmp2 = genH(xl, yl, x, y)
xl = xl - xl(1);
yl = yl - yl(1);
Xl = [x(1)*50;x(2)*50;x(3)*50;x(4)*50;x(5)*50];
Yl = [y(1)*50;y(2)*50;y(3)*50;y(4)*50;y(5)*50];
lhs = [];
for i = 2:5
    temp = [-1*Xl(i), -1*Yl(i), -1, 0, 0, 0, xl(i)*Xl(i), xl(i)*Yl(i), xl(i) ; 0, 0, 0, -1*Xl(i), -1*Yl(i), -1, yl(i)*Xl(i), yl(i)*Yl(i), yl(i)];
    lhs = [lhs;temp];
end
[U,S,V] = svd(lhs);
tmp1 = reshape(V(:,8), 3, 3);
tmp2 = tmp1.';
tmp2 = tmp2./tmp2(3,3);
end