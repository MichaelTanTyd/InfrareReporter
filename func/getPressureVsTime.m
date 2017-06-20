function [ Pre_H_t ] = getPressureVsTime( allData ,height )
%   从数据中得到指定高度序列height在时间t上的压力数值
%   allData:时间同步后的全部数据源
%   height:高度序列，可以为向量，表示需要返回多层高度的压力-时间数据
%   Pre_H_t:返回数据，第一列为时间t,第二列为height(1)所对应高度的压力-时间数据，以此类推
%   可以根据需要添加输入，输出参数

addpath(genpath(pwd))
% load('TemperatureVsTimeData.mat')
[data,T,S] = xlsread('压差.xlsx');
ImageData = data(:,2:end);
TimeData = data(:,1);

% ImageData = data(:,4:end);
% TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
%% 获取TemperatureVsTimeData
PressureVsTime = [Time_Data,ImageData];

TG = PressureVsTime;
TG = TG(1:2:end,:);
TempStart = 5;
Linewidth = 3; % 线条的粗细
hight = 7;
Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);
% interval = datenum(0,0,0,Hour,Minute,1);
% interval = 1:size(TG,1)
% hight=1
% plot(interval,TG(:,hight),opt, 'LineWidth',Linewidth); 
plot(interval,TG(:,hight),'k-', 'LineWidth',Linewidth);  hold on
plot(interval,TG(:,hight+1),'g-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+2),'b-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+3),'r-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+4),'y-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+5),'m-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+6),'Color',[0.4 0.5 0.6], 'LineWidth',Linewidth); hold on


legend('H=100cm','H=90cm','H=80cm','H=70cm','H=60cm','H=50cm','H=40cm','H=30cm','H=20cm','H=10cm')
datetick('x',13)
set(gca,'XTick',interval(1):0.002:interval(end));
xlabel('时间'); ylabel('压力 (kpa)');
% set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('观测窗不同高度位置在烧结过程中的压力变化趋势')

end