function [ ] = drawtTemperatureGradient(handle,TG ,opt )
%   绘制沿高度方向的温度梯度图
%   handle:绘制图形的句柄
%   TG:沿高度方向的温度梯度数据
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?
%   柱状图的颜色是否需要参数？
% clc
% clear
% close all
% 
% disp('沿高度方向的温度梯度图')
%% 测试数据
FileName = 'config';
load([FileName,'\RealHeight.mat']);
ReaL = RealHeight{1};%  实际测
ReaL = str2num(ReaL);

FileName = 'ProceedData';
load([FileName,'\ImageDataHeightVsTime.mat']);
TG = ImageDataHeightVsTime;
% ReaL = 800;

BarNumber = 20;
DN = floor(size(TG,1)/BarNumber);

TG = TG(1:DN:end,:); % 提取部分数据

Hour = TG(:,4); Minute = TG(:,5); Second = TG(:,6);
interval =datenum(0,0,0,Hour,Minute,Second);
ImageData2 = TG(:,7:end-1);
MaxL = size(ImageData2,2);
Height1 = TG(:,end);
for index = 1:size(Height1,1)
    if Height1(index,1) < 0
        Height1(index,1) = 0;
    end
end
Height = ReaL-Height1;
HeihgtPix = (MaxL-1)/ReaL*Height+1;
HeihgtPix = round((MaxL-1)/ReaL*Height+1);
%% 标记每个区间的信息
m = 1;
% :size(ImageData2,1)
load('map.txt')
colorMap = map;
time = 1;
for h = 1:size(ImageData2,1)
    M = ImageData2(h,1:HeihgtPix(m));
    m = m +1;
    % M = [20 30 40 100 120 130 150 200 210 120 150]
    
    Length = size(M,2);
    Temp = GetTemp(M,Length);
    
    
    for index = size(Temp,1):-1:1
        BarNum = sum(Temp(1:index,2));
        BarNum = (BarNum-1)*(ReaL-0)/(MaxL-1);  % 像素点转化为料位高度信息
        
        colorMatr = colorMap(Temp(index,1),:);
        bar(time,BarNum,'FaceColor',colorMatr,'EdgeColor',colorMatr);hold on
    end
    
    time = time + 1;
    
end


load('map.txt')
colormap(map)
colorbar
%% 颜色条信息
%% 颜色条信息
h = colorbar;
caxis([0,16])
set(h,'ytick',1:1:16)
t = get(h,'YTickLabel');
load('legend.mat') % load进来为t
set(h,'YTickLabel',t);
%% 横坐标信息
datetick('x',15); % 显示到分钟

dt = (interval(end)-interval(1))/10;
set(gca,'XTick',interval(1):dt:interval(end));
Hour = TG(:,4);
Minute = TG(:,5);
for index = 1:size(Hour,1)
    if (Minute(index)) < 10
        xtickcell{1,index} = [num2str((Hour(index))), ':0', num2str((Minute(index)))];
    else
        xtickcell{1,index} = [num2str((Hour(index))), ':', num2str((Minute(index)))];
    end
end
g = (time-1) ;
set(gca,'xlim',[1 g],'XTick',1:g,'XTickLabel',xtickcell)
set(get(gca,'XLabel'),'Fontsize',12)
set(gca,'XTickLabel',xtickcell)
%% 纵坐标和标题
xlabel('时间'); ylabel('料位 (mm)');
set(gca,'ylim',[0 900],'ytick',0:100:900);
% title('高度方向烧结料在不同采样时刻的温度阶梯分布')
title('不同高度位置在烧结过程中的温度阶梯分布')
scrsz = get(0,'ScreenSize');  % 是为了获得屏幕大小，Screensize是一个4元素向量[left,bottom, width, height]
set(gcf,'Position',scrsz);    % 用获得的screensize向量设置figure的position属性，实现最大化的目的
set(gca,'FontSize',13);



