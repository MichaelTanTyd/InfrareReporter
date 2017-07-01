function [ ] = getHeightOfLRAVsTime(handle,LRA_H_t,opt )
%   绘制赤红带高度在时间t上的变化图
%   handle:绘制图形的句柄
%   LRA_H_t:赤红带高度-时间数据
%   LRA_H_t最后一列为赤红带的高度位置，需要转化为mm的单位，pixelToHeight函数实现
%   opt:绘图可选参数，比如plot中的'r*',为字符串
%   可以根据需要添加输入，输出参数，接口中是否需要参数isHoldOn?
% % 温度vs时间
FileName = 'ProceedData';
[data,T,S] = xlsread([FileName,'\图像temp.xlsx']);
ImageDataVsTime  = ProceeImagData(data,T,S); %第一列是时间
save([FileName, '\ImageDataVsTime.mat'], 'ImageDataVsTime')