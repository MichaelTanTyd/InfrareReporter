function [ ] = drawtHeightOfTopSurfaceVsTime(handle,TS_H_t ,opt )
%   绘制料面坍塌高度在时间t上的温度变化图
%   handle:绘制图形的句柄
%   TS_H_t:料面坍塌高度在时间t上的温度变化数据
%    LRA_H_t最后一列为坍塌的高度数据
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?

% disp('drawtHeightOfTopSurfaceVsTime')

FileName = 'ProceedData';
load([FileName,'\HeightOfTopSurfaceVsTime.mat']);

TG = HeightOfTopSurfaceVsTime;

Linewidth = 3; % 线条的粗细

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
xlabel('时间'); ylabel('距离 (mm)');
set(gca,'ylim',[-10 150],'ytick',-10:10:150);
% title('烧结过程烧结料坍塌收缩趋势/上表面料位变化过程')
name = '料位到炉口的距离图';
title(name)
% figure 窗口最大化，坐标轴也随着窗口变大而相应变大
scrsz = get(0,'ScreenSize');  % 是为了获得屏幕大小，Screensize是一个4元素向量[left,bottom, width, height]
set(gcf,'Position',scrsz);    % 用获得的screensize向量设置figure的position属性，实现最大化的目的
set(gca,'FontSize',13);
% saveas(gcf,['C:\Users\Administrator\Desktop\图片保存',name,'.bmp']);
%  set(gca,'FontSize',12);
% end