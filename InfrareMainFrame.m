function varargout = InfrareMainFrame(varargin)
% INFRAREMAINFRAME MATLAB code for InfrareMainFrame.fig
%      INFRAREMAINFRAME, by itself, creates a new INFRAREMAINFRAME or raises the existing
%      singleton*.
%
%      H = INFRAREMAINFRAME returns the handle to a new INFRAREMAINFRAME or the handle to
%      the existing singleton*.
%
%      INFRAREMAINFRAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFRAREMAINFRAME.M with the given input arguments
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

% Last Modified by GUIDE v2.5 23-Mar-2017 22:10:30

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
handles.chkbox_one2six_value=str2num(getappdata(gcf,'defaultDrawingOrder'))
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
% 文件打开图 % 跳出文件打开界面
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
% 保存在特定的文件夹下
[data,T,S] = xlsread(fulfile);
ImageData = data(:,4:end);
TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
%% 获取TemperatureVsTimeData
% TemperatureVsTime = [Time_Data,ImageData];
ImageData2 = ImageData;
% 将数据分为10份,Num=10
Num = 10;
alllength = size(ImageData2,2);
Seg = ceil(alllength/Num);
SgeM = 1:Seg:alllength;
ImageData3 = [];
for index = 1:size(ImageData2,1)
    ImageData3(index,1) = sum(ImageData2(index,SgeM(1):SgeM(2)))/(SgeM(2)-SgeM(1)+1);
    ImageData3(index,2) = sum(ImageData2(index,SgeM(2):SgeM(3)))/(SgeM(3)-SgeM(2)+1);
    ImageData3(index,3) = sum(ImageData2(index,SgeM(3):SgeM(4)))/(SgeM(4)-SgeM(3)+1);
    ImageData3(index,4) = sum(ImageData2(index,SgeM(4):SgeM(5)))/(SgeM(5)-SgeM(4)+1);
    ImageData3(index,5) = sum(ImageData2(index,SgeM(5):SgeM(6)))/(SgeM(6)-SgeM(5)+1);
    ImageData3(index,6) = sum(ImageData2(index,SgeM(6):SgeM(7)))/(SgeM(7)-SgeM(6)+1);
