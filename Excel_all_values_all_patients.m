%write to excel
m=size(bs,2);
for j=1:m
    s1.GA=bs(j).GA';
    s1.Freq=bs(j).Freq';
    s1.cor=bs(j).cor';
    s1.cor_curved=bs(j).cor_curved';
    s1.left_P2P=bs(j).left_P2P';
    s1.left_avg_speed=bs(j).left_avg_speed';
    s1.left_avg_accel=bs(j).left_avg_accel';
    s1.left_avg_jerk=bs(j).left_avg_jerk';
    s1.right_P2P=bs(j).right_P2P';
    s1.right_avg_speed=bs(j).right_avg_speed';
    s1.right_avg_accel=bs(j).right_avg_accel';
    s1.right_avg_jerk=bs(j).right_avg_jerk';
    s1.Freq=s1.Freq(1:size(bs(j).left_P2P,2),:);
    s1.GA=s1.GA(1:size(bs(j).left_P2P,2),:);
    T1=struct2table(s1);
    warning('off','MATLAB:xlswrite:AddSheet')
    path1='F:\Videos_test\';
    typ='.xls';
    fna='BS_10';
    fna1=strcat(path1,fna);
    fname1=strcat(fna1,typ);
    writetable(T1,fname1,'sheet',j)
    clear s1
    clear T1
end
%%
m=size(bs,2);
for j=1:m
    s1.GA=as(j).GA';
    s1.Freq=as(j).Freq';
    s1.cor=as(j).cor';
    s1.cor_curved=as(j).cor_curved';
    s1.left_P2P=as(j).left_P2P';
    s1.left_avg_speed=as(j).left_avg_speed';
    s1.left_avg_accel=as(j).left_avg_accel';
    s1.left_avg_jerk=as(j).left_avg_jerk';
    s1.right_P2P=as(j).right_P2P';
    s1.right_avg_speed=as(j).right_avg_speed';
    s1.right_avg_accel=as(j).right_avg_accel';
    s1.right_avg_jerk=as(j).right_avg_jerk';
    s1.Freq=s1.Freq(1:size(as(j).left_P2P,2),:);
    s1.GA=s1.GA(1:size(as(j).left_P2P,2),:);
    T1=struct2table(s1);
    warning('off','MATLAB:xlswrite:AddSheet')
    path1='F:\Videos_test\';
    typ='.xls';
    fna='AS_10';
    fna1=strcat(path1,fna);
    fname1=strcat(fna1,typ);
    writetable(T1,fname1,'sheet',j)
    clear s1
    clear T1
end