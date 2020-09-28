%read excel sheets
n=str2double(inputdlg('Enter the number of Sheets in Excel'));
for i=1:n
T=readtable('C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\HUZ684128\HUZ6841.xls','sheet',i,'Range','A1:H2');
T1=readtable('C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\HUZ684128\HUZ6841.xls','sheet',i,'Range','A5:D6');
T2=readtable('C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\HUZ684128\HUZ6841.xls','sheet',i,'Range','A10:D11');
s=table2struct(T);
GA(i)=s.Gestational_Age;
cor(i)=s.Correlation;
s1=table2struct(T1);
d_l(i)=s1.P2P_Distance;
a_l(i)=s1.Average_Acceleration;
v_l(i)=s1.Average_Velocity;
j_l(i)=s1.Average_Jerk;
s2=table2struct(T2);
d_r(i)=s2.P2P_Distance;
a_r(i)=s2.Average_Acceleration;
v_r(i)=s2.Average_Velocity;
j_r(i)=s2.Average_Jerk;
end
figure,plot(GA,a_l,'o');
figure,plot(GA,v_l,'*');
figure,plot(GA,d_l,'+')
figure,plot(GA,j_l,'s')
figure,plot(GA,a_r,'o')
figure,plot(GA,v_r,'*')
figure,plot(GA,d_r,'+')
figure,plot(GA,j_r,'s')
figure,plot(GA,cor,'p')
