%
%Subjective Comparison
[fname path]=uigetfile('C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\*.*','Select The Excel file');
n=str2double(inputdlg('Enter the number of Sheets in Excel'))
fname=strcat(path,fname);
num=zeros(300,300,n);
final_theta_l=zeros(300,300,n);
final_theta_r=zeros(300,300,n);
for i=1:n
    o=xlsread(fname,i);
    o1=o(15:size(o,1),10)';
    o2=o(15:size(o,1),11)';
    final_theta_l(1:size(o1,1),1:size(o1,2),i)=o1;
    final_theta_r(1:size(o2,1),1:size(o2,2),i)=o2;
end
[fname1 path1]=uigetfile('C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\*.*','Select The Excel file');
n1=str2double(inputdlg('Enter the number of Sheets in Excel'))
fname1=strcat(path1,fname1);
num1=zeros(300,300,n);
final_theta_l1=zeros(300,300,n);
final_theta_r1=zeros(300,300,n);
for i=1:n1
    o1=xlsread(fname,i);
    o11=o1(15:size(o1,1),10)';
    o21=o1(15:size(o1,1),11)';
    final_theta_l1(1:size(o11,1),1:size(o11,2),i)=o11;
    final_theta_r1(1:size(o21,1),1:size(o21,2),i)=o21;
end
comp_l=final_theta_l-final_theta_l1;
comp_r=final_theta_r-final_theta_r1;