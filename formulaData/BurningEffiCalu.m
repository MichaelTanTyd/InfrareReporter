function [ ranshaoxiaolv,ranshaoCO2 ] = BurningEffiCalu( timeVal,CO,CH4,CO2,glzrl,shs,CO2_percent,bys,fangyingBandH,lchd,feiqiliuliang )
%   ����ȼ��Ч�ʣ����ȼ���ȼ��ȼ�ղ�����CO2��Ȼ�����ȼЧ��
%   timeVal:ʱ�� CO��COŨ��  CH4��CH4Ũ��  CO2��CO2Ũ��  glzrl:����װ���� shs��ʯ��ʯ���
%   CO2_percent��CO2���������� fangyingBandH����Ӧ����� lchd���ϲ���  feiqiliuliang����������
ranshaoCO2Val=CO2-glzrl*(shs*CO2_percent+bys*CO2_percent)*1000/44*22.4/1000*fangyingBandH/lchd./feiqiliuliang %��ʽ������
ranshaoCO2=[timeVal ranshaoCO2Val]
ranshaoxiaolvVal=ranshaoCO2Val./(CO+CH4+ranshaoCO2) 
ranshaoxiaolv=[timeVal ranshaoxiaolvVal]
end

