% %Lens Tracking
disp('Generating Video and Plotting Displacement');
f=rate;
videoPlayer = vision.VideoPlayer('Position', [100, 100, width, height]);
pause(2);
for i=1:nframes-1
    if i<nframes
        pause(0.1);
        track_img=insertMarker(img_corr_l(:,:,i),[x_l(i),y_l(i)],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[u_l(i),v_l(i)],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        y_prime_l(i)= v_l(i)-y_l(i);
        x_prime_l(i)= u_l(i)-x_l(i);
        theta_l(i)=atan2d(y_prime_l(i),x_prime_l(i));
        hold on
        plot(i,theta_l(i),'o')
    else
        theta_l(i)=NaN;
        pause(0.1);
        track_img=insertMarker(img_corr_l(:,:,i),[2000,2000],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[2000,2000],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        x_prime_l(i)=NaN;
        y_prime_l(i)=NaN;
        hold on
        plot(i,theta_l(i),'o')
    end
    img_video_l(:,:,:,i)=track_img1;
end
%%
disp('Generating Video and Plotting Displacement');
f=rate;
videoPlayer = vision.VideoPlayer('Position', [100, 100, width, height]);
pause(2);
for i=1:nframes-1
    if i<nframes
        pause(0.1);
        track_img=insertMarker(img_corr_r(:,:,i),[x_r(i),y_r(i)],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[u_r(i),v_r(i)],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        y_prime_r(i)= v_r(i)-y_r(i);
        x_prime_r(i)= u_r(i)-x_r(i);
        theta_r(i)=atan2d(y_prime_l(i),x_prime_r(i));
        hold on
        plot(i,theta_r(i),'o')
    else
        theta_r(i)=NaN;
        pause(0.1);
        track_img=insertMarker(img_corr_r(:,:,i),[2000,2000],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[2000,2000],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        x_prime_r(i)=NaN;
        y_prime_l(i)=NaN;
        hold on
        plot(i,theta_r(i),'o')
    end
    img_video_r(:,:,:,i)=track_img1;
end