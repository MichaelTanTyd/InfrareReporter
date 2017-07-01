
function ImageData2 = GetSmoothData(ImageData,ROILineNum)

% clc
% clear
% close all
% addpath(genpath(pwd))
% 
% ROILineNum = 3
% 
% [data,T,S] = xlsread('test0623.xlsx');
% data = data(:,1:end-5);
% 
% ImageData = data(:,2:end);
% TimeData = data(:,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ROILineNum == 1
    ImageData2 = ImageData;
    return
end

ProceedData = [];
for j = 1:ROILineNum
    ProceedData{end+1,1} = ImageData(j:ROILineNum:end,:); % 获取数据
end

ImageData2 = ProceedData{1,1};
for index = 2:ROILineNum
    ImageData2 = ImageData2 + ProceedData{index,1};
end
ImageData2 = ImageData2/ROILineNum;