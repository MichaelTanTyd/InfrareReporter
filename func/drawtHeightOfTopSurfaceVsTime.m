% function [ ] = drawtHeightOfTopSurfaceVsTime(handle,TS_H_t ,opt )
%   绘制料面坍塌高度在时间t上的温度变化图
%   handle:绘制图形的句柄
%   TS_H_t:料面坍塌高度在时间t上的温度变化数据
%    LRA_H_t最后一列为坍塌的高度数据
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?

disp('drawtHeightOfTopSurfaceVsTime')
% % clc
% % clear
% % close all
% opt = 'r.-';
% TS_H_t(1,:) = [2017, 2, 02, 07, 01,0, 1150] ;% 
% TS_H_t(1,:) = [2017, 2, 02, 07, 02,0, 1100] ;% 
% TS_H_t(2,:) = [2017, 2, 02, 07, 03,0, 1000] ;% 
% TS_H_t(3,:) = [2017, 2, 02, 07, 05,0, 900] ;%
% TS_H_t(4,:) = [2017, 2, 02, 07, 07,0, 850] ;%
% TS_H_t(5,:) = [2017, 2, 02, 07, 08,0, 820] ;%
% TS_H_t(6,:) = [2017, 2, 02, 07, 10,0, 810] ;%
% 
% Linewidth = 5; % 线条的粗细
% Hour = TS_H_t(:,4); 
% Minute = TS_H_t(:,5);  
% interval = datenum(0,0,0,Hour,Minute,0);
% plot(interval,TS_H_t(:,7),opt, 'LineWidth',Linewidth); 
% % x = interval;   
% datetick('x','HH:MM'); %需用x作为数组变量
% xlabel('时间'); ylabel('料位H (mm)');
% set(gca,'ylim',[0 1100],'ytick',0:100:1100);
% title('烧结过程结料坍塌收缩趋势/上表面料位变化过程')

addpath(genpath(pwd))

% load('TemperatureVsTimeData.mat')
[data,T,S] = xlsread('温度.xlsx');
ImageData = data(:,2:end);
% AllLength = 1100;
% ImageData = AllLength-ImageData;

TimeData = data(:,1);
% ImageData = data(:,4:end);
% TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
%% 获取TemperatureVsTimeData
TemperatureVsTime = [Time_Data,ImageData];
TG = TemperatureVsTime;
Linewidth = 3; % 线条的粗细

Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);
% interval = datenum(0,0,0,Hour,Minute,1);
% interval = 1:size(TG,1)
% hight=1
% plot(interval,TG(:,hight),opt, 'LineWidth',Linewidth); 
plot(interval,TG(:,end),'k-', 'LineWidth',Linewidth);  hold on

datetick('x',13)
set(gca,'XTick',interval(1):0.002:interval(end));
xlabel('时间'); ylabel('距离 (mm)');
set(gca,'ylim',[0 1100],'ytick',0:100:1100);
% title('烧结过程烧结料坍塌收缩趋势/上表面料位变化过程')
 title('料位到炉口的距离图')
% end