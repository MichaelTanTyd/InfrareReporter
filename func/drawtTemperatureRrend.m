% function [ ] = drawtTemperatureRrend(handle,TG,opt )
%   绘制沿高度方向的温度趋势图
%   handle:绘制图形的句柄
%   TG:沿高度方向的温度梯度数据
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?
%   柱状图的颜色是否需要参数？

disp('沿高度方向的温度趋势图')

%% 需要重新设计画图逻辑 
% %% 测试数据
clear
close all
clc
% hight = 3;
% opt = 'r.-';
TG_Time(1,:) = [2017, 2, 02, 07, 02, 0 ]; % 时间信息
TG_Time(end+1,:) = [2017, 2, 02, 07, 04, 0] ;
TG_Time(end+1,:) = [2017, 2, 02, 07, 06, 0] ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TG_GradientData(1,:) = [800 100 100 100 100 100 100 100 100 0 100 100 100 100 100 100 ]; % 有16组数据，数据没有的补0，总的高度为sum(TG_GradientData)
TG_GradientData(end+1,:) = [700 100 100 100 100 100 100 100 100 100 100 80 70 60 50 20 ]; % % 有16组数据，数据没有的补0，总的高度为sum(TG_GradientData)
TG_GradientData(end+1,:) = [600 100 100 100 100 100 80 30 30 20 10 10 10 10 10 0 ]; % % 有16组数据，数据没有的补0，总的高度为sum(TG_GradientData)

TG = [TG_Time TG_GradientData];


% return
BarData = TG(:,7:end);

Hour = TG(:,4); 
Minute = TG(:,5);  
interval = datenum(0,0,0,Hour,Minute,0);
bar(interval,TG(:,7:end));
m = bar(BarData,'stacked');
% m = area(BarData);
set(m, 'linestyle','none')

load('map.txt')
colormap(map)
colorbar

h = colorbar;
set(h ,'YTick',[0 100 1600]);
t = get(h,'YTickLabel');
load('legend.mat')

set(h,'YTickLabel',t);

% myC= [0 0 1
%   1 0 0
%   1 0.4 0
%   0 0.8 1
%   0.6 0 1
%   0 1 0 ];
% data2D = rand(10,6);
% H=bar(data2D, 'stack');
% for k=1:6
%   set(H(k),'facecolor',myC(k,:))
% end
% t2={'>=1500°C';'1400~1499°C '; '1300~1399°C '; '1200~1299°C '; '1100~1199°C '; '1000~1099°C '; '900~999°C '; '800~899°C '; '700~799°C '; '600~699°C '; '500~599°C '; '400~499°C '; '300~399°C '; '200~299°C '; '100~199°C '; '<=99°C '}
% 数据反了，需要处理下

% AX=legend(h,t2, 'Location','Best','FontSize',8);
% AX=legend( t2);
% return
interval = datenum(0,0,0,Hour,Minute,0);
x = interval;   
% datetick('x','HH:MM'); %需用x作为数组变量
 datetick('x',13); %需用x作为数组变量
xlabel('时间'); ylabel('温度 (kpa)');
set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('不同高度位置在烧结过程中的温度变化趋势')


% end