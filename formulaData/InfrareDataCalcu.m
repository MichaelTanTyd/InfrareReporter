function [ RET ,yuanshiguoshiBand,fanyingBand ,ganzaoBand] = InfrareDataCalcu( excelPath,startHour,startMinute,endHour,endMinute )
%   计算原始及过湿带高度时间数据，反应带高度时间数据
%   返回值：RET——时间VS平均温度，yuanshiguoshiBand——原始及过湿带高度时间数据，fanyingBand——反应带高度时间数据

innerHour=startHour
innerMinute=startMinute
system('tskill EXCEL')
[Type,Sheet,Format]=xlsfinfo(excelPath)
ColVec=xlsread(excelPath,Sheet{1},'IW:IW')
len=length(ColVec)
m=321
n=ceil(len/m)
Matrix=reshape(ColVec,m,n)
columnNo=[]
for i=1:n
    [year, month, day, hour, minuteVal, second] = datevec(Matrix(1,i))
    if hour==innerHour && minuteVal==innerMinute 
        columnNo(end+1)=i
        innerMinute=innerMinute+1
        [innerHour,innerMinute]=HourMinuteIncreaseByMinute( innerHour,innerMinute )
    end
    if hour==endHour && minuteVal==endMinute 
        break
    end
    
end

RET=Matrix(:,columnNo)  %得到以一分钟为间隔的数据
[ yuanshiguoshiBand,fanyingBand ,ganzaoBand] = TempBandCalu( RET)

end

