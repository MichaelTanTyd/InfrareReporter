% 2016-12-12
% ��ʾ��������


clc
clear
close all


allData = xlsread('test_data.xlsx');
[M, N] = size(allData); % MΪ�����꣬NΪ������
%% ��ͼ���¶ȱ仯��ʱ��Ĺ�ϵ
for index = 1:M
    plot(allData(index,3:end)); hold on; grid on;
end
legendTxt = num2str(allData(:,1));
legend(legendTxt,0)
xlabel('λ��ֵ Pix ');
ylabel('�¶�ֵ ��');
title('��ͬʱ��ε�λ��-�¶ȹ�ϵͼ')