function [ ] = drawPressureVsTime(handle,Pre_H_t ,hight,opt )
%   ����ָ���߶�������ʱ��t�ϵ�ѹ����ֵ
%   handle:����ͼ�εľ��
%   Pre_H_t:�������ݣ���һ��Ϊʱ��t,�ڶ���Ϊheight(1)����Ӧ�߶ȵ�ѹ��-ʱ�����ݣ��Դ�����
%   ʱ����Ҫ7λ���������� �� �� Сʱ ���� �� ���� ��������Ÿ߶���Ϣ ���ϵ��� ��һ���߶�100cm��ѹ��
%   90cm��ѹ�� 80cm��ѹ�� 70cm��ѹ�� --- 10cm��ѹ��
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn? 
%   Pre_H_tΪcellģʽ����һ��Ϊʱ�䣬�ڶ���Ϊѹ�����ݣ�ѹ����������Ϊ1-10��������

disp('drawPressureVsTime')

% ��������
% clear
% close all
% clc
hight = 2;
opt = 'r.-';
Pre_H_t(1,:) = [2017, 2, 02, 07, 02, 0, 1, 2,3, 4, 5, 6, 7, 8, 9] ;% 
Pre_H_t(2,:) = [2017, 2, 02, 08, 03, 0, 1, 3 ,3, 4, 5, 6, 7, 8, 9] ;% 
Pre_H_t(3,:) = [2017, 2, 02, 09, 05, 0, 1, 6 ,3, 4, 5, 6, 7, 8, 9] ;%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Linewidth = 5; % �����Ĵ�ϸ
hight = hight + 6;
Hour = Pre_H_t(:,4); 
Minute = Pre_H_t(:,5);  
interval = datenum(0,0,0,Hour,Minute,0);
plot(interval,Pre_H_t(:,hight),opt, 'LineWidth',Linewidth); 
x = interval;   
datetick('x','HH:MM'); %����x��Ϊ�������
xlabel('ʱ��'); ylabel('ѹ�� (kpa)');
set(gca,'ylim',[0 30],'ytick',0:2:30);
title('�ս�¯��ͬ�߶�λ�õ�¯���ڸ�ѹ���ս���̵Ĳ���')
disp ��Ҫ��ʾ��ѹ����
end