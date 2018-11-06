function [ yuanshiguoshiBand,fanyingBand ,ganzaoBand] = TempBandCalu( infrareData)
%   计算原始及过湿带，反应带高度
%   返回数据，第一列为分钟递增的时间，第二列为对应时间的高度数据
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

