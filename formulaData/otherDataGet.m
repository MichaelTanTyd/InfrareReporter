function [ RET ] = otherDataGet( csvPath,startHour,startMinute,endHour,endMinute )
%OTHERDATAGET �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
innerHour=startHour
innerMinute=startMinute
% csvPath='C:\Users\Administrator\Desktop\Export.csv'
% [NumeVal,TxtVal,Raw]=xlsread(csvPath,'Export')
% system('tskill EXCEL')
[Type,Sheet,Format]=xlsfinfo(csvPath)
[NumeVal,TxtVal,Raw]=xlsread(csvPath,Sheet{1}) %��ȡ��һ�������������
[m,n]=size(Raw)
rowBegin=0
rowEnd=0;
for  row=2:m
    [hourVal,minuteVal ] = getHourMinute( Raw{row,1} )
    if hourVal==startHour && minuteVal==startMinute
        rowBegin=row
    end
    if hourVal==endHour && minuteVal==endMinute
        rowEnd=row
        break
    end
    
end

rowNum=rowEnd-rowBegin+1
tmp=[Raw{rowBegin:rowEnd,2:2:n}]
RET=reshape(tmp,rowNum,length(tmp)/rowNum)

end

