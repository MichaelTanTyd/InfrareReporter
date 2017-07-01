function [ ] = drawPressureVsTime(handle,Pre_H_t ,hight,opt )
%   绘制指定高度序列在时间t上的压力数值
%   handle:绘制图形的句柄
%   Pre_H_t:输入数据，第一列为时间t,第二列为height(1)所对应高度的压力-时间数据，以此类推
%   时间需要7位，包括：年 月 日 小时 分钟 秒 毫秒 后面紧接着高度信息 从上到下 第一个高度100cm处压力
%   90cm处压力 80cm处压力 70cm处压力 --- 10cm处压力
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn? 
%   Pre_H_t为cell模式，第一列为时间，第二列为压力数据，压力数据依次为1-10处的数据
FileName = 'ProceedData';
% load([FileName,'\TempretureVsTimeData.mat']);
load([FileName,'\PressureVsTime.mat']);
TG = PressureVsTime;
% TG = TG(1:2:end,:);
Linewidth = 3; % 线条的粗细
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
xlabel('时间'); ylabel('压力差绝对值 (kpa)');
title('烧结炉不同高度位置的炉膛内负压在烧结过程的波动')
set(gca,'FontSize',13);

scrsz = get(0,'ScreenSize');  % 是为了获得屏幕大小，Screensize是一个4元素向量[left,bottom, width, height]
set(gcf,'Position',scrsz);    % 用获得的screensize向量设置figure的position属性，实现最大化的目的
% end