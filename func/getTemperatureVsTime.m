function [ Temp_H_t ] = getTemperatureVsTime( allData ,height )
%   �������еõ�ָ���߶�����height��ʱ��t�ϵ��¶���ֵ
%   allData:ʱ��ͬ�����ȫ������Դ
%   height:�߶����У�����Ϊ��������ʾ��Ҫ���ض��߶ȵ��¶�-ʱ������
%   Temp_H_t:�������ݣ���һ��Ϊʱ��t,�ڶ���Ϊheight(1)����Ӧ�߶ȵ��¶�-ʱ�����ݣ��Դ�����
%   ���Ը�����Ҫ������룬�������

% disp('getTemperatureVsTime')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % �¶�vsʱ��
FileName = 'ProceedData';
[data,T,S] = xlsread([FileName,'\�¶�temp.xlsx']);
TempretureData = data(:,3:end);
TimeData = []; %��ʱ������
for index = 3:size(S,1)
    TimeData(end+1,:) = TempretureTime2Matri(S{index,2});
end
TemperatureVsTimeData = [TimeData,TempretureData];
save([FileName, '\TemperatureVsTimeData.mat'],'TemperatureVsTimeData');
end