end
TemperatureVsTime = [Time_Data,ImageData3];
% fid = fopen('TemperatureVsTimeData.mat','wt');
% fprintf(fid,'%g\n',TemperatureVsTime);
% fclose(fid);
save ('TemperatureVsTimeData.mat','TemperatureVsTime');
disp('……')
disp('完成图像数据处理')



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
drawTemperatureVsTime(handle)
% [M, N] = size(allData); % M为列坐标，N为横坐标
% for index = 1:M
%     plot(allData(index,4:end)); hold on; grid on;
% end
% legendTxt = num2str(allData(:,1));
% legend(legendTxt,0)
% xlabel('位置值 Pix ');
% ylabel('温度值 ℃');
% title('不同时间段的位置-温度关系图')

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
handles.chkbox_one2six_value(2)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_third.
function chkbx_third_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_third (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_third
% update绘图选项配置
handles.chkbox_one2six_value(3)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_fourth.
function chkbx_fourth_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_fourth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_fourth
% update绘图选项配置
handles.chkbox_one2six_value(4)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_five.
function chkbx_five_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_five (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_five
% update绘图选项配置
handles.chkbox_one2six_value(5)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

function chkbx_six_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_six (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_six
% update绘图选项配置
handles.chkbox_one2six_value(6)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in btn_draw.
function btn_draw_Callback(hObject, eventdata, handles)
% hObject    handle to btn_draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.chkbox_one2six_value表示绘图配置，参数表示第一到第六类图是否绘制（0,1）
%% TODO 绘图函数
% close all
disp 按照要求绘制如下图形
ImageSelect = handles.chkbox_one2six_value;
% FigureNum = sum(ImageSelect);
if ImageSelect(1) == 1
    figure
    drawTemperatureVsTime,grid on
end
if ImageSelect(2) == 1
    figure
    drawtHeightOfLRAVsTime,grid on % 燃料层迁移趋势图
end
if ImageSelect(3) == 1
    figure
    drawtHeightOfTopSurfaceVsTime ,grid on% 上表面料位变化图
end
if ImageSelect(4) == 1
    figure
    drawtTemperatureGradient,grid on
end
if ImageSelect(5) == 1
    figure
    drawtTemperatureRrend,grid on
end
if ImageSelect(6) == 1
    figure
    drawPressureVsTime,grid on
end







% --- Executes on button press in chkbx_select_all.
function chkbx_select_all_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_select_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_select_all

% --- Executes on button press in chkbx_six.
if get(hObject,'Value')
    handles.chkbox_one2six_value = [1 1 1 1 1 1]
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
[handle , config]=ParamterConfiguration('InfrareMainFrame',handles.figure1)



% --- Executes on button press in gongshi1.
function gongshi1_Callback(hObject, eventdata, handles)
% hObject    handle to gongshi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'匀矿','烧结粉','蛇纹石','白云石','石灰石','生石灰','焦粉','返矿'};
dlg_title = '试验配料比';
num_lines = 1;
defAns = {'63.54', '4.68', '0.42', '2.71', '2.36', '3.90', '3.67','18.72'};
% answer = inputdlg(prompt,dlg_title,num_lines,defAns,options)
shiyanpeibi = inputdlg(prompt,dlg_title,num_lines,defAns);
% --- Executes on button press in gongshi2.
function gongshi2_Callback(hObject, eventdata, handles)
% hObject    handle to gongshi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'料层厚度（mm）','福底料（kg）','目标水分（%）','测定水分（%）','湿料装入量（kg）','干料装入量（kg）','湿装料密度（t/m^3）','干装料密度（t/m^3）','混合料平均粒度（mm）'};
dlg_title = '装料参数';
num_lines = 1;
defAns = {'750', '2.00', '7.20', '7.02', '93.22','86.68','1.73','1.61','2.73'};
zhuangliaocanshu = inputdlg(prompt,dlg_title,num_lines,defAns);

% --- Executes on button press in gongshi3.
function gongshi3_Callback(hObject, eventdata, handles)
% hObject    handle to gongshi3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'点火前风量（m^3/min）','点火时间（Sec）','点火温度（℃）','点火负压（Pa）','烧结负压（Pa）','冷却负压（Pa）','废气最高温度（℃）','烧结时间（Sec）','废气流量（m^3/min）','透气性','收缩量（mm）'};
dlg_title = '烧结过程参数';
num_lines = 1;
defAns = {'0.00', '120.00', '967.00', '-8830.00', '-14710.00','-7840.00','559.50','1820.00','0.00','-0.01','132'};
shaojieguochengcanshu = inputdlg(prompt,dlg_title,num_lines,defAns);

% --- Executes on button press in gongshijieguo4.
function gongshijieguo4_Callback(hObject, eventdata, handles)
% hObject    handle to gongshijieguo4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'排矿量（kg）','成品量（kg）','垂直烧结速度（mm/min）','烧结率（%）','锅成品率（%）','返矿率(%)','成品率（%）','生产率（t/m^2*h）','燃料单耗（kg/t）','转鼓指数（%）','平衡系数B','烧结返矿M.S','B=1条件的成品率（%）','B=1条件的生产率（t/m^2*h）','B=1条件的燃料单耗（kg/t）'};
dlg_title = '烧结试验结果';
num_lines = 1;
defAns = {'76.20', '61.10', '24.73', '87.91', '70.49','17.42','80.18','1.55','52.06','55.00','0.93','22.57','78.71','1.52','53.04'};
shaojiejieguo = inputdlg(prompt,dlg_title,num_lines,defAns);
