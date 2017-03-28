% function [ ] = drawtTemperatureRrend(handle,TG,opt )
%   �����ظ߶ȷ�����¶�����ͼ
%   handle:����ͼ�εľ��
%   TG:�ظ߶ȷ�����¶��ݶ�����
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?
%   ��״ͼ����ɫ�Ƿ���Ҫ������

disp('�ظ߶ȷ�����¶�����ͼ')

%% ��Ҫ������ƻ�ͼ�߼� 
% %% ��������
clear
close all
clc
% hight = 3;
% opt = 'r.-';
TG_Time(1,:) = [2017, 2, 02, 07, 02, 0 ]; % ʱ����Ϣ
TG_Time(end+1,:) = [2017, 2, 02, 07, 04, 0] ;
TG_Time(end+1,:) = [2017, 2, 02, 07, 06, 0] ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TG_GradientData(1,:) = [800 100 100 100 100 100 100 100 100 0 100 100 100 100 100 100 ]; % ��16�����ݣ�����û�еĲ�0���ܵĸ߶�Ϊsum(TG_GradientData)
TG_GradientData(end+1,:) = [700 100 100 100 100 100 100 100 100 100 100 80 70 60 50 20 ]; % % ��16�����ݣ�����û�еĲ�0���ܵĸ߶�Ϊsum(TG_GradientData)
TG_GradientData(end+1,:) = [600 100 100 100 100 100 80 30 30 20 10 10 10 10 10 0 ]; % % ��16�����ݣ�����û�еĲ�0���ܵĸ߶�Ϊsum(TG_GradientData)

TG = [TG_Time TG_GradientData];


% return
BarData = TG(:,7:end);

Hour = TG(:,4); 
Minute = TG(:,5);  
interval = datenum(0,0,0,Hour,Minute,0);
bar(interval,TG(:,7:end));
m = bar(BarData,'stacked');
% m = area(BarData);
set(m, 'linestyle','none')

load('map.txt')
colormap(map)
colorbar

h = colorbar;
set(h ,'YTick',[0 100 1600]);
t = get(h,'YTickLabel');
load('legend.mat')

set(h,'YTickLabel',t);

% myC= [0 0 1
%   1 0 0
%   1 0.4 0
%   0 0.8 1
%   0.6 0 1
%   0 1 0 ];
% data2D = rand(10,6);
% H=bar(data2D, 'stack');
% for k=1:6
%   set(H(k),'facecolor',myC(k,:))
% end
% t2={'>=1500��C';'1400~1499��C '; '1300~1399��C '; '1200~1299��C '; '1100~1199��C '; '1000~1099��C '; '900~999��C '; '800~899��C '; '700~799��C '; '600~699��C '; '500~599��C '; '400~499��C '; '300~399��C '; '200~299��C '; '100~199��C '; '<=99��C '}
% ���ݷ��ˣ���Ҫ������

% AX=legend(h,t2, 'Location','Best','FontSize',8);
% AX=legend( t2);
% return
interval = datenum(0,0,0,Hour,Minute,0);
x = interval;   
% datetick('x','HH:MM'); %����x��Ϊ�������
 datetick('x',13); %����x��Ϊ�������
xlabel('ʱ��'); ylabel('�¶� (kpa)');
set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('��ͬ�߶�λ�����ս�����е��¶ȱ仯����')


% end