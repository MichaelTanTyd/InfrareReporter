function [ shousuolv ] = liaomianshousuolv(timeVal, shousuoH,lchd,oriWetH,dryPreWarmH )
%   LIAOMIANSHOUSUOLV �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
shousuolvVal=shousuoH./(lchd-oriWetH-dryPreWarmH)
shousuolv=[timeVal shousuolvVal]
end

