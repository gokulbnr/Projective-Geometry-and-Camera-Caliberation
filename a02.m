clc;
clear all;

%Given and Initialized Parameters
n=4;
cam_pos=zeros(3,8);
ht_mat=zeros(4,4,8);
image_pts=zeros(3,n*n*n-(n-2)*(n-2)*(n-2),8);
cube_pts_cam=zeros(3,n*n*n-(n-2)*(n-2)*(n-2),8);
cube_pts_world=generateCube(n,4);
pos=[25;0;0];
r=pi/4;
rot_x_45=[cos(r),-sin(r),0;sin(r),cos(r),0;0,0,1];
k=[100,0,50;0,100,100;0,0,1];

%Sub-Part 1
cam_pos(:,1)=pos;
%Getting camera positions
for i=2:8
    cam_pos(:,i)=rot_x_45*cam_pos(:,i-1);
end

%Finding homogenous tranformation matrices
rot_i=[1,0,0;0,0,1;0,-1,0];
rot_i=[0,0,-1;0,1,0;1,0,0]*rot_i;
for i=1:8
    a=(i-1)*pi/4;
    rot_mat=[cos(a),0,sin(a);0,1,0;-sin(a),0,cos(a)]*rot_i;
    t=[0;0;-25];
    ht_mat(:,:,i)=[rot_mat,t;0,0,0,1];
end

%Sub-Part 2
%For each point, convert world coordinates to camera coordinates
for i=1:8
    for j=1:56
        cube_pts_cam(:,j,i)=ht_mat(1:3,1:3,i)*cube_pts_world(:,j)+ht_mat(1:3,4,i);
    end
end

%Sub-Part 3
%Finding the 8 images using the camera intrinsic parameters.
for i=1:8
    for j=1:56
        image_pts(:,j,i)=k*cube_pts_cam(:,j,i);
        image_pts(1,j,i)=image_pts(1,j,i)/image_pts(3,j,i);
        image_pts(2,j,i)=image_pts(2,j,i)/image_pts(3,j,i);
    end
end

%Sub-Part 4
%Frames as captured from each camera.
for i=1:8
    subplot(round(4),2,i);
    scatter(image_pts(1,:,i),image_pts(2,:,i),'filled');
    title(['Frame from Camera ',int2str(i)]);
    xlabel('X Axis');
    ylabel('Y Axis');
    zlabel('Z Axis');
    legend('Points on cube');
    grid minor;
end

%Maintaining proper variables dimensions.
temp_cube_pts_cam=zeros(8,3,56);
temp_image_pts=zeros(8,2,56);
for i=1:8
    temp_cube_pts_cam(i,:,:)=cube_pts_cam(:,:,i);
    temp_image_pts(i,:,:)=image_pts(1:2,:,i);
end
cube_pts_cam=temp_cube_pts_cam;
image_pts=temp_image_pts;