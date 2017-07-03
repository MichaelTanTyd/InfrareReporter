function [ ] = drawtHeightOfLRAVsTime(handle,LRA_H_t,opt )
%   ���Ƴ����߶���ʱ��t�ϵı仯ͼ
%   handle:����ͼ�εľ��
%   LRA_H_t:�����߶�-ʱ������
%   LRA_H_t���һ��Ϊ�����ĸ߶�λ�ã���Ҫת��Ϊmm�ĵ�λ��pixelToHeight����ʵ��
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?
FileName = 'config';
load([FileName,'\RealHeight.mat']);
ReaL = RealHeight{1};%  ʵ�ʲ�
ReaL = str2num(ReaL);

FileName = 'ProceedData';
load([FileName,'\ImageDataVsTime.mat']);
ImageData = ImageDataVsTime(:,7:end);

height = [];
row = size(ImageData,1);
MaxL = size(ImageData,2);
for s = 1:row
    [max_value, index] = max(ImageData(s,:));
    height(end+1) = (index-1)*(ReaL-0)/(MaxL-1);   % ���ص�ת��Ϊ��λ�߶���Ϣ
%     height(end+1) = (index-1)*(ReaL-0)/(MaxL-1);   % ���ص�ת��Ϊ��λ�߶���Ϣ
end


TG = ImageDataVsTime;
Linewidth = 3; % �����Ĵ�ϸ
Hour = TG(:,4); 
Minute = TG(:,5);  
Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);
plot(interval,height,'r-', 'LineWidth',Linewidth); hold on

datetick('x',13)
% set(gca,'XTick',interval(1):0.002:interval(end));
% interNum1 = (interval(end)-interval(1))/20;
OneMiniut = 1.1574*10^(-5); 
interNum = 5*60*OneMiniut;
% interNum = min([interNum,interNum1]);

set(gca,'XTick',interval(1):interNum:interval(end));

xlabel('ʱ��'); ylabel('�߶� (mm)');
set(gca,'ylim',[0 1200],'ytick',0:100:1200);
title('�۲ⴰ�ս���ȼ�ղ�λ�ø߶���ʱ��Ǩ������')


set(gca,'FontSize',13);
scrsz = get(0,'ScreenSize');  % ��Ϊ�˻����Ļ��С��Screensize��һ��4Ԫ������[left,bottom, width, height]
set(gcf,'Position',scrsz);    % �û�õ�screensize��������figure��position���ԣ�ʵ����󻯵�Ŀ��
end
