% function [ ] = drawTemperatureVsTime(handle)
%   绘制指定高度序列在时间t上的温度数值
%   handle:绘制图形的句柄
%   TG:输入数据，第一列为时间t,第二列为height(1)所对应高度的温度-时间数据，以此类推
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?

% disp('drawTemperatureVsTime')
%% 测试数据
% clear
% close all
% clc
% TG的前6位分别是：年，月，日，分，秒，毫秒。
% TG的第7位开始是某一点的信息，共7,8,9,10,11
% TG(1,:) = [2017, 2, 02, 07, 02, 0, 1, 2,1500, 4, 5, 6, 7, 8, 9] ;% 
% TG(2,:) = [2017, 2, 02, 08, 03, 1, 1, 3 ,1300, 4, 5, 6, 7, 8, 9] ;% 
% TG(3,:) = [2017, 2, 02, 09, 05, 2, 3, 6 ,1200, 4000, 5, 6, 7, 8, 9] ;%
% TG(4,:) = [2017, 2, 02, 10, 05, 3, 4, 6 ,1200, 4000, 5, 6, 7, 8, 9] ;%
% TG(5,:) = [2017, 2, 02, 11, 05, 4, 5, 6 ,1200, 4000, 5, 6, 7, 8, 9] ;%
% TG(6,:) = [2017, 2, 02, 12, 05, 5, 1, 6 ,1200, 4000, 5, 6, 7, 8, 9] ;%
%% 作图程序
addpath(genpath(pwd))
% load('TemperatureVsTimeData.mat')
[data,T,S] = xlsread('温度.xlsx');
ImageData = data(:,2:end);
TimeData = data(:,1);

% ImageData = data(:,4:end);
% TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
%% 获取TemperatureVsTimeData
TemperatureVsTime = [Time_Data,ImageData];


% ImageData2 = ImageData;

TG = TemperatureVsTime;
% TG = TG(1:2:end,:);
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
plot(interval,TG(:,hight+7),'Color',[0.4 0.3 0.5], 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+8),'Color',[0.1 0.5 0.6], 'LineWidth',Linewidth); hold on

legend('H=100cm','H=90cm','H=80cm','H=70cm','H=60cm','H=50cm','H=40cm','H=30cm','H=20cm','H=10cm')
% legend('H=10cm','H=20cm','H=30cm','H=40cm','H=50cm','H=60cm','H=70cm','H=80cm','H=90cm','H=100cm')
% x = interval;   
% datetick('x','HH:MM:SS'); %需用x作为数组变量
datetick('x',13)
set(gca,'XTick',interval(1):0.002:interval(end));
xlabel('时间'); ylabel('温度 (kpa)');
set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('观测窗不同高度位置在烧结过程中的温度变化趋势')
% end