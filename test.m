clc
clear
I=imread('111.jpg');  
imshow(I);
k = waitforbuttonpress;              % 等待鼠标按下
point1 = get(gca,'CurrentPoint');    % 鼠标按下了
finalRect = rbbox;                   %
point2 = get(gca,'CurrentPoint');    % 鼠标松开了
point1 = int32(point1(1,1:2));              % 提取出两个点
point2 = int32(point2(1,1:2));
x1=fix(point1(1));
y1=fix(point1(2));
x2=fix(point2(1));
y2=fix(point2(2));
figure
img=I(y1:y2,x1:x2,:);
imshow(img)
% img=int8(zeros(fix(point2(1)-point1(1))+2,fix(point2(2)-point1(2))+2));
% for i=fix(point1(1)):fix(point2(1))
% for j=fix(point1(2)):fix(point2(2))
%     img(i-x_,j-y_)=I(i,j);
% end
% end
% figure
% imshow(img);