function [ Pre_H_t ] = getPressureVsTime( allData ,height )
%   �������еõ�ָ���߶�����height��ʱ��t�ϵ�ѹ����ֵ
%   allData:ʱ��ͬ�����ȫ������Դ
%   height:�߶����У�����Ϊ��������ʾ��Ҫ���ض��߶ȵ�ѹ��-ʱ������
%   Pre_H_t:�������ݣ���һ��Ϊʱ��t,�ڶ���Ϊheight(1)����Ӧ�߶ȵ�ѹ��-ʱ�����ݣ��Դ�����
%   ���Ը�����Ҫ������룬�������
% % % ��ѹvsTime
FileName = 'ProceedData';
[data,T,S] = xlsread([FileName,'\ѹ��temp.xlsx']);
Pressure = data(:,3:end);
TimeData = []; %��ʱ������
tic
for index = 3:size(S,1)
    TimeData(end+1,:) = TempretureTime2Matri(S{index,2});
end
toc
PressureVsTime = [TimeData,Pressure];
save([FileName, '\PressureVsTime.mat'],'PressureVsTime');


end