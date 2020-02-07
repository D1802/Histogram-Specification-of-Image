%Histogram Specification of Image
%DARPAN V SARODE
%BT17ECE056

clc;
clear all;
close all;
img_arc=imread('Lenna.jpg');
ref=imread('Lenna.jpg');

imgr=img_arc(:,:,1);
imgg=img_arc(:,:,2);
imgb=img_arc(:,:,3);

imgr2=ref(:,:,1);
imgg2=ref(:,:,1);
imgb2=ref(:,:,1);

Mnimgr=imhist(imgr);
Mnimgg=imhist(imgg);
Mnimgb=imhist(imgb);

Mnimgr2=imhist(imgr2);
Mnimgg2=imhist(imgg2);
Mnimgb2=imhist(imgb2);

outr=histeq(imgr,Mnimgr2);
outg=histeq(imgg,Mnimgg2);
outb=histeq(imgb,Mnimgb2);

histsp(:,:,1)=outr;
histsp(:,:,2)=outg;
histsp(:,:,3)=outb;

figure(1);
subplot(2,2,1);
imshow(ref);title('Refrence Image');
subplot(2,2,2);
imshow(img_arc);title('Input Image');
subplot(2,2,4);
imshow(histsp);title('Result Image');
%plot for Histogram Specification
figure(2);
subplot(331);plot(Mnimgr);title('Red Input');
subplot(334);plot(Mnimgg);title('Green Input');
subplot(337);plot(Mnimgb);title('Blue Input');
subplot(332);plot(Mnimgr2);title('Red Ref');
subplot(335);plot(Mnimgg2);title('Green Input');
subplot(338);plot(Mnimgb2);title('Blue Ref');
subplot(333);imhist(outr);title('Red Result');
subplot(336);imhist(outg);title('Green Result');
subplot(339);imhist(outb);title('Blue Result');