clc
clear
close all

allData = xlsread('test_data.xlsx');
% allData = xlsread('test.xlsx');
[M, N] = size(allData); % MΪ�����꣬NΪ������
% [value hight] = max(allData(1,4:end));
%% �¶ȱ仯��ʱ��Ĺ�ϵ
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
xlabel('ʱ�� ms');
ylabel('�߶� Pix');
title([num2str(allData(1,1)) 'ʱ��߶ȹ�ϵͼ'])