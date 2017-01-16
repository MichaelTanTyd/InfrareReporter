% 2016-12-12
% 显示基本功能


clc
clear
close all

% 以下数据需要在GUI在文件打开环节打开数据
allData = xlsread('D:\matlab_gui\InfrareReporter\usr\test_data.xlsx'); 
[M, N] = size(allData); % M为列坐标，N为横坐标
%% 作图1：温度变化和时间的关系
for index = 1:M
    plot(allData(index,3:end)); hold on; grid on;
end
legendTxt = num2str(allData(:,1));
legend(legendTxt,0)
xlabel('位置值（Pix） ');
ylabel('温度值（℃）');
title('不同时间段的ROI位置-温度关系图')

%% 作图2：高度方向温度阶梯分布图
