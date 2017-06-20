% function [ ] = drawPressureVsTime(handle,Pre_H_t ,hight,opt )
%   ����ָ���߶�������ʱ��t�ϵ�ѹ����ֵ
%   handle:����ͼ�εľ��
%   Pre_H_t:�������ݣ���һ��Ϊʱ��t,�ڶ���Ϊheight(1)����Ӧ�߶ȵ�ѹ��-ʱ�����ݣ��Դ�����
%   ʱ����Ҫ7λ���������� �� �� Сʱ ���� �� ���� ��������Ÿ߶���Ϣ ���ϵ��� ��һ���߶�100cm��ѹ��
%   90cm��ѹ�� 80cm��ѹ�� 70cm��ѹ�� --- 10cm��ѹ��
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn? 
%   Pre_H_tΪcellģʽ����һ��Ϊʱ�䣬�ڶ���Ϊѹ�����ݣ�ѹ����������Ϊ1-10��������

disp('drawPressureVsTime')

% % ��������
% % clear
% % close all
% % clc
% hight = 2;
% opt = 'r.-';
% Pre_H_t(1,:) = [2017, 2, 02, 07, 02, 0, 1, 2,3, 4, 5, 6, 7, 8, 9] ;% 
% Pre_H_t(2,:) = [2017, 2, 02, 08, 03, 0, 1, 3 ,3, 4, 5, 6, 7, 8, 9] ;% 
% Pre_H_t(3,:) = [2017, 2, 02, 09, 05, 0, 1, 6 ,3, 4, 5, 6, 7, 8, 9] ;%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Linewidth = 5; % �����Ĵ�ϸ
% hight = hight + 6;
% Hour = Pre_H_t(:,4); 
% Minute = Pre_H_t(:,5);  
% interval = datenum(0,0,0,Hour,Minute,0);
% plot(interval,Pre_H_t(:,hight),opt, 'LineWidth',Linewidth); 
% x = interval;   
% datetick('x','HH:MM'); %����x��Ϊ�������
% xlabel('ʱ��'); ylabel('ѹ�� (kpa)');
% set(gca,'ylim',[0 30],'ytick',0:2:30);
% title('�ս�¯��ͬ�߶�λ�õ�¯���ڸ�ѹ���ս���̵Ĳ���')
% disp ��Ҫ��ʾ��ѹ����
addpath(genpath(pwd))
% load('TemperatureVsTimeData.mat')
[data,T,S] = xlsread('ѹ��.xlsx');
ImageData = data(:,2:end);
TimeData = data(:,1);

% ImageData = data(:,4:end);
% TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
%% ��ȡTemperatureVsTimeData
PressureVsTime = [Time_Data,ImageData];

TG = PressureVsTime;
% TG = TG(1:2:end,:);
Linewidth = 3; % �����Ĵ�ϸ
hight = 7;
Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);
% interval = datenum(0,0,0,Hour,Minute,1);
% interval = 1:size(TG,1)
% hight=1
% plot(interval,TG(:,hight),opt, 'LineWidth',Linewidth); 
plot(interval,TG(:,hight),'k-', 'LineWidth',Linewidth);  hold on
plot(interval,TG(:,hight+1),'g-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+2),'b-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+3),'r-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+4),'y-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+5),'m-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+6),'Color',[0.4 0.5 0.6], 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+7),'Color',[0.4 0.1 0.6], 'LineWidth',Linewidth); hold on
% plot(interval,TG(:,hight+8),'Color',[0.1 0.3 0.6], 'LineWidth',Linewidth); hold on
% legend('H=100cm','H=90cm','H=80cm','H=70cm','H=60cm','H=50cm','H=40cm','H=30cm','H=20cm','H=10cm')
legend('H=100cm','H=90cm','H=80cm','H=70cm','H=60cm','H=50cm','H=40cm','H=30cm')

datetick('x',13)
set(gca,'XTick',interval(1):0.002:interval(end));
xlabel('ʱ��'); ylabel('ѹ�� (kpa)');
% set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('�۲ⴰ��ͬ�߶�λ�����ս�����е�ѹ���仯����')

% end