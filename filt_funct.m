function filt_img=filt_funct(img_gray1,nframes,height,width)
%filt_img=zeros(height,width,nframes);
for i=1:nframes
%     h=fspecial('gaussian',[15 15],1);
    h=fspecial('disk',3);
    filt_img(:,:,i)=imfilter(img_gray1(:,:,i),h);
%     level=graythresh(filt_img(:,:,i));
%     img(:,:,i)=im2bw(filt_img(:,:,i),level);
end
end
