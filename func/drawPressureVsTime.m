function [ ] = drawPressureVsTime(handle,Pre_H_t ,hight,opt )
%   绘制指定高度序列在时间t上的压力数值
%   handle:绘制图形的句柄
%   Pre_H_t:输入数据，第一列为时间t,第二列为height(1)所对应高度的压力-时间数据，以此类推
%   时间需要7位，包括：年 月 日 小时 分钟 秒 毫秒 后面紧接着高度信息 从上到下 第一个高度100cm处压力
%   90cm处压力 80cm处压力 70cm处压力 --- 10cm处压力
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn? 
%   Pre_H_t为cell模式，第一列为时间，第二列为压力数据，压力数据依次为1-10处的数据

disp('drawPressureVsTime')

% 测试数据
% clear
% close all
% clc
hight = 2;
opt = 'r.-';
Pre_H_t(1,:) = [2017, 2, 02, 07, 02, 0, 1, 2,3, 4, 5, 6, 7, 8, 9] ;% 
Pre_H_t(2,:) = [2017, 2, 02, 08, 03, 0, 1, 3 ,3, 4, 5, 6, 7, 8, 9] ;% 
Pre_H_t(3,:) = [2017, 2, 02, 09, 05, 0, 1, 6 ,3, 4, 5, 6, 7, 8, 9] ;%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Linewidth = 5; % 线条的粗细
hight = hight + 6;
Hour = Pre_H_t(:,4); 
Minute = Pre_H_t(:,5);  
interval = datenum(0,0,0,Hour,Minute,0);
plot(interval,Pre_H_t(:,hight),opt, 'LineWidth',Linewidth); 
x = interval;   
datetick('x','HH:MM'); %需用x作为数组变量
xlabel('时间'); ylabel('压力 (kpa)');
set(gca,'ylim',[0 30],'ytick',0:2:30);
title('烧结炉不同高度位置的炉膛内负压在烧结过程的波动')
disp 需要显示负压数据
end