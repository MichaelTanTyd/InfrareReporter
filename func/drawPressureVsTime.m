function [ ] = drawPressureVsTime(handle,Pre_H_t ,hight,opt )
%   ����ָ���߶�������ʱ��t�ϵ�ѹ����ֵ
%   handle:����ͼ�εľ��
%   Pre_H_t:�������ݣ���һ��Ϊʱ��t,�ڶ���Ϊheight(1)����Ӧ�߶ȵ�ѹ��-ʱ�����ݣ��Դ�����
%   ʱ����Ҫ7λ���������� �� �� Сʱ ���� �� ���� ��������Ÿ߶���Ϣ ���ϵ��� ��һ���߶�100cm��ѹ��
%   90cm��ѹ�� 80cm��ѹ�� 70cm��ѹ�� --- 10cm��ѹ��
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn? 
%   Pre_H_tΪcellģʽ����һ��Ϊʱ�䣬�ڶ���Ϊѹ�����ݣ�ѹ����������Ϊ1-10��������
FileName = 'ProceedData';
% load([FileName,'\TempretureVsTimeData.mat']);
load([FileName,'\PressureVsTime.mat']);
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
plot(interval,abs(TG(:,hight)),'k-', 'LineWidth',Linewidth);  hold on
plot(interval,abs(TG(:,hight+1)),'g-', 'LineWidth',Linewidth); hold on
plot(interval,abs(TG(:,hight+2)),'b-', 'LineWidth',Linewidth); hold on
plot(interval,abs(TG(:,hight+3)),'r-', 'LineWidth',Linewidth); hold on
plot(interval,abs(TG(:,hight+4)),'y-', 'LineWidth',Linewidth); hold on
plot(interval,abs(TG(:,hight+5)),'m-', 'LineWidth',Linewidth); hold on
plot(interval,abs(TG(:,hight+6)),'Color',[0.4 0.5 0.6], 'LineWidth',Linewidth); hold on
plot(interval,abs(TG(:,hight+7)),'Color',[0.4 0.1 0.6], 'LineWidth',Linewidth); hold on
% plot(interval,TG(:,hight+2),'b-', 'LineWidth',Linewidth); hold on
% plot(interval,TG(:,hight+3),'r-', 'LineWidth',Linewidth); hold on
% plot(interval,TG(:,hight+4),'y-', 'LineWidth',Linewidth); hold on
% plot(interval,TG(:,hight+5),'m-', 'LineWidth',Linewidth); hold on
% plot(interval,TG(:,hight+6),'Color',[0.4 0.5 0.6], 'LineWidth',Linewidth); hold on
% plot(interval,TG(:,hight+7),'Color',[0.4 0.1 0.6], 'LineWidth',Linewidth); hold on
% plot(interval,TG(:,hight+8),'Color',[0.1 0.3 0.6], 'LineWidth',Linewidth); hold on
% legend('H=100cm','H=90cm','H=80cm','H=70cm','H=60cm','H=50cm','H=40cm','H=30cm','H=20cm','H=10cm')
legend('H=100cm','H=90cm','H=80cm','H=70cm','H=60cm','H=50cm','H=40cm','H=30cm')

datetick('x',13)
% interNum = (interval(end)-interval(1))/10;
OneMiniut = 1.1574*10^(-5); 
interNum = 5*60*OneMiniut;
set(gca,'XTick',interval(1):interNum:interval(end));
% set(gca,'XTick',interval(1):0.002:interval(end));
xlabel('ʱ��'); ylabel('ѹ�������ֵ (kpa)');
title('�ս�¯��ͬ�߶�λ�õ�¯���ڸ�ѹ���ս���̵Ĳ���')
set(gca,'FontSize',13);

scrsz = get(0,'ScreenSize');  % ��Ϊ�˻����Ļ��С��Screensize��һ��4Ԫ������[left,bottom, width, height]
set(gcf,'Position',scrsz);    % �û�õ�screensize��������figure��position���ԣ�ʵ����󻯵�Ŀ��
% end