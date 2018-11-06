function [ ranshaoxiaolv,ranshaoCO2 ] = BurningEffiCalu( timeVal,CO,CH4,CO2,glzrl,shs,CO2_percent,bys,fangyingBandH,lchd,feiqiliuliang )
%   计算燃烧效率，首先计算燃料燃烧产生的CO2，然后计算燃效率
%   timeVal:时刻 CO：CO浓度  CH4：CH4浓度  CO2：CO2浓度  glzrl:干料装入量 shs：石灰石配比
%   CO2_percent：CO2含量，手输 fangyingBandH：反应带厚度 lchd：料层厚度  feiqiliuliang：废气流量
ranshaoCO2Val=CO2-glzrl*(shs*CO2_percent+bys*CO2_percent)*1000/44*22.4/1000*fangyingBandH/lchd./feiqiliuliang %公式的问题
ranshaoCO2=[timeVal ranshaoCO2Val]
ranshaoxiaolvVal=ranshaoCO2Val./(CO+CH4+ranshaoCO2) 
ranshaoxiaolv=[timeVal ranshaoxiaolvVal]
end

