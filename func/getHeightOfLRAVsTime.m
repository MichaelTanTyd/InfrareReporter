function [ ] = getHeightOfLRAVsTime(handle,LRA_H_t,opt )
%   ���Ƴ����߶���ʱ��t�ϵı仯ͼ
%   handle:����ͼ�εľ��
%   LRA_H_t:�����߶�-ʱ������
%   LRA_H_t���һ��Ϊ�����ĸ߶�λ�ã���Ҫת��Ϊmm�ĵ�λ��pixelToHeight����ʵ��
%   opt:��ͼ��ѡ����������plot�е�'r*',Ϊ�ַ���
%   ���Ը�����Ҫ������룬����������ӿ����Ƿ���Ҫ����isHoldOn?
% % �¶�vsʱ��
FileName = 'ProceedData';
[data,T,S] = xlsread([FileName,'\ͼ��temp.xlsx']);
ImageDataVsTime  = ProceeImagData(data,T,S); %��һ����ʱ��
save([FileName, '\ImageDataVsTime.mat'], 'ImageDataVsTime')