% function [ ] = drawTemperatureVsTime(handle,TG,hight,opt )
%   ����ָ���߶�������ʱ��t�ϵ��¶���ֵ
%   handle:����ͼ�εľ��
%   TG:�������ݣ���һ��Ϊʱ��t,�ڶ���Ϊheight(1)����Ӧ�߶ȵ��¶�-ʱ�����ݣ��Դ�����
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?

disp('drawTemperatureVsTime')

%% ��������
clear
close all
clc
hight = 3;
opt = 'r.-';
TG(1,:) = [2017, 2, 02, 07, 02, 0, 1, 2,1500, 4, 5, 6, 7, 8, 9] ;% 
TG(2,:) = [2017, 2, 02, 08, 03, 0, 1, 3 ,1300, 4, 5, 6, 7, 8, 9] ;% 
TG(3,:) = [2017, 2, 02, 09, 05, 0, 1, 6 ,1200, 4000, 5, 6, 7, 8, 9] ;%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Linewidth = 5; % �����Ĵ�ϸ
hight = hight + 6;
Hour = TG(:,4); 
Minute = TG(:,5);  
interval = datenum(0,0,0,Hour,Minute,0);
plot(interval,TG(:,hight),opt, 'LineWidth',Linewidth); 
% x = interval;   
datetick('x','HH:MM'); %����x��Ϊ�������
xlabel('ʱ��'); ylabel('�¶� (kpa)');
set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('��ͬ�߶�λ�����ս�����е��¶ȱ仯����')
% end