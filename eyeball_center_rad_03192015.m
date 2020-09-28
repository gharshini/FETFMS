pp=100
figure,imshow(img_gray(:,:,pp));
h=imellipse;
position=wait(h);
BW=createMask(h);
figure,imshow(BW);
[center radii]=imfindcircles(BW,[1 100]);