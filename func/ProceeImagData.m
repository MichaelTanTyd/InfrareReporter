function [ tuxiang1 ] = ProceeImagData(data,T,S)
% 对图像数据做处理，均值化，剔除无效数据

ROILineInfor = [ ];
for index = 2:size(T,1)
    Temp = T{index,3};
    ROILineInfor(end+1,:) = str2num(Temp(5:end));
end

for index = 100:-1:1 % 最多的ROIline的数量在100条
    ROILineNum = find(ROILineInfor == index);
    if size(ROILineNum) ~= 0
        ROILineNum = index;
        break
    end
end

%% 获取有效的信息数据和时间数据
ImageData = data(:,4:end);
TimeData = data(:,1);
TimeData = ImageTime2Matri(TimeData);

Temp = [];
for index = 1:ROILineNum
    a1 = find(isnan(ImageData(index,:))); 
    Temp(end+1) = size(a1,2);
end
DeleNum = max(Temp);
ImageData = ImageData(:,1:end-DeleNum);
%% 数据平滑
ImageData2 = GetSmoothData(ImageData,ROILineNum);
TimeData = TimeData(1:ROILineNum:end,:);
%% 剔除相同的数据
TemperatureVsTime = [TimeData,ImageData2];
TemperatureVsTime2 = TemperatureVsTime(1,:);
for index = 1:size(TemperatureVsTime,1)-1
    if norm(TemperatureVsTime(index+1,2:6)-TemperatureVsTime(index,2:6))>10^(-6)
        TemperatureVsTime2(end+1,:) = TemperatureVsTime(index+1,:);
    end
end
tuxiang1 = TemperatureVsTime2;

end