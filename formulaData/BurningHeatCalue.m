function [ Qmin ] = BurningHeatCalue( timeVal,CO,CO2,SO2,feiqiliuliang )
%BURNINGHEATCALUE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Qco=CO./feiqiliuliang/22.4/4199
Qco2=CO2./feiqiliuliang/22.4/9112
Qso2=SO2./feiqiliuliang/22.4/4680
QminVal=Qco+Qco2+Qso2
Qmin=[timeVal QminVal]
end

