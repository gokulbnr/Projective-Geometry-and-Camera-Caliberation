clc;
clear all;

%parameters
n=4;
a=4;

%Function call - generateCube
num=(n*n*n)-(n-2)*(n-2)*(n-2);
cube_pts_world=zeros(3,num);
cube_pts_world=generateCube(n,a);

%3D scatter plot
scatter3(cube_pts_world(1,:),cube_pts_world(2,:),cube_pts_world(3,:),'filled');
title('3D Scatter Plot for the Cube');
xlabel('X Axis');
ylabel('Y Axis');
zlabel('Z Axis');
legend('Point on surface');
grid minor;