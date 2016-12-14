% 2016-12-12
% 显示基本功能


clc
clear
close all


allData = xlsread('test_data.xlsx');
[M, N] = size(allData); % M为列坐标，N为横坐标
%% 作图：温度变化和时间的关系
for index = 1:M
    plot(allData(index,3:end)); hold on; grid on;
end
legendTxt = num2str(allData(:,1));
legend(legendTxt,0)
xlabel('位置值 Pix ');
ylabel('温度值 ℃');
title('不同时间段的位置-温度关系图')