function [ TS_H_t ] = getHeightOfTopSurfaceVsTime( allData  )
%   从数据中得到料面坍塌高度在时间t上的温度数值
%   allData:时间同步后的全部数据源
%   TS_H_t:返回数据，第一列为时间t,第二列为料面坍塌高度
%   可以根据需要添加输入，输出参数
FileName = 'ProceedData';
[data,T,S] = xlsread([FileName,'\料位temp.xlsx']);
HeightOfTopSurface = data(:,3:end);
TimeData = []; %　时间数据
for index = 3:size(S,1)
    TimeData(end+1,:) = TempretureTime2Matri(S{index,2});
end
HeightOfTopSurfaceVsTime = [TimeData,HeightOfTopSurface];
save([FileName, '\HeightOfTopSurfaceVsTime.mat'],'HeightOfTopSurfaceVsTime');

end

