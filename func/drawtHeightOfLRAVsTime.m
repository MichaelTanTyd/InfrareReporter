function [ ] = drawtHeightOfLRAVsTime(handle,LRA_H_t,opt )
%   绘制赤红带高度在时间t上的变化图
%   handle:绘制图形的句柄
%   LRA_H_t:赤红带高度-时间数据
%   LRA_H_t最后一列为赤红带的高度位置，需要转化为mm的单位，pixelToHeight函数实现
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?
FileName = 'config';
load([FileName,'\RealHeight.mat']);
ReaL = RealHeight{1};%  实际测
ReaL = str2num(ReaL);

FileName = 'ProceedData';
load([FileName,'\ImageDataVsTime.mat']);
ImageData = ImageDataVsTime(:,7:end);

height = [];
row = size(ImageData,1);
MaxL = size(ImageData,2);
for s = 1:row
    [max_value, index] = max(ImageData(s,:));
    height(end+1) = (index-1)*(ReaL-0)/(MaxL-1);   % 像素点转化为料位高度信息
%     height(end+1) = (index-1)*(ReaL-0)/(MaxL-1);   % 像素点转化为料位高度信息
end


TG = ImageDataVsTime;
Linewidth = 3; % 线条的粗细
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

xlabel('时间'); ylabel('高度 (mm)');
set(gca,'ylim',[0 1200],'ytick',0:100:1200);
title('观测窗烧结料燃烧层位置高度随时间迁移趋势')


set(gca,'FontSize',13);
scrsz = get(0,'ScreenSize');  % 是为了获得屏幕大小，Screensize是一个4元素向量[left,bottom, width, height]
set(gcf,'Position',scrsz);    % 用获得的screensize向量设置figure的position属性，实现最大化的目的
end
