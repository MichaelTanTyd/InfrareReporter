function varargout = InfrareMainFrame(varargin)
% INFRAREMAINFRAME MATLAB code for InfrareMainFrame.fig
%      INFRAREMAINFRAME, by itself, creates a new INFRAREMAINFRAME or raises the existing
%      singleton*.
%
%      H = INFRAREMAINFRAME returns the handle to a new INFRAREMAINFRAME or the handle to
%      the existing singleton*.
%
%      INFRAREMAINFRAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFRAREMAINFRAME.M with the given input arguments.
%
%      INFRAREMAINFRAME('Property','Value',...) creates a new INFRAREMAINFRAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InfrareMainFrame_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InfrareMainFrame_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InfrareMainFrame

% Last Modified by GUIDE v2.5 28-Feb-2017 22:27:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InfrareMainFrame_OpeningFcn, ...
                   'gui_OutputFcn',  @InfrareMainFrame_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before InfrareMainFrame is made visible.
function InfrareMainFrame_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InfrareMainFrame (see VARARGIN)

% Choose default command line output for InfrareMainFrame
handles.output = hObject;
% add all the sub path to workspace
addpath(genpath(pwd));
% change the logo of figure
warning off;
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('.\res\BYME_LOGO.jpg'));
set(gcf,'menu','figure');
%加载config.mat中的key-value到当前GUI中的appdata中
initConfigAppData(hObject,'.\config\config.mat')
% 从appdata中获取默认绘图选项配置
handles.chkbox_one2six_value=getappdata(gcf,'defaultDrawingOrder')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InfrareMainFrame wait for user response (see UIRESUME)
% uiwait(handles.figure1);%% uiresume 配对使用 UIWAIT


% --- Outputs from this function are returned to the command line.
function varargout = InfrareMainFrame_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output
%% 设置默认的绘图选项
set(handles.chkbx_first,'Value',handles.chkbox_one2six_value(1))
set(handles.chkbx_second,'Value',handles.chkbox_one2six_value(2))
set(handles.chkbx_third,'Value',handles.chkbox_one2six_value(3))
set(handles.chkbx_fourth,'Value',handles.chkbox_one2six_value(4))
set(handles.chkbx_five,'Value',handles.chkbox_one2six_value(5))
set(handles.chkbx_six,'Value',handles.chkbox_one2six_value(6))




% --- Executes on button press in btn_openfile.
function btn_openfile_Callback(hObject, eventdata, handles)
% hObject    handle to btn_openfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 文件打开图 %跳出文件打开界面
clear
[filename, pathname] = uigetfile( ...
{  '*.*',  'All Files (*.*)'}, ...
   'Pick a file');
% {'*.m;*.fig;*.mat;*.slx;*.mdl',...
%  'MATLAB Files (*.m,*.fig,*.mat,*.slx,*.mdl)';
%    '*.m',  'Code files (*.m)'; ...
%    '*.fig','Figures (*.fig)'; ...
%    '*.mat','MAT-files (*.mat)'; ...
%    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
%    '*.*',  'All Files (*.*)'}, ...
%    'Pick a file');

wh = which(filename);
if exist(filename, 'file') == 2
    fprintf('Opening in MATLAB Editor: %s\n', filename);
%     edit(filename);
elseif ~isempty(wh)
    fprintf('Opening in MATLAB Editor: %s\n', wh);
    edit(wh);
else
    warning('MATLAB:fileNotFound', ...
        'File was not found: %s', filename);
end

fulfile = [ pathname filename];
global allData
allData = xlsread(fulfile);

[M, N] = size(allData); % M为列坐标，N为横坐标
%% 温度变化和时间的关系
for index = 1:M
    plot(allData(index,4:end)); hold on; grid on;
end
legendTxt = num2str(allData(:,1));
legend(legendTxt,0)
xlabel('位置值 Pix ');
ylabel('温度值 ℃');
title('不同时间段的位置-温度关系图')


% --- Executes on button press in btn_generate_reporter.
function btn_generate_reporter_Callback(hObject, eventdata, handles)
% hObject    handle to btn_generate_reporter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% the code below are used for test ,delete it future
configData=getappdata(gcf)%get all the appdata of gcf
setappdata(gcf,'defaultStep',2) %set 'defaultStep' to 2
resetConfigAppData(gcf,'.\config\config.mat') % update config.mat

