function [ retTime,retOriWetHeight,fanyingHeight,ganzaoHeight ] = singleBandCalu( Vec )
%SINGLEBANDCALU �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

oriWetTempTheory=300.0 %ԭʼ����ʪ���¶�
fanyingBand1=600  %��Ӧ���¶�1
fangyingBand2=1000 %��Ӧ���¶�2
ganzaoBand1=300
ganzaoBand2=600
HeightTheory=800 %¯�Ӹ߶�
Pixl=320 % �߶�����

%% ����ԭʼ����ʪ���߶�
retTime=Vec(1)
[MaxVal,MaxRow]=max(Vec(2:end))
if MaxVal<=oriWetTempTheory
    retOriWetHeight=HeightTheory
else
    for index=321:-1:(MaxRow+1)
        if Vec(index)>oriWetTempTheory
            retOriWetHeight=(321-index)*HeightTheory/Pixl
            break
        end 
    end  
end
%% ��Ӧ���߶ȼ���
deltaH=0

if MaxVal<=fanyingBand1
    deltaH=0
else    
    for index=321:-1:(MaxRow+1)
        if Vec(index)>fanyingBand1 && Vec(index)<fangyingBand2
            deltaH=deltaH+1
        end

    end
end
fanyingHeight=deltaH*HeightTheory/Pixl

%% ����Ԥ�ȴ��߶ȼ���
deltaH=0

if MaxVal<=ganzaoBand1
    deltaH=0
else    
    for index=321:-1:(MaxRow+1)
        if Vec(index)>ganzaoBand1 && Vec(index)<ganzaoBand2
            deltaH=deltaH+1
        end

    end
end
ganzaoHeight=deltaH*HeightTheory/Pixl

end

