% n=str2double(inputdlg('Enter the number of Sheets in Excel'));
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
    
    for i=1:n
        
        [Tnum Ttext Traw]=xlsread(fname,i);
        
        if cell2mat(Traw(2,8))==0
            bs(j).GA(i) = cell2mat(Traw(2,1));
            bs(j).correlation(i) = cell2mat(Traw(2,7));
            
            bs(j).left_P2P(i) = cell2mat(Traw(6,1));
            bs(j).right_P2P(i) = cell2mat(Traw(11,1));
            
            bs(j).left_avg_speed(i) = cell2mat(Traw(6,2));
            bs(j).right_avg_speed(i) = cell2mat(Traw(11,2));
            
            bs(j).left_avg_accel(i) = cell2mat(Traw(6,3));
            bs(j).right_avg_accel(i) = cell2mat(Traw(11,3));
            
            bs(j).left_avg_jerk(i) = cell2mat(Traw(6,4));
            bs(j).right_avg_jerk(i) = cell2mat(Traw(11,4));
            
        elseif cell2mat(Traw(2,8))==1
            
            as(j).GA(i) = cell2mat(Traw(2,1));
            as(j).correlation(i) = cell2mat(Traw(2,7));
            
            as(j).left_P2P(i) = cell2mat(Traw(6,1));
            as(j).right_P2P(i) = cell2mat(Traw(11,1));
            
            as(j).left_avg_speed(i) = cell2mat(Traw(6,2));
            as(j).right_avg_speed(i) = cell2mat(Traw(11,2));
            
            as(j).left_avg_accel(i) = cell2mat(Traw(6,3));
            as(j).right_avg_accel(i) = cell2mat(Traw(11,3));
            
            as(j).left_avg_jerk(i) = cell2mat(Traw(6,4));
            as(j).right_avg_jerk(i) = cell2mat(Traw(11,4));
            
        end
    end
end

figure; plot(0,0);
h1 = gca;

figure; plot(0,0);
h2 = gca;

figure; plot(0,0);
h3 = gca;

for j = 1:m
    axes(h1);
    hold on
    plot(bs(j).GA(:),bs(j).left_P2P,'*');
    plot(bs(j).GA(:),bs(j).right_P2P,'o');

    plot(as(j).GA(:),as(j).left_P2P,'g*');
    plot(as(j).GA(:),as(j).right_P2P,'go');
    hold off;
    
    GA(j)=mean(bs(j).GA(:));
    
    mean_P2P_bs_left(j) = mean(bs(j).left_P2P(:));
    std_P2P_bs_left(j) = std(bs(j).left_P2P(:));
    
    mean_P2P_bs_right(j) = mean(bs(j).right_P2P(:));
    std_P2P_bs_right(j) = std(bs(j).right_P2P(:));
    
    mean_P2P_as_left(j) = mean(as(j).left_P2P(:));
    std_P2P_as_left(j) = std(as(j).left_P2P(:));
    
    mean_P2P_as_right(j) = mean(as(j).right_P2P(:));
    std_P2P_as_right(j) = std(as(j).right_P2P(:));
    
    
    axes(h2);
    hold on
    plot(bs(j).GA(:),bs(j).correlation,'*');
    plot(as(j).GA(:),as(j).correlation,'g*');
    hold off;
    
    
    mean_corr_bs(j) = mean(bs(j).correlation(:)+1);
    std_corr_bs(j) = std(bs(j).correlation(:)+1);
    
    mean_corr_as(j) = mean(as(j).correlation(:)+1);
    std_corr_as(j) = std(as(j).correlation(:)+1);
    
    axes(h3);
    hold on
    plot( bs(j).GA(:),bs(j).left_avg_speed,'*');
    plot( bs(j).GA(:),bs(j).right_avg_speed,'o');

    plot( as(j).GA(:),as(j).left_avg_speed,'g*');
    plot( as(j).GA(:),as(j).right_avg_speed,'go');
    hold off
    
    
    mean_avgSpeed_bs_left(j) = mean(bs(j).left_avg_speed(:));
    std_avgSpeed_bs_left(j) = std(bs(j).left_avg_speed(:));
    
    mean_avgSpeed_bs_right(j) = mean(bs(j).right_avg_speed(:));
    std_avgSpeed_bs_right(j) = std(bs(j).right_avg_speed(:));
    
    mean_avgSpeed_as_left(j) = mean(as(j).left_avg_speed(:));
    std_avgSpeed_as_left(j) = std(as(j).left_avg_speed(:));
    
    mean_avgSpeed_as_right(j) = mean(as(j).right_avg_speed(:));
    std_avgSpeed_as_right(j) = std(as(j).right_avg_speed(:));
    
    
end

figure;errorbar(GA,mean_corr_bs,std_corr_bs,'*');
hold on;errorbar(GA,mean_corr_as,std_corr_as,'g*');

figure;errorbar(GA,mean_P2P_bs_left,std_P2P_bs_left,'*');
hold on;errorbar(GA,mean_P2P_bs_right,std_P2P_bs_right,'o');
hold on;errorbar(GA,mean_P2P_as_left,std_P2P_as_left,'g*');
hold on;errorbar(GA,mean_P2P_as_right,std_P2P_as_right,'go');

figure;errorbar(GA,mean_avgSpeed_bs_left,std_avgSpeed_bs_left,'*');
hold on;errorbar(GA,mean_avgSpeed_bs_right,std_avgSpeed_bs_right,'o');
hold on;errorbar(GA,mean_avgSpeed_as_left,std_avgSpeed_as_left,'g*');
hold on;errorbar(GA,mean_avgSpeed_as_right,std_avgSpeed_as_right,'go');

toc