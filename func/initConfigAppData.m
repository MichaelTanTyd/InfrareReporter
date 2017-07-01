function [ ] =initConfigAppData( handles, configPath)
%   读取config文件中的默认配置，设置到句柄handles的appdata中。
%   handles:设置appdata的句柄，对于单身模式的GUI可以传入gcf
%   configPath:config.mat路径及名称

%   appdata相关操作 setappdata(H, NAME, VALUE)，VALUE = getappdata(H, NAME)，
%   VALUES = getappdata(H) returns all , rmappdata(H, NAME) , isappdata(H, NAME)

%% TODO 
% 获取config.mat中的key-value,设置到handles中的appdata
% config.mat中的变量为cell型，名称为config
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

