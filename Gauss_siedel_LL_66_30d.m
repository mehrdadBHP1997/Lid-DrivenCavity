%*********************Guas sydel L to L*****************************
clear all
clc
ha=1;
k=1;

w(1:30,1:30,1)=0;

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

for j=2:30
A=zeros(24,24);
A(1,1)=-4;A(1,2)=1;A(29,28)=1;A(29,29)=-4;
D(1)=-(w(j+1,2,k)+w(j-1,2,k+1)+w(j,1,k+1));
D(29)=-(w(j+1,30,k)+w(j-1,30,k+1)+w(j,31,k+1));
        for i=2:28
A(i,i)=-4;
A(i,i-1)=1;
A(i,i+1)=1;
D(i)=-(w(j+1,i+1,k)+w(j-1,i+1,k+1));
       end
          w(j,2:30,k+1)=A\D';
      for i=2:30
     error=abs(w(j,i,k+1)-w(j,i,k))+error;
end
end 
  ha=error;
  k=k+1;
  end
 IN=k-1
 contour(0:0.2:6,0:0.2:6,w(:,:,k),50)
colorbar