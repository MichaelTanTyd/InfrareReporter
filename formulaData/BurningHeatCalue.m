function [ Qmin ] = BurningHeatCalue( timeVal,CO,CO2,SO2,feiqiliuliang )
%BURNINGHEATCALUE 此处显示有关此函数的摘要
%   此处显示详细说明
Qco=CO./feiqiliuliang/22.4/4199
Qco2=CO2./feiqiliuliang/22.4/9112
Qso2=SO2./feiqiliuliang/22.4/4680
QminVal=Qco+Qco2+Qso2
Qmin=[timeVal QminVal]
end

