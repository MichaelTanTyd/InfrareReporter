clc
clear
close all
addpath(genpath(pwd))


[data,T,S] = xlsread('test0620.xlsx');
ImageData = data(:,4:end-1);
TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
%% 获取TemperatureVsTimeData
% TemperatureVsTime = [Time_Data,ImageData];
ImageData2 = ImageData;
% 将数据分为10份,Num=10
Num = 10;
alllength = size(ImageData2,2);
Seg = ceil(alllength/10);
SgeM = 1:Seg:alllength;
ImageData3 = []; 
for index = 1:size(ImageData2,1)
    ImageData3(index,1) = sum(ImageData2(index,SgeM(1):SgeM(2)))/(SgeM(2)-SgeM(1)+1);
    ImageData3(index,2) = sum(ImageData2(index,SgeM(2):SgeM(3)))/(SgeM(3)-SgeM(2)+1);
    ImageData3(index,3) = sum(ImageData2(index,SgeM(3):SgeM(4)))/(SgeM(4)-SgeM(3)+1);
    ImageData3(index,4) = sum(ImageData2(index,SgeM(4):SgeM(5)))/(SgeM(5)-SgeM(4)+1);
    ImageData3(index,5) = sum(ImageData2(index,SgeM(5):SgeM(6)))/(SgeM(6)-SgeM(5)+1);
    ImageData3(index,6) = sum(ImageData2(index,SgeM(6):SgeM(7)))/(SgeM(7)-SgeM(6)+1);
end
TemperatureVsTime = [Time_Data,ImageData3];
% fid = fopen('TemperatureVsTimeData.mat','wt');  
% fprintf(fid,'%g\n',TemperatureVsTime);    
% fclose(fid);
save ('TemperatureVsTimeData.mat','TemperatureVsTime');

