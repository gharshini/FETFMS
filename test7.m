pos=get(groot,'ScreenSize');
h=figure('Position',pos);
boxplot(x,grp,'color','r')
hold on
boxplot(y,grp1,'color','b')
title('Correlation Plot Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Correlation units')
ylim([-1 1])
set(gca,'XTickLabel',GA);
% saveas(h,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\cor','jpg')
hold off

h1=figure('Position',pos);
boxplot(x1,grp,'color','r')
hold on
boxplot(y1,grp10(1:size(y1,2)),'color','b')
title('Correlation Plot After Normalization');
xlabel('Gestational Age (Weeks)');
ylabel('Correlation unit');
ylim([-1 1])
set(gca,'XTickLabel',GA);
% print(h1,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\cor_curved','-dpng','-r900')
hold off

h2=figure('Position',pos);
boxplot(x2,grp,'color','r')
hold on
boxplot(y2,grp2,'color','b')
title('Lefteye P2P Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 150])
set(gca,'XTickLabel',GA);
% print(h2,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Left_P2P','-dpng','-r900')
hold off

h3=figure('Position',pos);
boxplot(x3,grp,'color','r')
hold on
boxplot(y3,grp3,'color','b')
title('Lefteye Average Speed Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
set(gca,'XTickLabel',GA);
ylim([-2 3])
% print(h3,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Left_Avg_Speed','-dpng','-r900')
hold off

h4=figure('Position',pos);
boxplot(x4,grp,'color','r')
hold on
boxplot(y4,grp4,'color','b')
title('Lefteye Average Acceleration Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 100])
set(gca,'XTickLabel',GA);
% print(h4,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Left_Avg_Accel','-dpng','-r900')
hold off

h5=figure('Position',pos);
boxplot(x5,grp,'color','r')
hold on
boxplot(y5,grp5,'color','b')
title('Lefteye Average Jerk Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 4200])
set(gca,'XTickLabel',GA);
% print(h5,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Left_Avg_Jerk','-dpng','-r900')
hold off

h6=figure('Position',pos);
boxplot(x6,grp,'color','r')
hold on
boxplot(y6,grp6,'color','b')
title('Righteye P2P Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 150])
set(gca,'XTickLabel',GA);
% print(h6,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Right_P2P','-dpng','-r900')
hold off

h7=figure('Position',pos);
boxplot(x7,grp,'color','r')
hold on
boxplot(y7,grp7,'color','b')
title('Righteye Average Speed Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-1 2])
set(gca,'XTickLabel',GA);
% print(h7,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Right_Avg_Speed','-dpng','-r900')
hold off

h8= figure('Position',pos);
boxplot(x8,grp,'color','r')
hold on
boxplot(y8,grp8,'color','b')
title('Righteye Average Acceleration Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 50])
set(gca,'XTickLabel',GA);
% print(h,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Right_Avg_Accel','-dpng','-r900')
hold off

h9=figure('Position',pos);
boxplot(x9,grp,'color','r')
hold on
boxplot(y9,grp9,'color','b')
title('Righteye Average Jerk Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 4200])
set(gca,'XTickLabel',GA);
% print(h9,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Right_Avg_Jerk','-dpng','-r900')
hold off
