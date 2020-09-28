
function [L,rect]=cropping(img_corr,pt,radii)
x=size(img_corr,2); z=size(img_corr,1);
a1=circle(x,z,pt(1),pt(2), radii);
a1 = single(a1);
b=a1.*img_corr;
% figure,imshow(a1,[])
% figure,imshow(b,[]);
rect=[pt(1)-radii,pt(2)-radii,2*radii,2*radii];
L=imcrop(img_corr,rect);
end