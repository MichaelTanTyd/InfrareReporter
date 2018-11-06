function [ retTime,retOriWetHeight,fanyingHeight,ganzaoHeight ] = singleBandCalu( Vec )
%SINGLEBANDCALU 此处显示有关此函数的摘要
%   此处显示详细说明

oriWetTempTheory=300.0 %原始及过湿带温度
fanyingBand1=600  %反应带温度1
fangyingBand2=1000 %反应带温度2
ganzaoBand1=300
ganzaoBand2=600
HeightTheory=800 %炉子高度
Pixl=320 % 高度像素

%% 计算原始及过湿带高度
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
%% 反应带高度计算
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

%% 干燥预热带高度计算
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

