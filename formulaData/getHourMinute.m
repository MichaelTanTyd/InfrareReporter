function [retHour,retMinute ] = getHourMinute( txt )
%GETHOURMINUTE 此处显示有关此函数的摘要
%   此处显示详细说明
len=length(txt)

colon=1;
for index=len:-1:1
    if txt(index)==':'&& colon==1
        txtM=str2num(txt(index-2:index-1));
        colon=2;
    elseif txt(index)==':'&& colon==2
        txtH=str2num(txt(index-2:index-1));
        colon=0;
    end
    
end
retHour=txtH;
retMinute=txtM;

end

