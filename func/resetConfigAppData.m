function [config] = resetConfigAppData( handles, configPath)
%   ��handles��appdata��ƥ��config.mat�ļ��е�key����ȡkey-value����config.mat��
%   handles:������appdata�ľ�������ڵ���ģʽ��GUI���Դ���gcf
%   configPath:config.mat·��������
%   config:���ظ��º����������

%   appdata��ز��� setappdata(H, NAME, VALUE)��VALUE = getappdata(H, NAME)��
%   rmappdata(H, NAME) , isappdata(H, NAME)

%% TODO
% �����ж�handles���Ƿ���config.mat�е�key,��������£�����ά��key-value����
% ���Ǳ���configPath�е������ļ���

data=load(configPath);
config=data.config;%copy the old config
[m n]=size(data.config);
if n~=2
   error('config.mat must be key-value pair, two columns !') 
end
for index=1:m
    if isappdata(handles, data.config{index,1})
        value = getappdata(handles, data.config{index,1});%get the value of handles
        config{index,2}=value;
    else
        msgbox(strcat(data.config{index,1} , ' is not in this appdata ,remain old value !'));
    end
end
save(configPath,'config');
disp('set success')
end