% --- Executes on button press in btn_temperature.
function btn_temperature_Callback(hObject, eventdata, handles)
% hObject    handle to btn_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global allData
method = questdlg('要清除上一幅图像吗?','提示','Yes','No','No');
switch lower(method)
    case 'yes'
        clear figure
    case 'no'
end
% 显示图像
[M, N] = size(allData); % M为列坐标，N为横坐标
for index = 1:M
    plot(allData(index,4:end)); hold on; grid on;
end
legendTxt = num2str(allData(:,1));
legend(legendTxt,0)
xlabel('位置值 Pix ');
ylabel('温度值 ℃');
title('不同时间段的位置-温度关系图')

% --- Executes on button press in btn_height.
function btn_height_Callback(hObject, eventdata, handles)
% hObject    handle to btn_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 高度变化图
global allData
method = questdlg('要清除上一幅图像吗?','提示','Yes','No','No');
switch lower(method)
    case 'yes'
        clear figure
    case 'no'
end
[M, N] = size(allData); % M为列坐标，N为横坐标
%% 时间高度关系
HigChangeData = [];
for index = 1:M
     [value, hight] = max(allData(index,4:end));
     HigChangeData(end+1,1) = allData(index,1);
     HigChangeData (end,2:3) = [value, hight]; 
end
for index = 1:M
    plot(HigChangeData(index,2),HigChangeData(index,3),'b.-');hold on
end
% legend(legendTxt,0)
xlabel('时间 ms');
ylabel('高度 Pix');
title([num2str(allData(1,1)) '时间高度关系图'])




% --- Executes on button press in btn_shrinkage.
function btn_shrinkage_Callback(hObject, eventdata, handles)
% hObject    handle to btn_shrinkage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global allData
method = questdlg('要清除上一幅图像吗?','提示','Yes','No','No');
switch lower(method)
    case 'yes'
        clear figure
    case 'no'
end

% --- Executes on button press in btn_ladder.
function btn_ladder_Callback(hObject, eventdata, handles)
% hObject    handle to btn_ladder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global allData
method = questdlg('要清除上一幅图像吗?','提示','Yes','No','No');
switch lower(method)
    case 'yes'
        clear figure
    case 'no'
end


% --- Executes on button press in chkbx_first.
function chkbx_first_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_first (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_first
% update绘图选项配置
handles.chkbox_one2six_value(1)=get(hObject,'Value')
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_second.
function chkbx_second_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_second (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_second
% update绘图选项配置
handles.chkbox_one2six_value(2)=get(hObject,'Value')
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_third.
function chkbx_third_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_third (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_third
% update绘图选项配置
handles.chkbox_one2six_value(3)=get(hObject,'Value')
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_fourth.
function chkbx_fourth_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_fourth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_fourth
% update绘图选项配置
handles.chkbox_one2six_value(4)=get(hObject,'Value')
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_five.
function chkbx_five_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_five (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_five
% update绘图选项配置
handles.chkbox_one2six_value(5)=get(hObject,'Value')
% Update handles structure
guidata(hObject, handles);

function chkbx_six_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_six (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_six
% update绘图选项配置
handles.chkbox_one2six_value(6)=get(hObject,'Value')
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in btn_draw.
function btn_draw_Callback(hObject, eventdata, handles)
% hObject    handle to btn_draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.chkbox_one2six_value表示绘图配置，参数表示第一到第六类图是否绘制（0,1）
%% TODO


% --- Executes on button press in chkbx_select_all.
function chkbx_select_all_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_select_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_select_all

% --- Executes on button press in chkbx_six.
if get(hObject,'Value')
handles.chkbox_one2six_value=[1 1 1 1 1 1]
set(handles.chkbx_first,'Value',handles.chkbox_one2six_value(1))
set(handles.chkbx_second,'Value',handles.chkbox_one2six_value(2))
set(handles.chkbx_third,'Value',handles.chkbox_one2six_value(3))
set(handles.chkbx_fourth,'Value',handles.chkbox_one2six_value(4))
set(handles.chkbx_five,'Value',handles.chkbox_one2six_value(5))
set(handles.chkbx_six,'Value',handles.chkbox_one2six_value(6))
end
% Update handles structure
guidata(hObject, handles);


% --------------------------------------------------------------------
function menu_config_Callback(hObject, eventdata, handles)
% hObject    handle to menu_config (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_config_modify_Callback(hObject, eventdata, handles)
% hObject    handle to menu_config_modify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=load('.\config\config.mat');
old_config=data.config;%copy the old config
[handle , config]=ParamterConfiguration(old_config)

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
