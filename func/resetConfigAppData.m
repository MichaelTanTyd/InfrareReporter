function [config] = resetConfigAppData( handles, configPath)
%   从handles的appdata中匹配config.mat文件中的key，获取key-value更新config.mat。
%   handles:保存有appdata的句柄，对于单身模式的GUI可以传入gcf
%   configPath:config.mat路径及名称
%   config:返回更新后的所有配置

%   appdata相关操作 setappdata(H, NAME, VALUE)，VALUE = getappdata(H, NAME)，
%   rmappdata(H, NAME) , isappdata(H, NAME)

%% TODO
% 遍历判断handles中是否含有config.mat中的key,包含则更新，否则维持key-value不变
% 覆盖保存configPath中的配置文件。

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
