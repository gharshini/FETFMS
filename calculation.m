%coordinate Calculations
%peak 2 peak, velocity, Acceleration and Jerk
function [p2p_dis_l, Avg_vel_l, Avg_Acc_l, Avg_jerk_l, p2p_dis_r, Avg_vel_r, Avg_Acc_r, Avg_jerk_r]=calculation(final_theta_l, final_theta_r,f,nframes)
% p=final_theta_l(~isnan(final_theta_l));
% final_theta_l=final_theta_l-p(1);
% figure,plot(head_theta(60:378))
total_dis=sum(final_theta_l(~isnan(final_theta_l)));
m1=max(final_theta_l);
m2=min(final_theta_l);
p2p_dis_l=m1-m2;

%Velocity
for i=2:size(final_theta_l,2)
    velocity_l(i)=((final_theta_l(i)-final_theta_l(i-1))*f);
end
tot_vel_pos=sum(velocity_l(velocity_l>0));
tot_vel_neg=sum(velocity_l(velocity_l<0));
m1_vel_pos=max(velocity_l(velocity_l>0));
m2_vel_neg=min(velocity_l(velocity_l>0));
p2p_vel_pos=(m1_vel_pos-m2_vel_neg)/nframes;
m1_vel_pos=max(velocity_l(velocity_l<0));
m2_vel_neg=min(velocity_l(velocity_l<0));
p2p_vel_neg=(m1_vel_pos-m2_vel_neg)/nframes;
Avg_vel_l=(p2p_vel_pos+p2p_vel_neg)/2;
% figure,plot(t(1:size(velocity,2)),velocity);

%Acceleration
for i=2:size(velocity_l,2)
    ace_l(i)=((velocity_l(i)-velocity_l(i-1))*f);
end
tot_ace_pos=sum(ace_l(ace_l>0));
tot_ace_neg=sum(ace_l(ace_l<0));
m1_ace_pos=max(ace_l(ace_l>0));
m1_ace_neg=min(ace_l(ace_l>0));
p2p_ace_pos=(m1_ace_pos-m1_ace_neg)/nframes;
m1_ace_pos=max(ace_l(ace_l<0));
m2_ace_neg=min(ace_l(ace_l<0));
p2p_ace_neg=(m1_ace_pos-m2_ace_neg)/nframes;
Avg_Acc_l=(p2p_ace_pos+p2p_ace_neg)/2;
% figure,plot(t(1:size(ace,2)),ace)

%Jerk
for i=2:size(ace_l,2)
    jerk_l(i)=((ace_l(i)-ace_l(i-1))*f);
end
tot_jerk_pos=sum(jerk_l(jerk_l>0));
tot_jerk_neg=sum(jerk_l(jerk_l<0));
m1_jerk_pos=max(jerk_l(jerk_l>0));
m1_jerk_neg=min(jerk_l(jerk_l>0));
p2p_jerk_pos=(m1_jerk_pos-m1_jerk_neg)/nframes;
m1_jerk_pos=max(jerk_l(jerk_l<0));
m2_jerk_neg=min(jerk_l(jerk_l<0));
p2p_jerk_neg=(m1_jerk_pos-m2_jerk_neg)/nframes;
Avg_jerk_l=(p2p_jerk_pos+p2p_jerk_neg)/2;

%RightEye

% p=final_theta_r(~isnan(final_theta_r));
% final_theta_r=final_theta_r-p(1);
% figure,plot(head_theta(60:378))
total_dis=sum(final_theta_r(~isnan(final_theta_r)));
m1=max(final_theta_r);
m2=min(final_theta_r);
p2p_dis_r=m1-m2;
% figure,plot(t(1:size(final_theta_r,2)),final_theta_r)
% figure,plot(t(1:size(theta_r,2)),theta_r);
% figure,plot(t(1:size(final_theta_r,2)),final_theta_r)
% ylim([-110 120])
% figure,plot(t(1:size(theta_r,2)),theta_r);
% ylim([-110 120])

%Velocity
for i=2:size(final_theta_r,2)
    velocity_r(i)=((final_theta_r(i)-final_theta_r(i-1))*f);
end
tot_vel_pos=sum(velocity_r(velocity_r>0));
tot_vel_neg=sum(velocity_r(velocity_r<0));
m1_vel_pos=max(velocity_r(velocity_r>0));
m2_vel_neg=min(velocity_r(velocity_r>0));
p2p_vel_pos=(m1_vel_pos-m2_vel_neg)/nframes;
m1_vel_pos=max(velocity_l(velocity_l<0));
m2_vel_neg=min(velocity_l(velocity_l<0));
p2p_vel_neg=(m1_vel_pos-m2_vel_neg)/nframes;
Avg_vel_r=(p2p_vel_pos+p2p_vel_neg)/2;
% figure,plot(t(1:size(velocity,2)),velocity);

%Acceleration
for i=2:size(velocity_r,2)
    ace_r(i)=((velocity_r(i)-velocity_r(i-1))*f);
end
tot_ace_pos=sum(ace_r(ace_r>0));
tot_ace_neg=sum(ace_r(ace_r<0));
m1_ace_pos=max(ace_r(ace_r>0));
m1_ace_neg=min(ace_r(ace_r>0));
p2p_ace_pos=(m1_ace_pos-m1_ace_neg)/nframes;
m1_ace_pos=max(ace_l(ace_l<0));
m2_ace_neg=min(ace_l(ace_l<0));
p2p_ace_neg=(m1_ace_pos-m2_ace_neg)/nframes;
Avg_Acc_r=(p2p_ace_pos+p2p_ace_neg)/2;
% figure,plot(t(1:size(ace,2)),ace)

%Jerk
for i=2:size(ace_r,2)
    jerk_r(i)=((ace_r(i)-ace_r(i-1))*f);
end
tot_jerk_pos=sum(jerk_r(jerk_r>0));
tot_jerk_neg=sum(jerk_r(jerk_r<0));
m1_jerk_pos=max(jerk_r(jerk_r>0));
m1_jerk_neg=min(jerk_r(jerk_r>0));
p2p_jerk_pos=(m1_jerk_pos-m1_jerk_neg)/nframes;
m1_jerk_pos=max(jerk_l(jerk_l<0));
m2_jerk_neg=min(jerk_l(jerk_l<0));
p2p_jerk_neg=(m1_jerk_pos-m2_jerk_neg)/nframes;
Avg_jerk_r=(p2p_jerk_pos+p2p_jerk_neg)/2;
% figure,plot(t(1:size(jerk,2)),jerk)
% Output_r=[total_dis,p2p_dis,NaN,tot_vel_pos,tot_vel_neg,p2p_vel_pos,p2p_vel_neg,NaN,NaN,NaN,NaN,tot_ace_pos,tot_ace_neg,p2p_ace_pos,p2p_ace_neg,NaN,NaN,NaN,NaN,tot_jerk_pos,tot_jerk_neg,p2p_jerk_pos,p2p_jerk_neg]
