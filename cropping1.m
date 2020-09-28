function [L1,rect1]=cropping1(img_corr,pt,radii)
x=size(img_corr,2); z=size(img_corr,1);
a1=circle(x,z,pt(1),pt(2), radii);
a1 = single(a1);
b=a1.*img_corr;
% figure,imshow(a1,[])
% figure,imshow(b,[]);
rect1=[pt(1)-radii,pt(2)-radii,2*radii,2*radii];
L1=imcrop(img_corr,rect1);
end