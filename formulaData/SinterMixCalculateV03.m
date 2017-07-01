%2017-6-21
%处理烧结工艺参数及计算公式
%V0.3
%各项公式计算
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1
%粘结效率计算，依据
%3.8粘结效率：η=(成品烧结矿平均粒度/混合料平均粒度)^3*0.7405
%             0.7405——堆积系数(空间利用率)
%%%%%
%混合料平均粒度M.S(mm)   WDWO_17_zlcs_hhlpjld-------------mixAPMS
%成品烧结矿平均粒度(mm)  WDWO_27_sjsyjg_sjkMS-------------finishSinterAPMS
%0.7405——堆积系数(空间利用率)
%bonding efficiency ---------粘结效率：bondingEff
mixAPMS = 2.73;                                     %混合料平均粒度M.S(mm)   WDWO_17_zlcs_hhlpjld  #filled with chen
finishSinterAPMS = 1;                            %成品烧结矿平均粒度(mm)  WDWO_27_sjsyjg_sjkMS
stackCoef = 0.7405;                              %堆积系数
%
bondingEff = (mixAPMS/finishSinterAPMS)^3*stackCoef;
%保存数据
save('粘结效率.txt','bondingEff','-ascii');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2
%料面收缩率，依据
%料面收缩率：S=收缩高度/（料层高度-原始带及过湿带高度-干燥预热带高度）*100%
%保存时去掉了100%，均以小数表示
%收缩高度(mm)  -------------ContractHeight
%料层高度(mm)  -------------bedHeight
%原始带及过湿带高度(mm)------origWetHeight
%干燥预热带高度(mm)---------drypretropHeight
%%%%%
ContractHeight = 1;                              %收缩高度(mm)
bedHeight = 1;                                   %料层高度(mm)
origWetHeight = 1;                               %原始带及过湿带高度(mm)
drypretropHeight = 1;                            %干燥预热带高度(mm)
%
S = ContractHeight/(bedHeight-origWetHeight-drypretropHeight);
%保存数据
save('料面收缩率.txt','S','-ascii');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3
%料层透气性指数，依据
%料层透气性指数 JPU= Q/F*(h/deltaP)^n;
%其中Q为废气流量，m^3/min；废气流量(m3/min)：WDWO_108_1#PJLL
%F为烧结杯面积，取面积0.0706858m^2(直径300mm)；
%h为料层高度，取动态测量值，单位m；
%Δp负压，单位Pa；
%n取0.6。
%
%%%%%
Q = 1;                                           %其中Q为废气流量，m^3/min；废气流量(m3/min)WDWO_108_1#PJLL
F = 0.0706858;                                   %F为烧结杯面积，取面积0.0706858m^2(直径300mm)；
h = bedHeight;                                   %同上料层高度(mm)-----bedHeight
deltaP = 1;                                      %Δp负压，单位Pa；
n = 0.6;
%
JPU= Q/F*(h/deltaP)^n;
%保存数据
save('料层透气性指数.txt','JPU','-ascii');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4
%燃烧效率，依据
%燃烧效率
% η=燃料燃烧产生CO2/(CO+CH4+燃料燃烧产生CO2)*100%
%其中CO、CH4可直接取烟气分析仪数据，单位统一为%；
%燃料燃烧产生CO2=烟气CO2浓度-干料装入量*（石灰石配比*CO2含量+白云石配比*CO2含量）*1000/44*22.4/1000*（反应带厚度/料层高度）/废气流量*100
%
%burningEff--燃烧效率
%Vco--------CO取烟气分析仪数据
%Vch4-------CH4取烟气分析仪数据
%Vco2-------燃料燃烧产生CO2
%
%CONco2-----烟气CO2浓度
%dryLoad-----干料装入量(kg)WDWO_14_zlcs_glzrl
%LimMatch----石灰石配比
%CO2V--------CO2含量
%dolrat------白云石配比
%reatThick---反应带厚度
%bedHeight---料层高度-----同上
%Q-----------废气流量(m3/min)WDWO_108_1#PJLL
%%%%%
CONco2 = 1;                                      %CONco2-----烟气CO2浓度
dryLoad = 86.68;                                     %dryLoad-----干料装入量(kg)WDWO_14_zlcs_glzrl #filled with chen
LimMatch = 2.36;                                    %LimMatch----石灰石配比 #filled with chen
CO2V = 1;                                        %CO2V--------CO2含量
dolrat = 2.71;                                      %dolrat------白云石配比 #filled with chen
reatThick = 1;                                   %reatThick---反应带厚度
Vco = 1;                                         %Vco--------CO取烟气分析仪数据
Vch4 = 1;                                        %Vch4-------CH4取烟气分析仪数据
%
Vco2 = CONco2 - dryLoad*(LimMatch*CONco2+dolrat*CONco2)*1000/44*22.4/1000*(reatThick/bedHeight)/Q*100;
%
burningEff = Vco2/(Vco+Vch4+Vco2);
%保存数据
save('燃烧效率.txt','burningEff','-ascii');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5
%燃烧放热量(以分钟为单位平均)
%Qmin=Qco+Qco2+Qso2              kJ/min
%其中：Qco=烟气CO浓度*废气流量/22.4*4199，其中C转换为1kgCO放热为4199kJ/kg；
%  Qco2=燃料燃烧CO2浓度*废气流量/22.4*9112，其中C转换为1kgCO2放热为9112kJ/kg；
%  Qso2=烟气SO2浓度*废气流量/22.4*4680，其中S转换为1kgSO2放热为4680kJ/kg。
%
%CONco-----烟气CO浓度
%Q-----------废气流量(m3/min)WDWO_108_1#PJLL
%cburnCONco2-----燃料燃烧CO2浓度
%CONso2-----烟气SO2浓度
%%%%%
CONco = 1;                                       %CONco-----烟气CO浓度
cburnCONco2 = 1;                                 %cburnCONco2-----燃料燃烧CO2浓度
CONso2 = 1;                                      %CONso2-----烟气SO2浓度
%
Qco = CONco*Q/22.4*4199;
Qco2 = cburnCONco2*Q/22.4*9112;
Qso2 = CONso2*Q/22.4*4680;
%
Qmin = Qco+Qco2+Qso2;
%保存数据
save('燃烧放热量.txt','Qmin','-ascii');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%6
%混合料原始孔隙率---mixpro
%ε=(1-干装料密度/混合料真密度)*100%
%gzlmd-----------------干装料密度(t/m3) WDWO_16_zlcs_gzlmd
%mixmd-----------------混合料真密度
%%%%%
gzlmd = 1.61;                                       %gzlmd-----干装料密度(t/m3) WDWO_16_zlcs_gzlmd #filled with chen
mixmd = 1;                                       %mixmd-----混合料真密度  
mixpro = 1-gzlmd/mixmd;
%保存数据
save('混合料原始孔隙率.txt','mixpro','-ascii');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%7
%sjkbgmd---------------------烧结矿表观密度
%ρ烧结矿=烧结矿干矿量/烧结矿体积                   kg/m3
%sinerore-----------------烧结矿干矿量
%vsinter-----------------烧结矿体积
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sinerore = 1;                                    %sinerore-----烧结矿干矿量
vsinter = 1;                                     %vsinter------烧结矿体积
%
sjkbgmd = sinerore/vsinter;
%保存数据
save('烧结矿表观密度.txt','sjkbgmd','-ascii');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%8
%L---------------------液相生成量
%液相量 V液n=(V总收缩-V无相变收缩)/1000                   每分钟计算一次，ml
% V总收缩=3.1415926*h收缩*（155^2+（155-h收缩/100）^2+155*（155-h收缩/100））/3
%V无相变收缩=V焦粉燃烧收缩+V混匀矿脱水收缩+V熔剂脱碳酸盐收缩
%V焦粉燃烧收缩=干料量*焦粉配比*（h装-h原始过湿带-h干燥预热带）/h装/焦粉视密度*0.85
%V混匀矿脱水收缩=干料量*混匀矿配比*（h装-h原始过湿带-h干燥预热带）/h装/混匀矿视密度*脱水收缩系数
%V熔剂脱碳酸盐收缩=干料量*熔剂配比*（h装-h原始过湿带-h干燥预热带）/h装/熔剂视密度*熔剂脱碳酸盐收缩系数
%液相生成量 L=V液n/(V反应带+V熔融带)*100%
%gll---------干料量？---------dryLoad-----干料装入量(kg)WDWO_14_zlcs_glzrl??????????????????
%jfpb--------------------------------------焦粉配比
%jfsmd-------------------------------------焦粉视密度

