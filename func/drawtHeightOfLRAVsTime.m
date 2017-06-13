function [ ] = drawtHeightOfLRAVsTime(handle,LRA_H_t,opt )
%   ���Ƴ����߶���ʱ��t�ϵı仯ͼ
%   handle:����ͼ�εľ��
%   LRA_H_t:�����߶�-ʱ������
%   LRA_H_t���һ��Ϊ�����ĸ߶�λ�ã���Ҫת��Ϊmm�ĵ�λ��pixelToHeight����ʵ��
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?

disp('drawtHeightOfLRAVsTime')
disp ��Ҫ����pixelToHeight����
%% ��������
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
%% ʵ��������
Linewidth = 3; % �����Ĵ�ϸ
Hour = LRA_H_t(:,4); 
Minute = LRA_H_t(:,5);  
interval = datenum(0,0,0,Hour,Minute,0);
plot(interval,LRA_H_t(:,end),opt, 'LineWidth',Linewidth); 
% x = interval;   
datetick('x','HH:MM'); %����x��Ϊ�������
xlabel('ʱ��'); ylabel('��λH (mm)');
set(gca,'ylim',[0 1100],'ytick',0:100:1100);
title('�ս���ȼ�ղ�Ǩ������')
end
