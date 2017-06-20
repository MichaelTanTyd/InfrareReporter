function [ Pre_H_t ] = getPressureVsTime( allData ,height )
%   �������еõ�ָ���߶�����height��ʱ��t�ϵ�ѹ����ֵ
%   allData:ʱ��ͬ�����ȫ������Դ
%   height:�߶����У�����Ϊ��������ʾ��Ҫ���ض��߶ȵ�ѹ��-ʱ������
%   Pre_H_t:�������ݣ���һ��Ϊʱ��t,�ڶ���Ϊheight(1)����Ӧ�߶ȵ�ѹ��-ʱ�����ݣ��Դ�����
%   ���Ը�����Ҫ������룬�������

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
TG = TG(1:2:end,:);
TempStart = 5;
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


legend('H=100cm','H=90cm','H=80cm','H=70cm','H=60cm','H=50cm','H=40cm','H=30cm','H=20cm','H=10cm')
datetick('x',13)
set(gca,'XTick',interval(1):0.002:interval(end));
xlabel('ʱ��'); ylabel('ѹ�� (kpa)');
% set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title('�۲ⴰ��ͬ�߶�λ�����ս�����е�ѹ���仯����')

end