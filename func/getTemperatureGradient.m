function [ TG ] = getTemperatureGradient(allData , timeVector)
%   �������еõ�ʱ������timeVector���ظ߶ȷ�����¶��ݶ�
%   allData:ʱ��ͬ�����ȫ������Դ
%   timeVector:ʱ�����У�����Ϊ��������Ӧ��ͬʱ��
%   TG:����ʱ������timeVector��ÿһʱ���ظ߶ȷ�����¶��ݶ�
%   ���Ը�����Ҫ������룬�������

% disp('getTemperatureGradient')
% load('ImageDataVsTime.mat') % ͼ���ʱ������
% load('HeightOfTopSurfaceVsTime.mat') % �߶Ⱥ�ʱ������
FileName = 'ProceedData';
getHeightOfLRAVsTime % ��ȡͼ����Ϣ
load([FileName,'\ImageDataVsTime.mat']);

getHeightOfTopSurfaceVsTime; % ��ȡ�߶���Ϣ
load([FileName,'\HeightOfTopSurfaceVsTime.mat']);


Time1 = ImageDataVsTime(:,1:6);
TimeDouble1 = datenum(num2str(Time1),'yyyy mm dd HH MM SS'); % ʱ��ת����double���ͱ��ڱȽ�
Time2 = HeightOfTopSurfaceVsTime(:,1:6);
TimeDouble2 = datenum(num2str(Time2),'yyyy mm dd HH MM SS');

OneMiniut = 1.1574*10^(-5); 

Error = 10^(-18); % �ж������Ƿ����

StartTime = max(TimeDouble1(1),TimeDouble2(1));
EndTime = min(TimeDouble1(end),TimeDouble2(end));

if EndTime < StartTime
    error('����ͼ�����ݺ͸߶������޷�ͬ�����������������Ƿ�׼ȷ')
end

%%%% ��ͼ�����ݽ��н�ȡ
[t1,t2] = CutDataWithTime(TimeDouble1,StartTime,EndTime,Error);
ImageData = ImageDataVsTime(t1:t2,7:end);
Time1 = Time1(t1:t2,:);
TimeDouble1 = TimeDouble1(t1:t2,:);
%%%% �Ը߶����ݽ��н�ȡ
[h1,h2] = CutDataWithTime(TimeDouble2,StartTime,EndTime,Error);
HeightOfTopSurface = HeightOfTopSurfaceVsTime(h1:h2,7:end);
Time2 = Time2(h1:h2,:);
TimeDouble2 = TimeDouble2(h1:h2,:);

%%% ֱ�Ӳ��������Ϣ���ɣ���ͼ����Ϣ���������Ϣ
SeriseNum = 1;% ��ʾÿ���1s��������
[newTimeDouble1,newImageData] = GetSequenceData(TimeDouble1,ImageData,OneMiniut,SeriseNum);
[newTimeDouble2,newHeightOfTopSurface] = GetSequenceData(TimeDouble2,HeightOfTopSurface,OneMiniut,SeriseNum);
Time_Data1 = TempretureTime2Matri(newTimeDouble1);
Time_Data2 = TempretureTime2Matri(newTimeDouble2);
Num = min([size(Time_Data1,1) ,size(Time_Data2,1) ]); % �򵥺ϲ�
ImageDataHeightVsTime = [Time_Data1(1:Num,:),newImageData(1:Num,:),newHeightOfTopSurface(1:Num,1)];
save([FileName, '\ImageDataHeightVsTime.mat'],'ImageDataHeightVsTime');

end