% function [ ] = drawtTemperatureGradient(handle,TG ,opt )
%   绘制沿高度方向的温度梯度图
%   handle:绘制图形的句柄
%   TG:沿高度方向的温度梯度数据
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?
%   柱状图的颜色是否需要参数？

disp('沿高度方向的温度梯度图')
%% 测试数据
clear
close all
clc
% hight = 3;
% opt = 'r.-';
% TG_Time(1,:) = [2017, 2, 02, 07, 02, 0 ]; % 时间信息
% TG_Time(end+1,:) = [2017, 2, 02, 07, 04, 0] ;
% TG_Time(end+1,:) = [2017, 2, 02, 07, 06, 0] ;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TG_GradientData(1,:) = [800 100 100 100 100 100 100 100 100 0 100 100 100 100 100 100 ]; % 有16组数据，数据没有的补0，总的高度为sum(TG_GradientData)
% TG_GradientData(end+1,:) = [700 100 100 100 100 100 100 100 100 100 100 80 70 60 50 20 ]; % % 有16组数据，数据没有的补0，总的高度为sum(TG_GradientData)
% TG_GradientData(end+1,:) = [600 100 100 100 100 100 80 30 30 20 10 10 10 10 10 0 ]; % % 有16组数据，数据没有的补0，总的高度为sum(TG_GradientData)
% 
% TG = [TG_Time TG_GradientData];
% TG = TemperatureVsTime

[data,T,S] = xlsread('test0620.xlsx');
ImageData = data(:,4:end-1);
TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
ImageData2 = ImageData;
% 将数据分为10份,Num=10
Num = 11;
alllength = size(ImageData2,2);
Seg = ceil(alllength/Num);
SgeM = 1:Seg:alllength;
ImageData3 = []; 

for index = 1:size(ImageData2,1)
%     ImageData3(index,1) = sum(ImageData2(index,SgeM(1):SgeM(2)))/(SgeM(2)-SgeM(1)+1);
%     ImageData3(index,2) = sum(ImageData2(index,SgeM(2):SgeM(3)))/(SgeM(3)-SgeM(2)+1);
%     ImageData3(index,3) = sum(ImageData2(index,SgeM(3):SgeM(4)))/(SgeM(4)-SgeM(3)+1);
%     ImageData3(index,4) = sum(ImageData2(index,SgeM(4):SgeM(5)))/(SgeM(5)-SgeM(4)+1);
%     ImageData3(index,5) = sum(ImageData2(index,SgeM(5):SgeM(6)))/(SgeM(6)-SgeM(5)+1);
%     ImageData3(index,6) = sum(ImageData2(index,SgeM(6):SgeM(7)))/(SgeM(7)-SgeM(6)+1);
%     ImageData3(index,7) = sum(ImageData2(index,SgeM(7):SgeM(8)))/(SgeM(8)-SgeM(7)+1);
%     ImageData3(index,8) = sum(ImageData2(index,SgeM(8):SgeM(9)))/(SgeM(9)-SgeM(8)+1);
%     ImageData3(index,9) = sum(ImageData2(index,SgeM(9):SgeM(10)))/(SgeM(10)-SgeM(9)+1);
%     ImageData3(index,10) = sum(ImageData2(index,SgeM(10):SgeM(11)))/(SgeM(11)-SgeM(10)+1);
     for j=1:size(SgeM,2)-1
         ImageData3(index,j) = sum(ImageData2(index,SgeM(j):SgeM(j+1)))/(SgeM(j+1)-SgeM(j)+1);
     end
end
TemperatureVsTime = [Time_Data,ImageData3];
TemperatureVsTime2 = [];
for index = 1:size(TemperatureVsTime,1)-1
    if norm(TemperatureVsTime(index+1,2:6)-TemperatureVsTime(index,2:6))>10^(-6)
        TemperatureVsTime2(end+1,:) = TemperatureVsTime(index,:);
    end   
end
TG = TemperatureVsTime2;
% return
BarData = TG(:,7:end);

Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval = datenum(0,0,0,Hour,Minute,Second);
stem(TG(1,7:end));
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
x = interval;
% datetick('x','HH:MM'); %需用x作为数组变量
datetick('x',13); %需用x作为数组变量
set(gca,'XTick',interval(1):0.002:interval(end));
xlabel('时间'); ylabel('温度 (kpa)');
set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('高度方向烧结料在不同采样时刻的温度阶梯分布')



% end