% function [ ] = drawtHeightOfTopSurfaceVsTime(handle,TS_H_t ,opt )
%   ��������̮���߶���ʱ��t�ϵ��¶ȱ仯ͼ
%   handle:����ͼ�εľ��
%   TS_H_t:����̮���߶���ʱ��t�ϵ��¶ȱ仯����
%    LRA_H_t���һ��Ϊ̮���ĸ߶�����
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?

disp('drawtHeightOfTopSurfaceVsTime')
% % clc
% % clear
% % close all
% opt = 'r.-';
% TS_H_t(1,:) = [2017, 2, 02, 07, 01,0, 1150] ;% 
% TS_H_t(1,:) = [2017, 2, 02, 07, 02,0, 1100] ;% 
% TS_H_t(2,:) = [2017, 2, 02, 07, 03,0, 1000] ;% 
% TS_H_t(3,:) = [2017, 2, 02, 07, 05,0, 900] ;%
% TS_H_t(4,:) = [2017, 2, 02, 07, 07,0, 850] ;%
% TS_H_t(5,:) = [2017, 2, 02, 07, 08,0, 820] ;%
% TS_H_t(6,:) = [2017, 2, 02, 07, 10,0, 810] ;%
% 
% Linewidth = 5; % �����Ĵ�ϸ
% Hour = TS_H_t(:,4); 
% Minute = TS_H_t(:,5);  
% interval = datenum(0,0,0,Hour,Minute,0);
% plot(interval,TS_H_t(:,7),opt, 'LineWidth',Linewidth); 
% % x = interval;   
% datetick('x','HH:MM'); %����x��Ϊ�������
% xlabel('ʱ��'); ylabel('��λH (mm)');
% set(gca,'ylim',[0 1100],'ytick',0:100:1100);
% title('�ս���̽���̮����������/�ϱ�����λ�仯����')

addpath(genpath(pwd))

% load('TemperatureVsTimeData.mat')
[data,T,S] = xlsread('�¶�.xlsx');
ImageData = data(:,2:end);
% AllLength = 1100;
% ImageData = AllLength-ImageData;

TimeData = data(:,1);
% ImageData = data(:,4:end);
% TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
%% ��ȡTemperatureVsTimeData
TemperatureVsTime = [Time_Data,ImageData];
TG = TemperatureVsTime;
Linewidth = 3; % �����Ĵ�ϸ

Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);
% interval = datenum(0,0,0,Hour,Minute,1);
% interval = 1:size(TG,1)
% hight=1
% plot(interval,TG(:,hight),opt, 'LineWidth',Linewidth); 
plot(interval,TG(:,end),'k-', 'LineWidth',Linewidth);  hold on

datetick('x',13)
set(gca,'XTick',interval(1):0.002:interval(end));
xlabel('ʱ��'); ylabel('���� (mm)');
set(gca,'ylim',[0 1100],'ytick',0:100:1100);
% title('�ս�����ս���̮����������/�ϱ�����λ�仯����')
 title('��λ��¯�ڵľ���ͼ')
% end