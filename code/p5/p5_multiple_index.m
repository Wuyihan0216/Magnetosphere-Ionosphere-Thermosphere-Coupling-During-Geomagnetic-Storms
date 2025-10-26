%%  ---------------Plotting Multiple J-Index Points per Quarter--------
% 1. Data Preparation
clc; clear all;
% G2,G3,G4 
quarterly_incidents=[3,1,1; 5,0,1; 7,1,0; 4,1,1; 2,2,0; 6,0,0; 5,0,0; 3,1,0; 2,0,0; 4,1,0; 2,2,0; 2,0,0; 0,0,0; 2,0,0; 1,0,1; 2,0,0; 0,0,0; 2,0,0; 3,0,0;0,0,0];
num_quarters = 20;

% --- Sunspot ---
data_dir = pwd;
fname     = 'Sunspot&F10.7.csv';
fullname  = [data_dir,'\' fname];
table_data=readtable(fullname);
Sunspot=table_data.Sunspot;
time=table_data.Date;
startDate = datetime(2015, 1, 1);
endDate = datetime(2019, 12, 31, 23, 59, 59);
filteredData = table_data(time >= startDate & time <= endDate, :);
monthlyAvgSunspot = groupsummary(filteredData, 'Date','month', 'mean', 'Sunspot');
avgSunspot = monthlyAvgSunspot.mean_Sunspot;
quarterly_avg_Sunspot = zeros(num_quarters, 1);
for q = 1:num_quarters
    start_month = (q - 1) * 3 + 1;
    end_month = q * 3;
    quarterly_avg_Sunspot(q) = mean(avgSunspot(start_month:end_month));
end

fname1     = 'JPT.xlsx';
fname2     = 'JPG.xlsx';
fname3     = 'JPI.xlsx';

fullname1  = [data_dir,'\J-index\' fname1];
fullname2  = [data_dir,'\J-index\' fname2];
fullname3  = [data_dir,'\J-index\' fname3];

all_jpt_data = readmatrix(fullname1);
all_jpg_data = readmatrix(fullname2);
all_jpi_data = readmatrix(fullname3);

% 2. plot

fig = figure;
fig.Position = [100, 50, 850, 550];

% -- Create the first axes (ax1) for bars and SSN line --
ax1 = gca;
yyaxis(ax1, 'left');
b = bar(1:num_quarters, quarterly_incidents, 0.6, 'stacked');
ylabel('Quarterly Storms');
ax1.YColor = 'k';
hold(ax1, 'on');
b(1).FaceColor = [0, 0.4470, 0.7410];
b(2).FaceColor = [0.8500, 0.3250, 0.0980];
b(3).FaceColor = [0.9290, 0.6940, 0.1250];

yyaxis(ax1, 'right');
p_ssn = plot(1:num_quarters, quarterly_avg_Sunspot, 'color', [0.6, 0.1686, 0.2], 'LineWidth', 2);
ylabel('Quarterly-averaged SSN');
ax1.YAxis(2).Color = [0.6, 0.1686, 0.2];

ax1_pos = ax1.Position;

% -- Create the second, overlaid axes (ax2) for the new indices --
ax2 = axes('Position', ax1_pos, 'YAxisLocation', 'right', 'Color', 'none');
hold(ax2, 'on');

jitter_width = 0.4; 
bar_width = 0.6;    
s_jpt = []; s_jpg = []; s_jpi = []; 

for q = 1:num_quarters
    data_jpt = all_jpt_data(q, ~isnan(all_jpt_data(q,:)));
    jitter_jpt = (rand(size(data_jpt)) - 0.5) * jitter_width - bar_width/6; 
    h_jpt = scatter(ax2, q + jitter_jpt, data_jpt, 30, 'd', 'filled', 'MarkerFaceColor', 'm');
    
    data_jpg = all_jpg_data(q, ~isnan(all_jpg_data(q,:)));
    jitter_jpg = (rand(size(data_jpg)) - 0.5) * jitter_width; 
    h_jpg = scatter(ax2, q + jitter_jpg, data_jpg, 30, 's', 'filled', 'MarkerFaceColor', 'g');
    
    data_jpi = all_jpi_data(q, ~isnan(all_jpi_data(q,:)));
    jitter_jpi = (rand(size(data_jpi)) - 0.5) * jitter_width + bar_width/6; 
    h_jpi = scatter(ax2, q + jitter_jpi, data_jpi, 30, '^', 'filled', 'MarkerFaceColor', 'c');
    
    if q == 1
        s_jpt = h_jpt;
        s_jpg = h_jpg;
        s_jpi = h_jpi;
    end
end
hold(ax2, 'off');

linkaxes([ax1, ax2], 'x');
set(ax1, 'FontSize', 12);
xlim(ax1, [0.5, num_quarters + 0.75]);
xticks(ax1, 2.5:4:num_quarters);
xticklabels(ax1, {'2015', '2016', '2017', '2018', '2019'});
xlabel(ax1, 'Year');


% shrink ax1 & ax2 
shrink_amount = 0.09; 
ax1.Position(3) = ax1_pos(3) - shrink_amount;
ax2.Position(3) = ax1_pos(3) - shrink_amount;

% creat ax3
ax3 = axes('Position', [ax1.Position(1) + ax1.Position(3) + 0.08, ...
                       ax1.Position(2), ...
                       0.01, ...
                       ax1.Position(4)]);
                   
% copy
ax3.YLim = ax2.YLim;           
ax3.YTick = ax2.YTick;         
ax3.YTickLabel = ax2.YTickLabel; 

% set ax3
ax3.YAxisLocation = 'right';
ax3.Color = 'none';
ax3.XAxis.Visible = 'off';
ax3.Box = 'off';
ax3.YColor = [0 0.4470 0.7410]; % 设置 ax3 的颜色
ylabel(ax3, 'J-Indices');
set(ax3, 'FontSize', 12);

% 5. hide ax2  Y-axis
ax2.YAxis.Visible = 'off';
ax2.XAxis.Visible = 'off'; 

legend([b, p_ssn, s_jpt, s_jpg, s_jpi], ...
       {'G2', 'G3', 'G4', 'SSN', 'J_p^T', 'J_p^G', 'J_p^I'}, ...
       'Location', 'northeast', 'FontSize', 11, 'AutoUpdate', 'off');

sgtitle('Quarterly Storm Counts, SSN, and J-Indices (2015-2019)', 'FontSize', 14);