function [ ] = drawtTemperatureRrend(handle,TG ,opt )
%   绘制沿高度方向的温度趋势图
%   handle:绘制图形的句柄
%   TG:沿高度方向的温度梯度数据
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?
%   柱状图的颜色是否需要参数？

disp('沿高度方向的温度梯度图')
% %% 测试数据
% clear
% close all
% clc
% hight = 3;
% opt = 'r.-';
TG(1,:) = [2017, 2, 02, 07, 02, 0, 1500, 1400,1300, 1200, 5, 6, 7, 8, 9] ;% 
TG(2,:) = [2017, 2, 02, 08, 03, 0, 1, 3 ,1300, 4, 5, 6, 7, 8, 9] ;% 
TG(3,:) = [2017, 2, 02, 09, 05, 0, 1, 6 ,1200, 4000, 5, 6, 7, 8, 9] ;%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Linewidth = 5; % 线条的粗细
hight = hight + 6;
Hour = TG(:,4); 
Minute = TG(:,5);  
interval = datenum(0,0,0,Hour,Minute,0);
plot(interval,TG(:,hight),opt, 'LineWidth',Linewidth); 
% x = interval;   
datetick('x','HH:MM'); %需用x作为数组变量
xlabel('时间'); ylabel('温度 (kpa)');
set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('不同高度位置在烧结过程中的温度变化趋势')


end