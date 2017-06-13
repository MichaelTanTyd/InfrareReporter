function [ ] = drawtHeightOfLRAVsTime(handle,LRA_H_t,opt )
%   绘制赤红带高度在时间t上的变化图
%   handle:绘制图形的句柄
%   LRA_H_t:赤红带高度-时间数据
%   LRA_H_t最后一列为赤红带的高度位置，需要转化为mm的单位，pixelToHeight函数实现
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?

disp('drawtHeightOfLRAVsTime')
disp 需要增加pixelToHeight函数
%% 测试数据
% clc
% clear
% close all
opt = 'r.-';
LRA_H_t(1,:) = [2017, 2, 02, 07, 01,0, 1150] ;% 
LRA_H_t(1,:) = [2017, 2, 02, 07, 02,0, 1100] ;% 
LRA_H_t(2,:) = [2017, 2, 02, 07, 03,0, 1000] ;% 
LRA_H_t(3,:) = [2017, 2, 02, 07, 05,0, 800] ;%
LRA_H_t(4,:) = [2017, 2, 02, 07, 07,0, 700] ;%
LRA_H_t(5,:) = [2017, 2, 02, 07, 08,0, 600] ;%
LRA_H_t(6,:) = [2017, 2, 02, 07, 10,0, 500] ;%
%% 实现主代码
Linewidth = 3; % 线条的粗细
Hour = LRA_H_t(:,4); 
Minute = LRA_H_t(:,5);  
interval = datenum(0,0,0,Hour,Minute,0);
plot(interval,LRA_H_t(:,end),opt, 'LineWidth',Linewidth); 
% x = interval;   
datetick('x','HH:MM'); %需用x作为数组变量
xlabel('时间'); ylabel('料位H (mm)');
set(gca,'ylim',[0 1100],'ytick',0:100:1100);
title('烧结料燃烧层迁移趋势')
end
