clc
clear
close all

allData = xlsread('test_data.xlsx');
% allData = xlsread('test.xlsx');
[M, N] = size(allData); % M为列坐标，N为横坐标
% [value hight] = max(allData(1,4:end));
%% 温度变化和时间的关系
HigChangeData = [];
for index = 1:M
     [value, hight] = max(allData(index,4:end));
     HigChangeData(end+1,1) = allData(index,1);
     HigChangeData (end,2:3) = [value, hight]; 
end
for index = 1:M
    plot(HigChangeData(index,2),HigChangeData(index,3),'b.-');hold on
end
% legend(legendTxt,0)
xlabel('时间 ms');
ylabel('高度 Pix');
title([num2str(allData(1,1)) '时间高度关系图'])