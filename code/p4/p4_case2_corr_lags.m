%%
clc; clear all;
data_dir = pwd;
fname     = 'Case2_corr_lags.mat';
fullname  = [data_dir,'\' fname];
load(fullname);

fig = figure;
fig.Position = [400, 200, 850, 700];
t = tiledlayout(2,2,'TileSpacing','tight');

%—————————————————————————————————(a)
nexttile(1)
ax=nexttile(1) ;
 sz=28;
stem(JPG_lags, JPG_correlations,'filled','LineWidth',1,'LineStyle','--','Color','#0072BD');
xlim([-10 10])
ylim([-1 1])
xlabel('Delay (hours)');
ylabel('Correlation');
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/20,yl(1)*1/9+yl(2)*13/14,'(a)','fontsize',14,'color','k')
set(gca,'FontName','Arial','FontSize',12);
%set (gcf,'Position',[100,300,1270,550])

%—————————————————————————————————(b)
nexttile(2)
ax=nexttile(2) ;
hold on
p_1=scatter(shift_JPG,day_night_1D,sz,'filled');
hold off
hold on
x1=shift_JPG;
p1=-1.014 ;      
p2=0.4757;    
myfunc_1 =p1*x1 + p2;
p_3= line(x1,myfunc_1,'Color','k','LineStyle','-','LineWidth',1.5);
hold off
ylabel('J_p^T');
xlabel('Shifted J_p^T');
xlim([-3 3])
ylim([-2 4])
xticks([-5:1:5])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/20,yl(1)*1/9+yl(2)*13/14,'(b)','fontsize',14,'color','k')
set(gca,'FontName','Arial','FontSize',12);
set(gca, 'YAxisLocation', 'right');
box on;

%—————————————————————————————————(c)
nexttile(3)
ax=nexttile(3) ;
stem(JPI_lags, JPI_correlations,'filled','LineWidth',1,'LineStyle','--','Color','#D95319');
xlim([-10 10])
ylim([-1 1])
%title('J_p^I');
xlabel('Delay (hours)');
ylabel('Correlation');
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/20,yl(1)*1/9+yl(2)*13/14,'(c)','fontsize',14,'color','k')
set(gca,'FontName','Arial','FontSize',12);

%—————————————————————————————————(d)
nexttile(4)
ax=nexttile(4) ;
hold on
p_1=scatter(shift_JPI,day_night_1D,sz,'filled','MarkerFaceColor','#D95319');
hold off
hold on
x2=shift_JPI;
p3=3.465;         
p4=-3.311;        
myfunc_2 =p3*x2 + p4;
p_3= line(x2,myfunc_2,'Color','k','LineStyle','-','LineWidth',1.5);
hold off
ylabel('J_p^T');
xlabel('Shifted J_p^I');
xlim([0.5 2])
ylim([-2 4])
box on;
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/20,yl(1)*1/9+yl(2)*13/14,'(d)','fontsize',14,'color','k')
set(gca,'FontName','Arial','FontSize',12);
set(gca, 'YAxisLocation', 'right');