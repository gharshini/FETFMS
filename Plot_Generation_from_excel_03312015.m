tic
clear all;
clc;
pathname='F:\New Datas_Protocal_02052015\Case_excel';
f=dir(strcat(pathname,'\*.xls'));
m=size(f,1);
for j=1:m
    fname=strcat(pathname,'\',f(j).name);
    [xlinfo1 xlinfo2] = xlsfinfo(fname);
    n=size(xlinfo2,2);
    s(j).left=[];
    s(j).right=[];
    s(j).left_1=[];
    s(j).right_1=[];
    for i=1:n
        [Tnum Ttext Traw]=xlsread(fname,i);
        if cell2mat(Traw(2,8))==0
            final_theta_l=Tnum(15:size(Tnum,1),10)';
            s(j).left=horzcat(s(j).left,[NaN,NaN,NaN,NaN,NaN],final_theta_l);
            final_theta_r=Tnum(15:size(Tnum,1),11)';
            s(j).right=horzcat(s(j).right,[NaN,NaN,NaN,NaN,NaN],final_theta_r);
            m1=1-isnan(final_theta_l);
            m2=1-isnan(final_theta_r);
            m3=m1.*m2;
            m3(m3==0)=NaN;
            final_theta_l_p=m3.*final_theta_l;
            final_theta_r_p=m3.*final_theta_r;
            final_theta_l=final_theta_l_p(~isnan(final_theta_l_p));
            final_theta_r=final_theta_r_p(~isnan(final_theta_r_p));
            final_theta_l=smooth(final_theta_l,3)';
            s(j).left_1=horzcat(s(j).left_1,[NaN,NaN,NaN,NaN,NaN],final_theta_l);
            final_theta_r=smooth(final_theta_r,3)';
            s(j).right_1=horzcat(s(j).right_1,[NaN,NaN,NaN,NaN,NaN],final_theta_r);
            t=(size(final_theta_r,2)/Tnum(1,6));
            if t>=4
                bs(j).GA(i) = cell2mat(Traw(2,1));
                bs(j).File_name=Tnum(1,5);
                bs(j).Freq(i)=Tnum(1,6);
                bs(j).nframes(i)=Tnum(1,4);
                bs(j).cor(i)=corr2(final_theta_l,final_theta_r);
                x1=(final_theta_l-mean(final_theta_l))/abs(std(final_theta_l));
                x2=(final_theta_r-mean(final_theta_r))/abs(std(final_theta_r));
                bs(j).cor_curved(i)=corr2(x1,x2);
                [bs(j).left_P2P(i), bs(j).left_avg_speed(i), bs(j).left_avg_accel(i), bs(j).left_avg_jerk(i), bs(j).right_P2P(i), bs(j).right_avg_speed(i), bs(j).right_avg_accel(i),  bs(j).right_avg_jerk(i)]=calculation(final_theta_l, final_theta_r, bs(j).Freq(i),bs(j).nframes(i));
            end
            
        elseif cell2mat(Traw(2,8))==1
            final_theta_l=Tnum(15:size(Tnum,1),10)';
            s(j).left=horzcat(s(j).left,[NaN,NaN,NaN,NaN,NaN],final_theta_l);
            final_theta_r=Tnum(15:size(Tnum,1),11)';
            s(j).right=horzcat(s(j).right,[NaN,NaN,NaN,NaN,NaN],final_theta_r);
            m1=1-isnan(final_theta_l);
            m2=1-isnan(final_theta_r);
            m3=m1.*m2;
            m3(m3==0)=NaN;
            final_theta_l_p=m3.*final_theta_l;
            final_theta_r_p=m3.*final_theta_r;
            final_theta_l=final_theta_l_p(~isnan(final_theta_l_p));
            final_theta_r=final_theta_r_p(~isnan(final_theta_r_p));
            final_theta_l=smooth(final_theta_l,3)';
            s(j).left_1=horzcat(s(j).left_1,[NaN,NaN,NaN,NaN,NaN],final_theta_l);
            final_theta_r=smooth(final_theta_r,3)';
            s(j).right_1=horzcat(s(j).right_1,[NaN,NaN,NaN,NaN,NaN],final_theta_r);
            t=(size(final_theta_r,2)/Tnum(1,6));
            if t>=4
                as(j).GA(i) = cell2mat(Traw(2,1));
                as(j).File_name=Tnum(1,5);
                as(j).Freq(i)=Tnum(1,6);
                as(j).nframes(i)=Tnum(1,4);
                as(j).cor(i)=corr2(final_theta_l,final_theta_r);
                x1=(final_theta_l-mean(final_theta_l))/abs(std(final_theta_l));
                x2=(final_theta_r-mean(final_theta_r))/abs(std(final_theta_r));
                as(j).cor_curved(i)=corr2(x1,x2);
                [as(j).left_P2P(i), as(j).left_avg_speed(i), as(j).left_avg_accel(i), as(j).left_avg_jerk(i), as(j).right_P2P(i), as(j).right_avg_speed(i), as(j).right_avg_accel(i),  as(j).right_avg_jerk(i)]=calculation(final_theta_l, final_theta_r, as(j).Freq(i),as(j).nframes(i));
            end
        end
    end
end
%%
%Remove Zeros
for i=1:m
    as(i).GA=as(i).GA(as(i).GA~=0);
    as(i).cor=as(i).cor(as(i).cor~=0);
    as(i).cor_curved=as(i).cor_curved(as(i).cor_curved~=0);
    as(i).left_P2P=as(i).left_P2P(as(i).left_P2P~=0);
    as(i).left_avg_speed=as(i).left_avg_speed(as(i).left_avg_speed~=0);
    as(i).left_avg_accel=as(i).left_avg_accel(as(i).left_avg_accel~=0);
    as(i).left_avg_jerk=as(i).left_avg_jerk(as(i).left_avg_jerk~=0);
    as(i).right_P2P=as(i).right_P2P(as(i).right_P2P~=0);
    as(i).right_avg_speed=as(i).right_avg_speed(as(i).right_avg_speed~=0);
    as(i).right_avg_accel=as(i).right_avg_accel(as(i).right_avg_accel~=0);
    as(i).right_avg_jerk=as(i).right_avg_jerk(as(i).right_avg_jerk~=0);    
end
for i=1:m
    bs(i).GA=bs(i).GA(bs(i).GA~=0);
    bs(i).cor=bs(i).cor(bs(i).cor~=0);
    bs(i).cor_curved=bs(i).cor_curved(bs(i).cor_curved~=0);
    bs(i).left_P2P=bs(i).left_P2P(bs(i).left_P2P~=0);
    bs(i).left_avg_speed=bs(i).left_avg_speed(bs(i).left_avg_speed~=0);
    bs(i).left_avg_accel=bs(i).left_avg_accel(bs(i).left_avg_accel~=0);
    bs(i).left_avg_jerk=bs(i).left_avg_jerk(bs(i).left_avg_jerk~=0);
    bs(i).right_P2P=bs(i).right_P2P(bs(i).right_P2P~=0);
    bs(i).right_avg_speed=bs(i).right_avg_speed(bs(i).right_avg_speed~=0);
    bs(i).right_avg_accel=bs(i).right_avg_accel(bs(i).right_avg_accel~=0);
    bs(i).right_avg_jerk=bs(i).right_avg_jerk(bs(i).right_avg_jerk~=0);    
end

%%
figure; plot(0,0);
h1 = gca;

figure; plot(0,0);
h2 = gca;

figure; plot(0,0);
h3 = gca;

figure; plot(0,0);
h4 = gca;

figure; plot(0,0);
h5 = gca;

figure; plot(0,0);
h6 = gca;

figure; plot(0,0);
h7 = gca;

figure; plot(0,0);
h8 = gca;

figure; plot(0,0);
h9 = gca;

figure; plot(0,0);
h10 = gca;

for j = 1:m
    axes(h1);
    hold on
    plot(bs(j).GA(1,size(bs(j).left_P2P,2)),bs(j).left_P2P,'b*');
    plot(as(j).GA(1,size(as(j).left_P2P,2)),as(j).left_P2P,'g*');
    hold off
    
    GA(j)=mean(bs(j).GA(:));
    
    median_P2P_bs_left(j) = median(bs(j).left_P2P(:));
    IQR_P2P_bs_left(j) = iqr(bs(j).left_P2P(:))';
    
    median_P2P_as_left(j) = median(as(j).left_P2P(:));
    IQR_P2P_as_left(j) = iqr(as(j).left_P2P(:));
    
    axes(h2);
    hold on
    plot(bs(j).GA(1,size(bs(j).right_P2P,2)),bs(j).right_P2P,'bo');
    plot(as(j).GA(1,size(as(j).right_P2P,2)),as(j).right_P2P,'go');
    hold off;
    
    GA(j)=mean(bs(j).GA(:));
    
    median_P2P_bs_right(j) = median(bs(j).right_P2P(:));
    IQR_P2P_bs_right(j) = iqr(bs(j).right_P2P(:));
    
    median_P2P_as_right(j) = median(as(j).right_P2P(:));
    IQR_P2P_as_right(j) = iqr(as(j).right_P2P(:));
    
    axes(h3);
    hold on
    plot(bs(j).GA(1,size(bs(j).cor,2)),bs(j).cor,'b*');
    plot(as(j).GA(1,size(as(j).cor,2)),as(j).cor,'g*');
    hold off;
    GA(j)=mean(bs(j).GA(:));
    
    median_corr_bs(j) = median(bs(j).cor(:));
    IQR_corr_bs(j) = iqr(bs(j).cor(:))';
    
    median_corr_as(j) = median(as(j).cor(:));
    IQR_corr_as(j) = iqr(as(j).cor(:));
    
    axes(h4);
    hold on
    plot(bs(j).GA(1,size(bs(j).cor_curved,2)),bs(j).cor_curved,'b*');
    plot(as(j).GA(1,size(as(j).cor_curved,2)),as(j).cor_curved,'g*');
    hold off;
    
    GA(j)=mean(bs(j).GA(:));
    
    median_corr_curved_bs(j) = median(bs(j).cor_curved(:));
    IQR_corr_curved_bs(j) = iqr(bs(j).cor_curved(:));
    
    median_corr_curved_as(j) = median(as(j).cor_curved(:));
    IQR_corr_curved_as(j) = iqr(as(j).cor_curved(:));
    
    axes(h5);
    hold on
    plot( bs(j).GA(1,size(bs(j).left_avg_speed,2)),bs(j).left_avg_speed,'b*');
    plot( as(j).GA(1,size(as(j).left_avg_speed,2)),as(j).left_avg_speed,'g*');
    hold off
    
    median_avgSpeed_bs_left(j) = median(bs(j).left_avg_speed(:));
    IQR_avgSpeed_bs_left(j) = iqr(bs(j).left_avg_speed(:));
    
    median_avgSpeed_as_left(j) = median(as(j).left_avg_speed(:));
    IQR_avgSpeed_as_left(j) = iqr(as(j).left_avg_speed(:));
    
    axes(h6);
    hold on
    plot( bs(j).GA(1,size(bs(j).right_avg_speed,2)),bs(j).right_avg_speed,'bo');
    plot( as(j).GA(1,size(as(j).right_avg_speed,2)),as(j).right_avg_speed,'go');
    hold off
    
    median_avgSpeed_bs_right(j) = median(bs(j).right_avg_speed(:));
    IQR_avgSpeed_bs_right(j) = iqr(bs(j).right_avg_speed(:));
    
    median_avgSpeed_as_right(j) = median(as(j).right_avg_speed(:));
    IQR_avgSpeed_as_right(j) = iqr(as(j).right_avg_speed(:));
    
    axes(h7);
    hold on
    plot( bs(j).GA(1,size(bs(j).left_avg_accel,2)),bs(j).left_avg_accel,'b*');
    plot( as(j).GA(1,size(as(j).left_avg_accel,2)),as(j).left_avg_accel,'g*');
    hold off
    
    median_avgAcc_bs_left(j) = median(bs(j).left_avg_accel(:));
    IQR_avgAcc_bs_left(j) = iqr(bs(j).left_avg_accel(:));
    
    median_avgAcc_as_left(j) = median(as(j).left_avg_accel(:));
    IQR_avgAcc_as_left(j) = iqr(as(j).left_avg_accel(:));
    
    axes(h8);
    hold on
    plot( bs(j).GA(1,size(bs(j).right_avg_accel,2)),bs(j).right_avg_accel,'bo');
    plot( as(j).GA(1,size(as(j).right_avg_accel,2)),as(j).right_avg_accel,'go');
    hold off
    
    median_avgAcc_bs_right(j) = median(bs(j).right_avg_accel(:));
    IQR_avgAcc_bs_right(j) = iqr(bs(j).right_avg_accel(:));
    
    median_avgAcc_as_right(j) = median(as(j).right_avg_accel(:));
    IQR_avgAcc_as_right(j) = iqr(as(j).right_avg_accel(:));
    
    axes(h9);
    hold on
    plot( bs(j).GA(1,size(bs(j).left_avg_jerk,2)),bs(j).left_avg_jerk,'b*');
    plot( as(j).GA(1,size(as(j).left_avg_jerk,2)),as(j).left_avg_jerk,'g*');
    hold off
    
    median_avgJerk_bs_left(j) = median(bs(j).left_avg_jerk(:));
    IQR_avgJerk_bs_left(j) = iqr(bs(j).left_avg_jerk(:));
    
    median_avgJerk_as_left(j) = median(as(j).left_avg_jerk(:));
    IQR_avgJerk_as_left(j) = iqr(as(j).left_avg_jerk(:));
    
    axes(h10);
    hold on
    plot( bs(j).GA(1,size(bs(j).right_avg_jerk,2)),bs(j).right_avg_jerk,'bo');
    plot( as(j).GA(1,size(as(j).right_avg_jerk,2)),as(j).right_avg_jerk,'go');
    hold off
    
    median_avgJerk_bs_right(j) = median(bs(j).right_avg_jerk(:));
    IQR_avgJerk_bs_right(j) = iqr(bs(j).right_avg_jerk(:));
    
    median_avgJerk_as_right(j) = median(as(j).right_avg_jerk(:));
    IQR_avgJerk_as_right(j) = iqr(as(j).right_avg_jerk(:));  
    
end

figure;errorbar(GA,median_corr_bs,IQR_corr_bs,'b*');
hold on;errorbar(GA,median_corr_as,IQR_corr_as,'g*');

figure;errorbar(GA,median_corr_curved_bs,IQR_corr_curved_bs,'b*');
hold on;errorbar(GA,median_corr_curved_as,IQR_corr_curved_as,'g*');

figure;errorbar(GA,median_P2P_bs_left,IQR_P2P_bs_left,'*');
hold on;errorbar(GA,median_P2P_as_left,IQR_P2P_as_left,'g*');

figure;errorbar(GA,median_P2P_bs_right,IQR_P2P_bs_right,'o');
hold on;errorbar(GA,median_P2P_as_right,IQR_P2P_as_right,'go');

figure;errorbar(GA,median_avgSpeed_bs_left,IQR_avgSpeed_bs_left,'*');
hold on;errorbar(GA,median_avgSpeed_as_left,IQR_avgSpeed_as_left,'g*');

figure;errorbar(GA,median_avgSpeed_bs_right,IQR_avgSpeed_bs_right,'o');
hold on;errorbar(GA,median_avgSpeed_as_right,IQR_avgSpeed_as_right,'go');

figure;errorbar(GA,median_avgAcc_bs_left,IQR_avgAcc_bs_left,'*');
hold on;errorbar(GA,median_avgAcc_as_left,IQR_avgAcc_as_left,'g*');

figure;errorbar(GA,median_avgAcc_bs_right,IQR_avgAcc_bs_right,'o');
hold on;errorbar(GA,median_avgAcc_as_right,IQR_avgAcc_as_right,'go');

figure;errorbar(GA,median_avgJerk_bs_left,IQR_avgJerk_bs_left,'*');
hold on;errorbar(GA,median_avgJerk_as_left,IQR_avgJerk_as_left,'g*');

figure;errorbar(GA,median_avgJerk_bs_right,IQR_avgJerk_bs_right,'o');
hold on;errorbar(GA,median_avgJerk_as_right,IQR_avgJerk_as_right,'go');

for j=1:m
    figure;
    plot(s(j).left_1,'b')
    hold on
    plot(s(j).right_1,'g')
end

toc