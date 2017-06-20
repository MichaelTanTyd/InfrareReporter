% function [ ] = drawtTemperatureGradient(handle,TG ,opt )
%   �����ظ߶ȷ�����¶��ݶ�ͼ
%   handle:����ͼ�εľ��
%   TG:�ظ߶ȷ�����¶��ݶ�����
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?
%   ��״ͼ����ɫ�Ƿ���Ҫ������

disp('�ظ߶ȷ�����¶��ݶ�ͼ')
%% ��������
clear
close all
clc
% hight = 3;
% opt = 'r.-';
% TG_Time(1,:) = [2017, 2, 02, 07, 02, 0 ]; % ʱ����Ϣ
% TG_Time(end+1,:) = [2017, 2, 02, 07, 04, 0] ;
% TG_Time(end+1,:) = [2017, 2, 02, 07, 06, 0] ;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TG_GradientData(1,:) = [800 100 100 100 100 100 100 100 100 0 100 100 100 100 100 100 ]; % ��16�����ݣ�����û�еĲ�0���ܵĸ߶�Ϊsum(TG_GradientData)
% TG_GradientData(end+1,:) = [700 100 100 100 100 100 100 100 100 100 100 80 70 60 50 20 ]; % % ��16�����ݣ�����û�еĲ�0���ܵĸ߶�Ϊsum(TG_GradientData)
% TG_GradientData(end+1,:) = [600 100 100 100 100 100 80 30 30 20 10 10 10 10 10 0 ]; % % ��16�����ݣ�����û�еĲ�0���ܵĸ߶�Ϊsum(TG_GradientData)
% 
% TG = [TG_Time TG_GradientData];
% TG = TemperatureVsTime

[data,T,S] = xlsread('test0620.xlsx');
ImageData = data(:,4:end-1);
TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
ImageData2 = ImageData;
% �����ݷ�Ϊ10��,Num=10
Num = 11;
alllength = size(ImageData2,2);
Seg = ceil(alllength/Num);
SgeM = 1:Seg:alllength;
ImageData3 = []; 

for index = 1:size(ImageData2,1)
%     ImageData3(index,1) = sum(ImageData2(index,SgeM(1):SgeM(2)))/(SgeM(2)-SgeM(1)+1);
%     ImageData3(index,2) = sum(ImageData2(index,SgeM(2):SgeM(3)))/(SgeM(3)-SgeM(2)+1);
%     ImageData3(index,3) = sum(ImageData2(index,SgeM(3):SgeM(4)))/(SgeM(4)-SgeM(3)+1);
%     ImageData3(index,4) = sum(ImageData2(index,SgeM(4):SgeM(5)))/(SgeM(5)-SgeM(4)+1);
%     ImageData3(index,5) = sum(ImageData2(index,SgeM(5):SgeM(6)))/(SgeM(6)-SgeM(5)+1);
%     ImageData3(index,6) = sum(ImageData2(index,SgeM(6):SgeM(7)))/(SgeM(7)-SgeM(6)+1);
%     ImageData3(index,7) = sum(ImageData2(index,SgeM(7):SgeM(8)))/(SgeM(8)-SgeM(7)+1);
%     ImageData3(index,8) = sum(ImageData2(index,SgeM(8):SgeM(9)))/(SgeM(9)-SgeM(8)+1);
%     ImageData3(index,9) = sum(ImageData2(index,SgeM(9):SgeM(10)))/(SgeM(10)-SgeM(9)+1);
%     ImageData3(index,10) = sum(ImageData2(index,SgeM(10):SgeM(11)))/(SgeM(11)-SgeM(10)+1);
     for j=1:size(SgeM,2)-1
         ImageData3(index,j) = sum(ImageData2(index,SgeM(j):SgeM(j+1)))/(SgeM(j+1)-SgeM(j)+1);
     end
end
TemperatureVsTime = [Time_Data,ImageData3];
TemperatureVsTime2 = [];
for index = 1:size(TemperatureVsTime,1)-1
    if norm(TemperatureVsTime(index+1,2:6)-TemperatureVsTime(index,2:6))>10^(-6)
        TemperatureVsTime2(end+1,:) = TemperatureVsTime(index,:);
    end   
end
TG = TemperatureVsTime2;
% return
BarData = TG(:,7:end);

Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval = datenum(0,0,0,Hour,Minute,Second);
stem(TG(1,7:end));
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
x = interval;
% datetick('x','HH:MM'); %����x��Ϊ�������
datetick('x',13); %����x��Ϊ�������
set(gca,'XTick',interval(1):0.002:interval(end));
xlabel('ʱ��'); ylabel('�¶� (kpa)');
set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('�߶ȷ����ս����ڲ�ͬ����ʱ�̵��¶Ƚ��ݷֲ�')



% end