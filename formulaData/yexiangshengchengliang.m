function [ yexiangliang ] = yexiangshengchengliang( timeVal,laserH,lchd,glzrl,jf,oriWetBand,dryPreWarmBand,jfsmd,jk,jksmd,tsssxs )
%   ����Һ��������=��V������-V�����������/1000
%   timeVal��ʱ��̶�,laserH�����������߶�,lchd���ϲ�߶�,glzrl������װ����,jf���������,
%   oriWetBand��ԭʼ����ʪ���߶�,dryPreWarmBand:����Ԥ�ȴ��߶�,jfsmd���������ܶ�,
%   jk���ȿ�Ʋ��,jksmd���ȿ����ܶ�,tsssxs����ˮ����ϵ��
Vtotal=pi*laserH.*(155*155+(155-0.01*laserH).^2+155*(155-0.01*laserH))/3

Vjf=glzrl*jf*(lchd-oriWetBand-dryPreWarmBand)/lchd/jfsmd*0.85

Vjyktsss=glzrl*jk*(lchd-oriWetBand-dryPreWarmBand)/lchd/jksmd/tsssxs

Vxiangbian=Vjf+Vjyktsss

yexiangTemp=(Vtotal-Vxiangbian)/1000

yexiangliang=[timeVal yexiangTemp]

end

