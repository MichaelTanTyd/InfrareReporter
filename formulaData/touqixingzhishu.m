function [ touqixing ] = touqixingzhishu( timeVal,Q,lchd,laserH,shaojiefuya,DP1_8 )
%   计算料层透气性指数
%   timeVal:时刻 Q：废气流量 lchd:料层高度  laserH：激光测距仪数据 shaojiefuya：烧结负压
%   DP1_8:1~8点负压
%   touqixing:透气性返回，第一列时间，第二列总体高度时变透气性，第三到第十列为各个点负压时变透气性
F=0.0706858
n=0.6
totalHeightTouQiXing=Q/F.*(0.001*(lchd-laserH)/shaojiefuya).^0.6 %单位转换为m

eachH=0.1 %m
eachHeightTouQiXing=[]
[row col]=size(DP1_8)
for index=1:col
    eachHeightTouQiXing(:,end+1)=Q/F.*(eachH./DP1_8(:,index)).^n
end


touqixing=[timeVal totalHeightTouQiXing eachHeightTouQiXing]

end

