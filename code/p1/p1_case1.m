%%  F107、Vp、Bz、Dst（JPG）、JrI（JpI）、JrT（JpT）
clc; clear all;
data_dir = pwd;
fname     = 'Case1.mat';
fullname  = [data_dir,'\' fname];
load(fullname);

lat=[-87.5:2.5:87.5];
x=[1:1:120];
fig = figure;
fig.Position = [100, 50, 800, 1000];
% set
ft     = 10;
ftname = 'Arial';
lw = 1.6;

h1=subplot(911);%----------------------1 F107
plot(F107_case1,'color','k','LineWidth',0.5)
xticks(1:24:120);xticklabels('');xlim([1 120])
ylim([80 100])
ylabel('F10.7','FontSize',ft);

h2=subplot(912);%----------------------2 Vp
plot(Vp_case1,'color','k','LineWidth',0.5)
xticks(1:24:120);xticklabels('');xlim([1 120])
ylabel('v_p(km·s^{-1})','FontSize',ft)

h3=subplot(913);%----------------------3 Bz
plot(Bz_case1,'color','k','LineWidth',0.5)
hold on
plot(x,0*x,'LineStyle','--','LineWidth',1,'Color','k');  
hold off
xticks(1:24:120);xticklabels('');xlim([1 120])
ylabel('Bz(nT)','FontSize',ft)

h4=subplot(914);%----------------------4 AE
plot(AE_case1,'color','k','LineWidth',0.5)
xticks(1:24:120);xticklabels('');xlim([1 120])
ylabel('AE(nT)','FontSize',ft)

h5=subplot(915);%----------------------5 Dst（JPG）
xlim([1 120])
hold on
plot(Dst_case1,'color','k','LineWidth',0.5)
hold off
ylabel('Dst(nT)','FontSize',ft)
x_values = 1:size(Dst_case1, 1); 
y_values_right = JPG_case1; 
yyaxis right;
plot(x_values, y_values_right,'color', 'm', 'LineWidth', 1.0); 
ylabel('J_p^G','FontSize',ft);
ax = gca; 
ax.YAxis(2).Color = 'm'; 
yyaxis left;
box on;
xticks(1:24:120);xticklabels('')

h6=subplot(916);%----------------------6 JrI（JpI）
lat=[87.5:-2.5:-87.5];
[lon00,lat00]=meshgrid(x,lat);
set(gcf,'color','white');
pcolor(lon00,lat00,JRI_tec_case1);
yticks([-87.5,-45,0,45,87.5])
yticklabels([-87.5,-45,0,45,87.5])
ylabel('Lat(°)','FontSize',ft);
colorbar;%('Location', 'southoutside');
ylabel(colorbar, 'J_s^I','FontSize',ft); 
caxis([0,4]);  
cmap = jet(256); 
n = 256; 
new_cmap = cmap; 
upper_idx = round((1 / 4) * (n - 1)) + 1; 
lower_idx = 1; 
new_cmap(lower_idx:upper_idx, :) = repmat([1 1 1], upper_idx - lower_idx + 1, 1);
colormap(gca,new_cmap);
shading interp
x_values = 1:size(JRI_tec_case1, 2); 
y_values_right = JPI_tec_case1;
yyaxis right;
plot(x_values, y_values_right, 'm', 'LineWidth', 1.2);
ylabel('J_p^I','FontSize',ft);
ax = gca; 
ax.YAxis(2).Color = 'm'; 
yyaxis left;
xticks(1:24:120);xticklabels('');

h7=subplot(917);%----------------------7 JPT-day
smooth3_density = smoothdata(day_2D_case1,1, 'movmedian',3,'omitnan');  
lat=[88:-2:-88];
[lon00,lat00]=meshgrid(x,lat);
set(gcf,'color','white');
pcolor(lon00,lat00,smooth3_density);

yticks([-88,-45,0,45,88])
yticklabels([-88,-45,0,45,88])
ylabel('Lat(°) (day)','FontSize',ft);
colorbar%('Location', 'southoutside');
ylabel(colorbar, 'J_s^T (day)','FontSize',ft); 
caxis([-1,8]);                            
cmap = jet(256); 
n = 256; 
new_cmap = cmap; 
lower_bound = -1;  
upper_bound = 1;
lower_idx = round((lower_bound + 1) / 9 * (n - 1)) + 1; 
upper_idx = round((upper_bound + 1) / 9 * (n - 1)) + 1;
new_cmap(lower_idx:upper_idx, :) = repmat([1 1 1], upper_idx - lower_idx + 1, 1);
colormap(gca,new_cmap);   
shading interp;
x_values = 1:size(day_1D_case1, 1); 
y_values_right = day_1D_case1; 
yyaxis right;
plot(x_values, y_values_right, 'm', 'LineWidth', 1.2); 
ylabel('J_p^T(day)','FontSize',ft);
ax = gca; 
ax.YAxis(2).Color = 'm'; 
yyaxis left;
xticks(1:24:120);xticklabels('');

h8=subplot(918);%----------------------8 JPT-night
smooth3_density = smoothdata(night_2D_case1,1, 'movmedian',3,'omitnan');  
lat=[88:-2:-88];
[lon00,lat00]=meshgrid(x,lat);
set(gcf,'color','white');
pcolor(lon00,lat00,smooth3_density);
yticklabels([-88,-45,0,45,88])
ylabel('Lat(°) (night)','FontSize',ft);
cmap = jet(256); 
n = 256; 
new_cmap = cmap; 
caxis([-1,8]);
lower_bound = -1;
upper_bound = 1;
lower_idx = round((lower_bound + 1) / 9 * (n - 1)) + 1; 
upper_idx = round((upper_bound + 1) / 9 * (n - 1)) + 1;
new_cmap(lower_idx:upper_idx, :) = repmat([1 1 1], upper_idx - lower_idx + 1, 1);
colormap(gca,new_cmap);
shading interp;
colorbar%('Location', 'southoutside');
ylabel(colorbar, 'J_s^T (night)','FontSize',ft); 
x_values = 1:size(night_1D_case1, 1); 
y_values_right = night_1D_case1; 
yyaxis right;
plot(x_values, y_values_right, 'm', 'LineWidth', 1.2); 
ylabel('J_p^T(night)','FontSize',ft);
ax = gca; 
ax.YAxis(2).Color = 'm'; 
yyaxis left;
xticks(1:24:120);xticklabels('');

h9=subplot(919);%----------------------9 JrT（JpT）
smooth3_density = smoothdata(day_night_2D,1, 'movmedian',5,'omitnan');  
lat=[88:-2:-88];
[lon00,lat00]=meshgrid(x,lat);
set(gcf,'color','white');
pcolor(lon00,lat00,day_night_2D);
shading interp;%flat  interp
yticks([-88,-45,0,45,88])
yticklabels([-88,-45,0,45,88])
ylabel('Lat(°)','FontSize',ft);
colorbar%('Location', 'southoutside');
ylabel(colorbar, 'J_s^T','FontSize',ft); 
caxis([-1,8]);
cmap = jet(256); 
n = 256; 
new_cmap = cmap; 
lower_bound = -1;
upper_bound = 1;
lower_idx = round((lower_bound + 1) / 9 * (n - 1)) + 1; 
upper_idx = round((upper_bound + 1) / 9 * (n - 1)) + 1;
new_cmap(lower_idx:upper_idx, :) = repmat([1 1 1], upper_idx - lower_idx + 1, 1);
colormap(gca,new_cmap);
shading interp;
x_values = 1:size(day_night_1D.', 1); 
y_values_right = day_night_1D; 
yyaxis right;
plot(x_values, y_values_right, 'm', 'LineWidth', 1.2); 
ylabel('J_p^T','FontSize',ft);
ax = gca; 
ax.YAxis(2).Color = 'm'; 
yyaxis left;
xticks(1:24:120); 
xticklabels({'127', '128', '129', '130','131',''}); 
xlabel('Day of 2016','FontSize',12);

set(h1, 'Position', [0.1, 0.900, 0.75, 0.075]);  % 1
set(h2, 'Position', [0.1, 0.800, 0.75, 0.075]); % 2
set(h3, 'Position', [0.1, 0.700, 0.75, 0.075]);  % 3
set(h4, 'Position', [0.1, 0.600, 0.75, 0.075]); % 4
set(h5, 'Position', [0.1, 0.500, 0.75, 0.075]);  % 5
set(h6, 'Position', [0.1, 0.400, 0.75, 0.075]); % 6
set(h7, 'Position', [0.1, 0.300, 0.75, 0.075]);  % 7
set(h8, 'Position', [0.1, 0.200, 0.75, 0.075]); % 8
set(h9, 'Position', [0.1, 0.100, 0.75, 0.075]);  % 9
