%Lefteye
%Determine the Center of the eye ball using NORMXCORR2
%1.Get the cropped image
%2.Do correlation of the image with the entire image
%3.Obtain the center of the eyeball
close all
h1=warndlg('All Processing for Left Eye');
waitfor(h1);
disp('Correlation and Center of Eyeball');
tic
ppp_l=50;
figure,imshow(img_gray(:,:,ppp_l));
h=imellipse;
position=wait(h);
BW=createMask(h);
figure,imshow(BW);
[pt rad]=imfindcircles(BW,[1 100]);
%Warning box to alert the uimser on eyeball region cropping
% h=warndlg('First choose the point to the left to centre and then at the top','Warning !');
% waitfor(h);
% figure,imshow(img_gray(:,:,ppp_l));
% [x0,y0]=ginput(3);
% %coordinate of the eyeball region
% rec_l=[(x0(3)-(x0(1)-x0(2))),(y0(3)-(y0(1)-y0(2))),2.*(x0(1)-x0(2)),2.*(y0(1)-y0(3))]
% pt=[x0(1),y0(1)];
% rad=floor(sqrt((x0(2)-x0(1)).^2+((y0(2)-y0(1)).^2)));
[img,rec_l]=cropping(img_gray(:,:,ppp_l),pt(1,:),rad(1)+20);
%coordinate of the plane to crop and perform the correlation for eyeball
%correlation.
rec1_l=[rec_l(1,1)-100,rec_l(1,2)-50,rec_l(1,3)+200,rec_l(1,4)+150]
%Plane image for correlation with template
for i=1:nframes
    img_corr_l(:,:,i)=imcrop(img_gray(:,:,i),rec1_l);
end
%Correlation of individual frames of the video
for i=1:nframes-1
    cor_l=normxcorr2(img,img_corr_l(:,:,i+1));
    num=max(max(cor_l));
    [b a]=ind2sub(size(cor_l),find(cor_l==num));
    u_l(i)=(rec1_l(1,1)+a-((size(img,2)+1)/2));    
    v_l(i)=(rec1_l(1,2)+b-((size(img,1)+1)/2));
end
%verification for proper correlation
qqq_l=1;
figure,imshow(img_gray(:,:,qqq_l));
hold on
plot(u_l,v_l,'o');
toc
