%*******************************Guas sydel p to p******************
close all
clear all
clc
% by Mehrdad Baba Hosein Pour
% beyond sky! 
% inlet & outlet profile : AX^2+BX+C 
ha=1;
k=1;
w(1:30,1:30,1)=0;

% A*x^3+B*x^2+C*x+0==0 stream function form

while ha>=0.01
    
    %initialization
for y=3.4:0.2:5.6
w(17:28,1,k:k+1)=1.5019*y^3-5.4007*y^2+1*y+0; %INLET
end   
for y=1:0.2:3.2
w(5:16,31,k:k+1)=4.7514*y^3-5.7514*y^2+1*y+0; %OUTLET
end

w(1:16,1,k:k+1)=0; %left
w(29:31,1,k:k+1)=100;%left
w(1:4,31,k:k+1)=0; %right
w(17:31,31,k:k+1)=100; %right
w(1,1:31,k:k+1)=0; %down
w(31,1:31,k:k+1)=100; %up

error=0;

 %solver
for j=2:30
for i=2:30
w(j,i,k+1)=0.25*(w(j,i+1,k)+w(j,i-1,k+1)+w(j+1,i,k)+w(j-1,i,k+1));
error=abs(w(j,i,k+1)-w(j,i,k))+error;
end
end
ha=error;
k=k+1;
end
IN=k
contour(0:0.2:6,0:0.2:6,w(:,:,k),50)
colorbar