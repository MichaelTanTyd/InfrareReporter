function [ touqixing ] = touqixingzhishu( timeVal,Q,lchd,laserH,shaojiefuya,DP1_8 )
%   �����ϲ�͸����ָ��
%   timeVal:ʱ�� Q���������� lchd:�ϲ�߶�  laserH�������������� shaojiefuya���սḺѹ
%   DP1_8:1~8�㸺ѹ
%   touqixing:͸���Է��أ���һ��ʱ�䣬�ڶ�������߶�ʱ��͸���ԣ���������ʮ��Ϊ�����㸺ѹʱ��͸����
F=0.0706858
n=0.6
totalHeightTouQiXing=Q/F.*(0.001*(lchd-laserH)/shaojiefuya).^0.6 %��λת��Ϊm

eachH=0.1 %m
eachHeightTouQiXing=[]
[row col]=size(DP1_8)
for index=1:col
    eachHeightTouQiXing(:,end+1)=Q/F.*(eachH./DP1_8(:,index)).^n
end


touqixing=[timeVal totalHeightTouQiXing eachHeightTouQiXing]

end

