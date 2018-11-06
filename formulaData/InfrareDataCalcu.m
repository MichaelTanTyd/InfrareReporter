function [ RET ,yuanshiguoshiBand,fanyingBand ,ganzaoBand] = InfrareDataCalcu( excelPath,startHour,startMinute,endHour,endMinute )
%   ����ԭʼ����ʪ���߶�ʱ�����ݣ���Ӧ���߶�ʱ������
%   ����ֵ��RET����ʱ��VSƽ���¶ȣ�yuanshiguoshiBand����ԭʼ����ʪ���߶�ʱ�����ݣ�fanyingBand������Ӧ���߶�ʱ������

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

RET=Matrix(:,columnNo)  %�õ���һ����Ϊ���������
[ yuanshiguoshiBand,fanyingBand ,ganzaoBand] = TempBandCalu( RET)

end

