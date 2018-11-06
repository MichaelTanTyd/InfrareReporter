function [ yexiangliang ] = yexiangshengchengliang( timeVal,laserH,lchd,glzrl,jf,oriWetBand,dryPreWarmBand,jfsmd,jk,jksmd,tsssxs )
%   计算液相生成量=（V总收缩-V无相变收缩）/1000
%   timeVal：时间刻度,laserH：激光收缩高度,lchd：料层高度,glzrl：干料装入量,jf：焦粉配比,
%   oriWetBand：原始及过湿带高度,dryPreWarmBand:干燥预热带高度,jfsmd：焦粉视密度,
%   jk：匀矿撇比,jksmd：匀矿视密度,tsssxs：脱水收缩系数
Vtotal=pi*laserH.*(155*155+(155-0.01*laserH).^2+155*(155-0.01*laserH))/3

Vjf=glzrl*jf*(lchd-oriWetBand-dryPreWarmBand)/lchd/jfsmd*0.85

Vjyktsss=glzrl*jk*(lchd-oriWetBand-dryPreWarmBand)/lchd/jksmd/tsssxs

Vxiangbian=Vjf+Vjyktsss

yexiangTemp=(Vtotal-Vxiangbian)/1000

yexiangliang=[timeVal yexiangTemp]

end

