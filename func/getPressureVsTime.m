function [ Pre_H_t ] = getPressureVsTime( allData ,height )
%   从数据中得到指定高度序列height在时间t上的压力数值
%   allData:时间同步后的全部数据源
%   height:高度序列，可以为向量，表示需要返回多层高度的压力-时间数据
%   Pre_H_t:返回数据，第一列为时间t,第二列为height(1)所对应高度的压力-时间数据，以此类推
%   可以根据需要添加输入，输出参数
% % % 负压vsTime
FileName = 'ProceedData';
[data,T,S] = xlsread([FileName,'\压差temp.xlsx']);
Pressure = data(:,3:end);
TimeData = []; %　时间数据
tic
for index = 3:size(S,1)
    TimeData(end+1,:) = TempretureTime2Matri(S{index,2});
end
toc
PressureVsTime = [TimeData,Pressure];
save([FileName, '\PressureVsTime.mat'],'PressureVsTime');


end