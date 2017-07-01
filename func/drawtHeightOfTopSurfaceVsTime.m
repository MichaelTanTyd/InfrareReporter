function [ ] = drawtHeightOfTopSurfaceVsTime(handle,TS_H_t ,opt )
%   ��������̮���߶���ʱ��t�ϵ��¶ȱ仯ͼ
%   handle:����ͼ�εľ��
%   TS_H_t:����̮���߶���ʱ��t�ϵ��¶ȱ仯����
%    LRA_H_t���һ��Ϊ̮���ĸ߶�����
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?

% disp('drawtHeightOfTopSurfaceVsTime')

FileName = 'ProceedData';
load([FileName,'\HeightOfTopSurfaceVsTime.mat']);

TG = HeightOfTopSurfaceVsTime;

Linewidth = 3; % �����Ĵ�ϸ

Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);
plot(interval,TG(:,end),'k-', 'LineWidth',Linewidth);  hold on

datetick('x',13)
% interNum = (interval(end)-interval(1))/10;
% interNum = (interval(end)-interval(1))/10;
OneMiniut = 1.1574*10^(-5); 
interNum = 5*60*OneMiniut;

set(gca,'XTick',interval(1):interNum:interval(end));
xlabel('ʱ��'); ylabel('���� (mm)');
set(gca,'ylim',[-10 150],'ytick',-10:10:150);
% title('�ս�����ս���̮����������/�ϱ�����λ�仯����')
name = '��λ��¯�ڵľ���ͼ';
title(name)
% figure ������󻯣�������Ҳ���Ŵ��ڱ�����Ӧ���
scrsz = get(0,'ScreenSize');  % ��Ϊ�˻����Ļ��С��Screensize��һ��4Ԫ������[left,bottom, width, height]
set(gcf,'Position',scrsz);    % �û�õ�screensize��������figure��position���ԣ�ʵ����󻯵�Ŀ��
set(gca,'FontSize',13);
% saveas(gcf,['C:\Users\Administrator\Desktop\ͼƬ����',name,'.bmp']);
%  set(gca,'FontSize',12);
% end