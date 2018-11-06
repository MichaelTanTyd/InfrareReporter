function [ retHour,retMinute ] = HourMinuteIncreaseByMinute( hour,minuteVal )
%   实现小时，分钟自增1分钟
if minuteVal==60
    retMinute=0;
    retHour=hour+1;
    if retHour==24
        retHour=0;
    end
else
    retMinute=minuteVal;
    retHour=hour;
end
end

