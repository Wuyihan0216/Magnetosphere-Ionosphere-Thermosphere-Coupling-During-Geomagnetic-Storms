%% ----------JPI & JPT---------
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
xlabel(t,'J_p^I','FontSize',14,'FontName',ftname)

%1——————————————————————————————————2015(R^2=0.4096,R=0.64)
nexttile(1)
ax=nexttile(1) ;

x=JPI_2015;
p_1=plot(JPI_2015,JPT_2015,'.','LineWidth',1,'MarkerSize',sz);

p1=3.175 ;
p2=-3.189;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineWidth',1.5,'color','#D95319');
hold off

ylim([-5 15])
xlim([0 4])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/15,yl(2)- (yl(2)-yl(1))*1/7,['(a) 2015' sprintf('\n') 'cc= 0.64'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);

%2———————————————————————————————————2016(R^2=0.5571,R=0.75)
nexttile(2)
ax=nexttile(2) ;
x=JPI_2016;
p_1=plot(JPI_2016,JPT_2016,'.','LineWidth',1,'MarkerSize',sz);
p1=2.46 ;
p2=-1.964;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');
hold off

ylim([-2 8])
xlim([0 3])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/15,yl(2)- (yl(2)-yl(1))*1/7,['(b) 2016' sprintf('\n') 'cc= 0.75'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);

%3————————————————————————————————————55091(R^2=0.1752,R=0.42)
nexttile(3)
ax=nexttile(3) ;
x=JPI_2017;
p_1=plot(JPI_2017,JPT_2017,'.','LineWidth',1,'MarkerSize',sz);
p1=1.444 ;
p2=-0.7695;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');%'#0072BD'
hold off

ylim([-3 5])
xlim([0 3])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/15,yl(2)- (yl(2)-yl(1))*1/7,['(c) 2017' sprintf('\n') 'cc= 0.42'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);

%4————————————————————————————————————55092(R^2=0.1751,R=0.42)
nexttile(4)
ax=nexttile(4) ;
x=JPI_2018;
p_1=plot(JPI_2018,JPT_2018,'.','LineWidth',1,'MarkerSize',sz);
p1=1.88 ;
p2=-1.213;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');%'#0072BD'
hold off

ylim([-1 4])
xlim([0 2])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/15,yl(2)- (yl(2)-yl(1))*1/7,['(d) 2018' sprintf('\n') 'cc= 0.42'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);

%5————————————————————————————————————55094(R^2=0.4736,R=0.69)
nexttile(5)
ax=nexttile(5) ;
x=JPI_2019;
p_1=plot(JPI_2019,JPT_2019,'.','LineWidth',1,'MarkerSize',sz);
p1=2.178 ;
p2=-1.4;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');
hold off
ylim([-1 2])
xlim([0 2])

xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/15,yl(2)- (yl(2)-yl(1))*1/7,['(e) 2019' sprintf('\n') 'cc= 0.69'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);

%6————————————————————————————————————55095(R^2=0.3949,R=0.63)
nexttile(6)
ax=nexttile(6) ;
x=JPI_all;
p_1=plot(JPI_all,JPT_all,'.','LineWidth',1,'MarkerSize',sz);
p1=2.47 ;
p2=-1.99;
myfunc_w =p1*x + p2;
hold on
p_2= line(x,myfunc_w,'LineStyle','-','LineWidth',1.5,'color','#D95319');
hold off

ylim([-5 15])
xlim([0 4])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/15,yl(2)- (yl(2)-yl(1))*1/7,['(f) all' sprintf('\n') 'cc= 0.63'],'fontsize',12,'color','k')
box on
set(gca,'FontName',ftname,'FontSize',14);