%hykpb-------------------------------------混匀矿配比
%hyksmd------------------------------------混匀矿视密度
%tsssxs------------------------------------脱水收缩系数

%rjpb---------------------------------------熔剂配比
%rjsmd--------------------------------------熔剂视密度
%rjttsyssxs---------------------------------熔剂脱碳酸盐收缩系数

%Vf-------------------V反应带---------------
%Vr-------------------V熔融带---------------

%hs-------------------h收缩-----------------

%hz-------------------h装-------------------装料高度；
%hy-------------------h原始过湿带-----------原始带及过湿带高度；
%hg-------------------h干燥预热带-----------干燥预热带高度；
%hf-------------------h反应带---------------反应带高度；
%hr-------------------h熔融带---------------熔融带高度；
%高度单位取mm；
%%%%%
hz = 1;                                          %装料高度----------是否与公式2的料层高度(mm)----bedHeight一致？,若一致，则此次给bedHeight值   
hy = origWetHeight;                              %原始料及过湿带高度------是否与公式2的原始带及过湿带高度(mm)------origWetHeight？若一致，则此次给origWetHeight值 
hg = drypretropHeight;                           %干燥预热带高度----------与公式2的干燥预热带高度(mm)---------drypretropHeight;
hf = 1;                                          %反应带高度；
hr = 1;                                          %熔融带高度；
%
hs = 1;                                          %h收缩---------------文中没有说明
Vz = 3.1415926*hs*(155^2+(155-hs/100)^2+155*(155-hs/100))/3;
%
gll = dryLoad;                                   %干料量---------是否与公式4的dryLoad-----干料装入量(kg)WDWO_14_zlcs_glzrl的值是否一致？ 
jfpb = 1;                                        %焦粉配比
jfsmd = 1;                                       %焦粉视密度
Vjs = gll*jfpb*(hz-hy-hg)/hz/jfsmd*0.85;

hykpb = 1;                                       %混匀矿配比
hyksmd = 1;                                      %混匀矿视密度
tsssxs = 1;                                      %脱水收缩系数
Vhs = gll*hykpb*(hz-hy-hg)/hz/hyksmd*tsssxs;

rjpb = 1;                                        %熔剂配比
rjsmd = 1;                                       %熔剂视密度
rjttsyssxs = 1;                                  %熔剂脱碳酸盐收缩系数
Vrs = gll*rjpb*(hz-hy-hg)/hz/rjsmd*rjttsyssxs;

Vw = Vjs+Vhs+Vrs;
%
Vyn = (Vz-Vw)/1000;

%
Vf = 1;                                          %V反应带---------------文中没有说明
Vr = 1;                                          %V熔融带---------------文中没有说明
%
L = Vyn/(Vf+Vr);

%保存数据
save('液相生成量.txt','L','-ascii');
