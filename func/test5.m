
function [ ] = test5(handle,TG ,opt )
%   �����ظ߶ȷ�����¶��ݶ�ͼ
%   handle:����ͼ�εľ��
%   TG:�ظ߶ȷ�����¶��ݶ�����
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?
%   ��״ͼ����ɫ�Ƿ���Ҫ������

% % disp('�ظ߶ȷ�����¶��ݶ�ͼ')
% % %% ��������
FileName = 'ProceedData';
load([FileName,'\ImageDataHeightVsTime.mat']);
TG = ImageDataHeightVsTime;


Hour = TG(:,4);
Minute = TG(:,5);
Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);

ImageData2 = TG(:,7:end-1);
MaxL = size(ImageData2,2);
ReaL = 800;

%% ���ÿ���������Ϣ
index = 1;
NumSart = 7;
PicNum = 1;
time = 1;
%
m = 1;
% :size(ImageData2,1)
load('map.txt')
for h = 1:size(ImageData2,1)
    M = ImageData2(h,1:end-m);
    m=0;
    m = m +1;  
    Length = size(M,2);
    Temp = GetTemp(M,Length);
    colorMap = map;
        for index = size(Temp,1):-1:1
            BarNum = sum(Temp(1:index,2));
            BarNum = (BarNum-1)*(ReaL-0)/(MaxL-1);  % ���ص�ת��Ϊ��λ�߶���Ϣ       
            colorMatr = colorMap(Temp(index,1),:);
            if BarNum ~= 0
                fill([time-0.5,time-0.5,time+0.5,time+0.5,],[0,BarNum,BarNum,0],colorMatr,'edgealpha',0);hold on
            end    
        end      
        time = time + 1;        
end

colormap(map)
colorbar

%% ��ɫ����Ϣ
h = colorbar;
caxis([0,16])
set(h,'ytick',1:1:16)
t = get(h,'YTickLabel');
load('legend.mat') % load����Ϊt
set(h,'YTickLabel',t);
%% ��������Ϣ
% % legend(t)
% % x = interval;
% % datetick('x',15); % ��ʾ������
% 
% % dt = (interval(end)-interval(1))/100
% % set(gca,'XTick',interval(1):0.01:interval(end));
% % set(gca,'XTick','13:20');
% % Hour = TG(:,4);
% % Minute = TG(:,5);
% % xtickcell
% % bar(rand(39,5),'stacked')
% for index = 1:size(Hour,1)
%     if (Minute(index)) < 10
%         xtickcell{1,index} = [num2str((Hour(index))), ':0', num2str((Minute(index)))];
%     else
%         xtickcell{1,index} = [num2str((Hour(index))), ':', num2str((Minute(index)))];
%     end
% end
% g = (time-1) ;
% set(gca,'xlim',[1 g],'XTick',1:g,'XTickLabel',xtickcell)
% set(get(gca,'XLabel'),'Fontsize',12) 
% % set(gca,'XTickLabel',xtickcell)
%% ������ͱ���
xlabel('ʱ��'); ylabel('��λ (mm)');
set(gca,'ylim',[0 900],'ytick',0:100:900);
% title('�߶ȷ����ս����ڲ�ͬ����ʱ�̵��¶Ƚ��ݷֲ�')
title('��ͬ�߶�λ�����ս�����е��¶ȱ仯����')
