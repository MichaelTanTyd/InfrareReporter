function [ yuanshiguoshiBand,fanyingBand ,ganzaoBand] = TempBandCalu( infrareData)
%   ����ԭʼ����ʪ������Ӧ���߶�
%   �������ݣ���һ��Ϊ���ӵ�����ʱ�䣬�ڶ���Ϊ��Ӧʱ��ĸ߶�����
[m,n]=size(infrareData)
yuanshiguoshiBand=[]
fanyingBand=[]
for col=1:n
    Vec=infrareData(:,col)
    if col==10
        aaa=0;
    end
    [time,yuanshiH,fangyingH , ganzaoHeight]=singleBandCalu( Vec )
    yuanshiguoshiBand(col,:)=[time yuanshiH]
    fanyingBand(col,:)=[time fangyingH]
    ganzaoBand(col,:)=[time ganzaoHeight]
end

end

