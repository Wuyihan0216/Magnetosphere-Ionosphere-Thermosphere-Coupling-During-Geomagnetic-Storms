%% ----------JPG & JPT---------
clc; clear all;
data_dir = pwd;
fname     = 'J_index.mat';
fullname  = [data_dir,'\' fname];
load(fullname);

sz=8;
fig = figure;
fig.Position = [100, 50, 850, 500];

% set
ft     = 18;
ftname = 'Arial';
lw = 1.6;
t = tiledlayout(2,3,'TileSpacing','compact');
ylabel(t,'J_p^T','FontSize',14,'FontName',ftname)
xlabel(t,'J_p^G','FontSize',14,'FontName',ftname)

%1——————————————————————————————————2015(R^2=0.5089,R=0.71)
nexttile(1)
ax=nexttile(1) ;

x=JPG_2015;
p_1=plot(JPG_2015,JPT_2015,'.','LineWidth',1,'MarkerSize',sz);

p1=-1.349 ;
p2=0.6124;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineWidth',1.5,'color','#D95319');
hold off

ylim([-5 15])
xlim([-6 5])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/1.6,yl(2)- (yl(2)-yl(1))*1/7,['(a) 2015' sprintf('\n') 'cc=-0.71'],'fontsize',12,'color','k')
xticks([-6 -4 -2 0 2 4])
box on
set(gca,'FontName',ftname,'FontSize',14);

%2———————————————————————————————————2016(R^2=0.5196,R=0.72)
nexttile(2)
ax=nexttile(2) ;
x=JPG_2016;
p_1=plot(JPG_2016,JPT_2016,'.','LineWidth',1,'MarkerSize',sz);
p1=-0.9212 ;
p2=0.3409;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');
hold off

ylim([-2 7])
xlim([-4 3])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/1.6,yl(2)- (yl(2)-yl(1))*1/7,['(b) 2016' sprintf('\n') 'cc=-0.72'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);

%3————————————————————————————————————55091(R^2=0.5787,R=0.76)
nexttile(3)
ax=nexttile(3) ;
x=JPG_2017;
p_1=plot(JPG_2017,JPT_2017,'.','LineWidth',1,'MarkerSize',sz);
p1=-0.7228 ;
p2=0.4374;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');%'#0072BD'
hold off

ylim([-3 5])
xlim([-6 4])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/1.6,yl(2)- (yl(2)-yl(1))*1/7,['(c) 2017' sprintf('\n') 'cc=-0.76'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);

%4————————————————————————————————————55092(R^2=0.579,R=0.76)
nexttile(4)
ax=nexttile(4) ;
x=JPG_2018;
p_1=plot(JPG_2018,JPT_2018,'.','LineWidth',1,'MarkerSize',sz);
p1=-0.5369 ;
p2=0.09026;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');%'#0072BD'
hold off

ylim([-2 4])
xlim([-6 3])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/1.6,yl(2)- (yl(2)-yl(1))*1/7,['(d) 2018' sprintf('\n') 'cc=-0.76'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);

%5————————————————————————————————————55094(R^2=0.5346,R=0.73)
nexttile(5)
ax=nexttile(5) ;
x=JPG_2019;
p_1=plot(JPG_2019,JPT_2019,'.','LineWidth',1,'MarkerSize',sz);
p1=-0.4554 ;
p2=0.05982;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');
hold off

ylim([-1 2])
xlim([-3 2])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/1.6,yl(2)- (yl(2)-yl(1))*1/7,['(e) 2019' sprintf('\n') 'cc=-0.73'],'fontsize',12,'color','k')
xticks([-3 -2 -1 0 1 2])
box on
set(gca,'FontName',ftname,'FontSize',14);

%6————————————————————————————————————55095(R^2=0.4584,R=0.68)
nexttile(6)
ax=nexttile(6) ;
x=JPG_all;
p_1=plot(JPG_all,JPT_all,'.','LineWidth',1,'MarkerSize',sz);
p1=-1.033 ;
p2=0.4229;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');
hold off

ylim([-5 15])
xlim([-6 5])
xticks([-6 -4 -2 0 2 4])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/1.6,yl(2)- (yl(2)-yl(1))*1/7,['(f) all' sprintf('\n') 'cc= 0.68'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);