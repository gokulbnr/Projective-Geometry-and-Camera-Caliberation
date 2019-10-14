function v =  getV(h, i, j)
v = [h(i,1)*h(j,1), h(i,1)*h(j,2)+h(i,2)*h(j,1),  h(i,3)*h(j,1)+h(i,1)*h(j,3), h(i,2)*h(j,2), h(i,3)*h(j,2)+h(i,2)*h(j,3)  , h(i,3)*h(j,3)];
end