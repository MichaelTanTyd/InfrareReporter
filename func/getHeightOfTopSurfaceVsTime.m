function [ TS_H_t ] = getHeightOfTopSurfaceVsTime( allData  )
%   �������еõ�����̮���߶���ʱ��t�ϵ��¶���ֵ
%   allData:ʱ��ͬ�����ȫ������Դ
%   TS_H_t:�������ݣ���һ��Ϊʱ��t,�ڶ���Ϊ����̮���߶�
%   ���Ը�����Ҫ������룬�������
FileName = 'ProceedData';
[data,T,S] = xlsread([FileName,'\��λtemp.xlsx']);
HeightOfTopSurface = data(:,3:end);
TimeData = []; %��ʱ������
for index = 3:size(S,1)
    TimeData(end+1,:) = TempretureTime2Matri(S{index,2});
end
HeightOfTopSurfaceVsTime = [TimeData,HeightOfTopSurface];
save([FileName, '\HeightOfTopSurfaceVsTime.mat'],'HeightOfTopSurfaceVsTime');

end

