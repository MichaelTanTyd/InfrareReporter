% 2016-12-12
% ��ʾ��������


clc
clear
close all

% ����������Ҫ��GUI���ļ��򿪻��ڴ�����
allData = xlsread('D:\matlab_gui\InfrareReporter\usr\test_data.xlsx'); 
[M, N] = size(allData); % MΪ�����꣬NΪ������
%% ��ͼ1���¶ȱ仯��ʱ��Ĺ�ϵ
for index = 1:M
    plot(allData(index,3:end)); hold on; grid on;
end
legendTxt = num2str(allData(:,1));
legend(legendTxt,0)
xlabel('λ��ֵ��Pix�� ');
ylabel('�¶�ֵ���棩');
title('��ͬʱ��ε�ROIλ��-�¶ȹ�ϵͼ')

%% ��ͼ2���߶ȷ����¶Ƚ��ݷֲ�ͼ
