function writ_vid= wrvideo(img_video,nframes)
fname=input('Enter file name with extension','s');
ext='.avi';
filename=strcat(fname,ext);
writ_vid=VideoWriter(filename);
open(writ_vid);
for i =1:nframes-1
    writeVideo(writ_vid,im2uint8(img_video(:,:,:,i)));
end
close(writ_vid);
end