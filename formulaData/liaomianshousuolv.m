function [ shousuolv ] = liaomianshousuolv(timeVal, shousuoH,lchd,oriWetH,dryPreWarmH )
%   LIAOMIANSHOUSUOLV 此处显示有关此函数的摘要
%   此处显示详细说明
shousuolvVal=shousuoH./(lchd-oriWetH-dryPreWarmH)
shousuolv=[timeVal shousuolvVal]
end

