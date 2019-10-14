clc;
clear all;

x1 = [0;1;2;2;3];
y1 = [0;1;1;2;2];

x2 = [0;1;2;3;3];
y2 = [0;1;1;1;3];

x3 = [0;2;2;3;4];
y3 = [0;0;1;1;1];

im1 = imread('1.jpg');
n = 5;
imshow(im1)
[x,y,one] = ginput(n);

im1 = imread('2.jpg');
n2 = 5;
imshow(im1)
[x22,y22,one2] = ginput(n2);

im1 = imread('3.jpg');
n3 = 5;
imshow(im1)
[x33,y33,one3] = ginput(n3);


h1 = genH(x1,y1,x,y);
h2 = genH(x2,y2,x22,y22);
h3 = genH(x3,y3,x33,y33);

fl = [ getV(h1,1,2) ; getV(h1,1,1)-getV(h1,2,2);
       getV(h2,1,2) ; getV(h2,1,1)-getV(h2,2,2);
       getV(h3,1,2) ; getV(h3,1,1)-getV(h3,2,2)];
b = getb(fl);
ucm = nearestSPD(b);
R = chol(ucm);
K = inv(R.');
K=transpose(K);