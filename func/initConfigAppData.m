function [ ] =initConfigAppData( handles, configPath)
%   ��ȡconfig�ļ��е�Ĭ�����ã����õ����handles��appdata�С�
%   handles:����appdata�ľ�������ڵ���ģʽ��GUI���Դ���gcf
%   configPath:config.mat·��������

%   appdata��ز��� setappdata(H, NAME, VALUE)��VALUE = getappdata(H, NAME)��
%   VALUES = getappdata(H) returns all , rmappdata(H, NAME) , isappdata(H, NAME)

%% TODO 
% ��ȡconfig.mat�е�key-value,���õ�handles�е�appdata
% config.mat�еı���Ϊcell�ͣ�����Ϊconfig
data = load(configPath);
[m n] = size(data.config);
if n~=2
   error('config.mat must be key-value pair, two columns !') 
end
for index = 1:m
    if isappdata(handles, data.config{index})
%        msgbox(strcat(data.config{index},' is already exist in appdata, will be override!'));
    end
    setappdata(handles, data.config{index,1}, data.config{index,2});
end
% disp('set success')


end

