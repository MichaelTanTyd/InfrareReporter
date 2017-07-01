function [ Temp_H_t ] = getTemperatureVsTime( allData ,height )
%   从数据中得到指定高度序列height在时间t上的温度数值
%   allData:时间同步后的全部数据源
%   height:高度序列，可以为向量，表示需要返回多层高度的温度-时间数据
%   Temp_H_t:返回数据，第一列为时间t,第二列为height(1)所对应高度的温度-时间数据，以此类推
%   可以根据需要添加输入，输出参数

% disp('getTemperatureVsTime')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 温度vs时间
FileName = 'ProceedData';
[data,T,S] = xlsread([FileName,'\温度temp.xlsx']);
TempretureData = data(:,3:end);
TimeData = []; %　时间数据
for index = 3:size(S,1)
    TimeData(end+1,:) = TempretureTime2Matri(S{index,2});
end
TemperatureVsTimeData = [TimeData,TempretureData];
save([FileName, '\TemperatureVsTimeData.mat'],'TemperatureVsTimeData');
end

