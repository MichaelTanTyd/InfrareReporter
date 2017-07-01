function [ ] = drawTemperatureVsTime(handle)
%   ����ָ���߶�������ʱ��t�ϵ��¶���ֵ
%   handle:����ͼ�εľ��
%   TG:�������ݣ���һ��Ϊʱ��t,�ڶ���Ϊheight(1)����Ӧ�߶ȵ��¶�-ʱ�����ݣ��Դ�����
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?



% addpath(genpath(pwd))
FileName = 'ProceedData';
% load([FileName,'\TempretureVsTimeData.mat']);
load([FileName,'\TemperatureVsTimeData.mat']);

TG = TemperatureVsTimeData;
Linewidth = 3; % �����Ĵ�ϸ
hight = 7;
Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);

plot(interval,TG(:,hight),'k-', 'LineWidth',Linewidth);  hold on
plot(interval,TG(:,hight+1),'g-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+2),'b-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+3),'r-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+4),'y-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+5),'m-', 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+6),'Color',[0.4 0.5 0.6], 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+7),'Color',[0.4 0.3 0.5], 'LineWidth',Linewidth); hold on
plot(interval,TG(:,hight+8),'Color',[0.1 0.5 0.6], 'LineWidth',Linewidth); hold on

legend('100cm','90cm','80cm','70cm','60cm','50cm','40cm','30cm','20cm')


datetick('x',13)
% interNum = (interval(end)-interval(1))/10;
OneMiniut = 1.1574*10^(-5); 
interNum = 5*60*OneMiniut;
set(gca,'XTick',interval(1):interNum:interval(end));
xlabel('ʱ��'); ylabel('�¶� (��)');
set(gca,'ylim',[0 1500],'ytick',0:100:1500);
title( '�۲ⴰ��ͬ�߶�λ�����ս�����е��¶ȱ仯����')
set(gca,'FontSize',13);
scrsz = get(0,'ScreenSize');  % ��Ϊ�˻����Ļ��С��Screensize��һ��4Ԫ������[left,bottom, width, height]
set(gcf,'Position',scrsz);    % �û�õ�screensize��������figure��position���ԣ�ʵ����󻯵�Ŀ��
