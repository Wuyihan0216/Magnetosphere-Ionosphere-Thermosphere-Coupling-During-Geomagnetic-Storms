%% --------------delay & Correlation Coefficient------------
clc; clear all;
x0=1:1:9;
y0=[1 0;0 2;7 8;33 17;13 15;4 6;1 5;0 4;0 2];
figure
t = tiledlayout(1,2,'TileSpacing','compact');

%—————————————————————————————————(a)
nexttile(1)
ax=nexttile(1) ;
b=bar(x0,y0,1,'EdgeColor','none');
b(1).FaceColor = 'flat';b(2).FaceColor = 'flat';
for i=1:9
  b(1).CData(i,:) = [0.545 0.451 0.686];
  b(2).CData(i,:) = [0.3255 0.7294 0.4157];
end
xticklabels({'-3','-2', '-1', '0', '1', '2','3','4','5'})
hLegend=legend('J_p^G','J_p^I','','FontSize',12,'Location','northeast','NumColumns',1);

ylabel('Number of Events');
xlabel('Delay (hr)');
set(gca,'FontName','Arial','FontSize',14);
set (gcf,'Position',[100,300,1270,550]);
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/40,yl(2)- (yl(2)-yl(1))*1/11,'(a)' ,'fontsize',14,'color','k')

%—————————————————————————————————(b)
nexttile(2)
ax=nexttile(2) ;
x = 0:1:19;  
y = [4,17,20,12,5,1,0,0,0,0,3,1,1,3,8,6,9,12,11,5]; 
b2=bar(x, y, 0.95,'EdgeColor','none');  
b2.FaceColor = 'flat';
for i=1:6
  b2.CData(i,:) = [0.545 0.451 0.686];
end
for j=11:20
  b2.CData(j,:) = [0.3255 0.7294 0.4157];
end

xlim([-0.5 19.5]);  
xticks([-0.5 0.5 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5]);
xticklabels({'-1' '' '' '' '' '-0.5' '' '' '' '' '0' '' '' '' '' '0.5' '' '' '' '' '1'});
xtickangle(0); 

xlabel('Correlation Coefficient');
ylabel('Number of Events');
set(gca,'FontName','Arial','FontSize',14);
set (gcf,'Position',[100,300,1270,550])
xl = get(gca,'XLim');
yl = get(gca,'YLim');
text(xl(1)+(xl(2)-xl(1))/40,yl(2)- (yl(2)-yl(1))*1/11,'(b)' ,'fontsize',14,'color','k')