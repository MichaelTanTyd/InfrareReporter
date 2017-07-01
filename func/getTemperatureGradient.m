function [ TG ] = getTemperatureGradient(allData , timeVector)
%   从数据中得到时间序列timeVector上沿高度方向的温度梯度
%   allData:时间同步后的全部数据源
%   timeVector:时间序列，可以为向量，对应不同时刻
%   TG:返回时间序列timeVector中每一时刻沿高度方向的温度梯度
%   可以根据需要添加输入，输出参数

% disp('getTemperatureGradient')
% load('ImageDataVsTime.mat') % 图像和时间数据
% load('HeightOfTopSurfaceVsTime.mat') % 高度和时间数据
FileName = 'ProceedData';
getHeightOfLRAVsTime % 获取图像信息
load([FileName,'\ImageDataVsTime.mat']);

getHeightOfTopSurfaceVsTime; % 获取高度信息
load([FileName,'\HeightOfTopSurfaceVsTime.mat']);


Time1 = ImageDataVsTime(:,1:6);
TimeDouble1 = datenum(num2str(Time1),'yyyy mm dd HH MM SS'); % 时间转化成double类型便于比较
Time2 = HeightOfTopSurfaceVsTime(:,1:6);
TimeDouble2 = datenum(num2str(Time2),'yyyy mm dd HH MM SS');

OneMiniut = 1.1574*10^(-5); 

Error = 10^(-18); % 判断数据是否相等

StartTime = max(TimeDouble1(1),TimeDouble2(1));
EndTime = min(TimeDouble1(end),TimeDouble2(end));

if EndTime < StartTime
    error('红外图像数据和高度数据无法同步，请检查试验数据是否准确')
end

%%%% 对图像数据进行截取
[t1,t2] = CutDataWithTime(TimeDouble1,StartTime,EndTime,Error);
ImageData = ImageDataVsTime(t1:t2,7:end);
Time1 = Time1(t1:t2,:);
TimeDouble1 = TimeDouble1(t1:t2,:);
%%%% 对高度数据进行截取
[h1,h2] = CutDataWithTime(TimeDouble2,StartTime,EndTime,Error);
HeightOfTopSurface = HeightOfTopSurfaceVsTime(h1:h2,7:end);
Time2 = Time2(h1:h2,:);
TimeDouble2 = TimeDouble2(h1:h2,:);

%%% 直接补足秒的信息即可，对图像信息补足秒的信息
SeriseNum = 1;% 表示每间隔1s补足数据
[newTimeDouble1,newImageData] = GetSequenceData(TimeDouble1,ImageData,OneMiniut,SeriseNum);
[newTimeDouble2,newHeightOfTopSurface] = GetSequenceData(TimeDouble2,HeightOfTopSurface,OneMiniut,SeriseNum);
Time_Data1 = TempretureTime2Matri(newTimeDouble1);
Time_Data2 = TempretureTime2Matri(newTimeDouble2);
Num = min([size(Time_Data1,1) ,size(Time_Data2,1) ]); % 简单合并
ImageDataHeightVsTime = [Time_Data1(1:Num,:),newImageData(1:Num,:),newHeightOfTopSurface(1:Num,1)];
save([FileName, '\ImageDataHeightVsTime.mat'],'ImageDataHeightVsTime');

end