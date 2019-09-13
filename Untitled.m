clear all 
clc
close all

b='introduzca tetha 1:';
thetaDeg1=input(b);
thetaRad1=deg2rad(thetaDeg1);

c='introduzca tetha 2:';
thetaDeg2=input(c);
thetaRad2=deg2rad(thetaDeg2);


d='introduzca l1:';
l1=input(d);
e='introduzca l2:';
l2=input(e);


printAxis();%imprime eje x,y
p1= [0;0;0];


 TRz1=[cos(thetaRad1) -sin(thetaRad1) 0 0;sin(thetaRad1) cos(thetaRad1) 0 0;0 0 1 0;0 0 0 1]; % primera rotacion 
 TTx1=[1 0 0 l1;0 1 0 0;0 0 1 0;0 0 0 1];% primera traslacion

T1=TRz1*TTx1;
p2=T1(1:3,4);


%SEGUNDO ESLABON
 
TRz2=[cos(thetaRad2) -sin(thetaRad2) 0 0;sin(thetaRad2) cos(thetaRad2) 0 0;0 0 1 0;0 0 0 1]; % segundarotacion 
TTx2=[1 0 0 l2;0 1 0 0;0 0 1 0;0 0 0 1];% segundatraslacion
T2=TRz2*TTx2;
TF=T1*T2;
p3=TF(1:3,4);


v1x=TRz1(1:3,1);%se pone el uno al final porque representa a x
v1y=TRz1(1:3,2);%se pone 2 al final porque representa a y

v2x=p2+T1(1:3,1);
v2y=p2+T1(1:3,2);

v3x=p3+TF(1:3,1);
v3y=p3+TF(1:3,1);


%las siguientes dos lineas son de los eslabones
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(2) p2(2)],'color',[0 0 0],'linewidth',5);
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(2)],'color',[0.8 0 0.8],'linewidth',5);

%eje x y pequeños del p1
line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(2) v1x(2)],'color',[1 0 0],'linewidth',5);
line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(2) v1y(2)],'color',[0 1 0],'linewidth',5);

%eje x y pequeños del p2
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(2) v2x(2)],'color',[1 0 0],'linewidth',5);
line([p2(1) v2y(1)],[p2(2) v2y(2)],[p2(2) v2y(2)],'color',[0 1 0],'linewidth',5);
%eje x y pequeños del p3
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(2) v3x(2)],'color',[1 0 0],'linewidth',5);
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(2) v3y(2)],'color',[0 1 0],'linewidth',5);

