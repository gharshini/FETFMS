% vect_x=u_r-u_l;
% vect_y=v_r-v_l;
% disp('Generating Video and Plotting Head Motion');
% f=rate;
% videoPlayer = vision.VideoPlayer('Position', [100, 100, width, height]);
% pause(2);
% for i=1:nframes-1
%     if i>180
%         pause(0.2);
%         track_img=insertMarker(img_gray(:,:,i),[u_r(i),v_r(i)],'*','color','red','size',8);
%         track_img1=insertMarker(track_img,[u_l(i),v_l(i)],'o','color','red','size',8);
%         step(videoPlayer,track_img1);
%         head_theta(i)=atan2d(vect_y(i),vect_x(i));
%         hold on
%         plot(i,head_theta(i),'o')
%     else
%         pause(0.02);
%         track_img=insertMarker(img_gray(:,:,i),[2000,2000],'*','color','red','size',8);
%         track_img1=insertMarker(track_img,[2000,2000],'o','color','red','size',8);
%         step(videoPlayer,track_img1);
%         head_theta(i)=NaN;
%         hold on
%         plot(i,head_theta(i),'o')
%     end
% end
% figure,plot(head_theta)
s=struct;
s1=struct;
s2=struct;
s3=struct;
s1.Height=height;
s1.Width=width;
s1.NFrames=nframes;
s1.videoName=fname;
s1.Frequency=rate;
s1.Correlation= cor2;
s2.P2P_Distance=p2p_dis_l;
s2.Average_Velocity=Avg_vel_l;
s2.Average_Acceleration=Avg_Acc_l;
s2.Average_Jerk=Avg_jerk_l;
s3.P2P_Distance=p2p_dis_r;
s3.Average_Velocity=Avg_vel_r;
s3.Average_Acceleration=Avg_Acc_r;
s3.Average_Jerk=Avg_jerk_r;
s.u_l=u_l';
s.v_l=v_l';
s.u_r=u_r';
s.v_r=v_r';
s.x_l=x_prime_l';
s.y_l=y_prime_l';
s.x_r=x_prime_r';
s.y_r=y_prime_r';
s.head_theta=head_theta';
s.final_theta_l=final_theta_l';
s.final_theta_r=final_theta_r';
s.velocity_l=velocity_l';
s.velocity_r=velocity_r';
s.ace_l=ace_l';
s.ace_r=ace_r';
s.jerk_l=jerk_l';
s.jerk_r=jerk_r';
T=struct2table(s);
T1=struct2table(s1);
T2=struct2table(s2);
T3=struct2table(s3);
warning('off','MATLAB:xlswrite:AddSheet')
writetable(T1,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\HUZ684128\HUZ684132\HUZ684132.xls','sheet',1)
writetable(T2,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\HUZ684128\HUZ684132\HUZ684132.xls','sheet',1,'Range','A5')
writetable(T3,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\HUZ684128\HUZ684132\HUZ684132.xls','sheet',1,'Range','A10')
writetable(T,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\HUZ684128\HUZ684132\HUZ684132.xls','sheet',1,'Range','A15')
% save('C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\HUZ684128\HUZ684132\x','s');