function [ ] = drawTemperatureVsTime(handle)
%   绘制指定高度序列在时间t上的温度数值
%   handle:绘制图形的句柄
%   TG:输入数据，第一列为时间t,第二列为height(1)所对应高度的温度-时间数据，以此类推
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?



% addpath(genpath(pwd))
FileName = 'ProceedData';
% load([FileName,'\TempretureVsTimeData.mat']);
load([FileName,'\TemperatureVsTimeData.mat']);

TG = TemperatureVsTimeData;
Linewidth = 3; % 线条的粗细
hight = 7;
Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);

plot(interval,TG(:,hight),'k-', 'LineWidth',Linewidth);  hold on
plot(interval,TG(:,hight+1),'g-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+2),'b-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+3),'r-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+4),'y-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+5),'m-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+6),'Color',[0.4 0.5 0.6], 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+7),'Color',[0.4 0.3 0.5], 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+8),'Color',[0.1 0.5 0.6], 'LineWidth',Linewidth); hold on

legend('100cm','90cm','80cm','70cm','60cm','50cm','40cm','30cm','20cm')


datetick('x',13)
% interNum = (interval(end)-interval(1))/10;
OneMiniut = 1.1574*10^(-5); 
interNum = 5*60*OneMiniut;
set(gca,'XTick',interval(1):interNum:interval(end));
xlabel('时间'); ylabel('温度 (℃)');
set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title( '观测窗不同高度位置在烧结过程中的温度变化趋势')
set(gca,'FontSize',13);
scrsz = get(0,'ScreenSize');  % 是为了获得屏幕大小，Screensize是一个4元素向量[left,bottom, width, height]
set(gcf,'Position',scrsz);    % 用获得的screensize向量设置figure的position属性，实现最大化的目的
