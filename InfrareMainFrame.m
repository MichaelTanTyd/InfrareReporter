function varargout = InfrareMainFrame(varargin)
% INFRAREMAINFRAME MATLAB code for InfrareMainFrame.fig
%      INFRAREMAINFRAME, by itself, creates a new INFRAREMAINFRAME or raises the existing
%      singleton*.
%
%      H = INFRAREMAINFRAME returns the handle to a new INFRAREMAINFRAME or
%      the handle
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

% Last Modified by GUIDE v2.5 01-Jul-2017 15:01:11

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
clc
handles.output = hObject;
% add all the sub path to workspace
addpath(genpath(pwd));
% change the logo of figure
warning off;
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('.\res\BYME_LOGO.jpg')); % 打包的时候有效即可
% set(gcf,'menu','figure');
%加载config.mat中的key-value到当前GUI中的appdata中
path=strcat(pwd,'\config\config.mat')
initConfigAppData(hObject,path)
% 从appdata中获取默认绘图选项配置
handles.chkbox_one2six_value = str2num(getappdata(gcf,'defaultDrawingOrder')); % 绘图选项
% Update handles structure
guidata(hObject, handles);

%　把文件Data里面的数据转存入ProceedData里,在启动的时候处理


% UIWAIT makes InfrareMainFrame wait for user response (see UIRESUME)
% uiwait(handles.figure1);%% uiresume 配对使用 UIWAIT


% --- Outputs from this function are returned to the command line.
function varargout = InfrareMainFrame_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%% 设置默认的绘图选项
set(handles.chkbx_first,'Value',handles.chkbox_one2six_value(1));
set(handles.chkbx_second,'Value',handles.chkbox_one2six_value(2));
set(handles.chkbx_third,'Value',handles.chkbox_one2six_value(3));
set(handles.chkbx_fourth,'Value',handles.chkbox_one2six_value(4));
set(handles.chkbx_five,'Value',handles.chkbox_one2six_value(5));
set(handles.chkbx_six,'Value',handles.chkbox_one2six_value(6));





% --- Executes on button press in btn_openfile.
function btn_openfile_Callback(hObject, eventdata, handles)
% hObject    handle to btn_openfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname, filterindex] = uigetfile( ...
    {'*.xlsx','EXCEL-files (*.xlsx)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Pick a file', ...
    'MultiSelect', 'on');
if iscell(filename) == 0
    return
end

NewFileName = 'ProceedData\'; % 把文件保存到新的文件夹中
%     NewFileName = 'Data\'; % 把文件保存到新的文件夹中
for index = 1:size(filename,2)
    m = filename{1,index};
    if size(strfind(m,'高度'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'料位temp.xlsx'])
    end
    
    if size(strfind(m,'温度'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'温度temp.xlsx'])
    end
    
    if size(strfind(m,'压差'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'压差temp.xlsx'])
    end
    
    
    if size(strfind(m,'气体'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'气体temp.xlsx'])
        
    end
    
    if size(strfind(m,'红外'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'图像temp.xlsx'])
        
    end
end


% --- Executes on button press in btn_generate_reporter.
function btn_generate_reporter_Callback(hObject, eventdata, handles)
% 生成报告
% hObject    handle to btn_generate_reporter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% the code below are used for test ,delete it future
% configData = getappdata(gcf);% get all the appdata of gcf
% setappdata(gcf,'defaultStep',2) % set 'defaultStep' to 2
% resetConfigAppData(gcf,'.\config\config.mat') % update config.mat
folder_name = uigetdir;
message = '保存相关信息，请等待……';
set(handles.edit1,'string',message);pause(0.5)
t = now;
foldername2 = datestr(t,'yyyymmddTHHMMSS');
folder = [folder_name,'\','试验Report_',foldername2];
mkdir(folder)
oldpathname = 'ProceedData\'; 

name = '\上表面料位变化图.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end

name = '\不同高度温暖变化图.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
name = '\温度变化等级图.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
name = '\温度变化趋势图.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
name = '\燃料层迁移趋势图.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
name = '\负压波动图.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
message = '保存成功，请查阅';
set(handles.edit1,'string',message);pause(0.5)

% --- Executes on button press in btn_temperature.
function btn_temperature_Callback(hObject, eventdata, handles)
% hObject    handle to btn_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in btn_height.
function btn_height_Callback(hObject, eventdata, handles)
% hObject    handle to btn_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 高度变化图

% --- Executes on button press in btn_shrinkage.
function btn_shrinkage_Callback(hObject, eventdata, handles)
% hObject    handle to btn_shrinkage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_ladder.
function btn_ladder_Callback(hObject, eventdata, handles)
% hObject    handle to btn_ladder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in chkbx_first.
function chkbx_first_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_first (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_first
% update绘图选项配置
handles.chkbox_one2six_value(1) = get(hObject,'Value');
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
log={'initial drawing';'begning drawing'};
ImageSelect = handles.chkbox_one2six_value;
NewFileName = 'ProceedData\'; % 把文件保存到新的文件夹中
% FigureNum = sum(ImageSelect);
if ImageSelect(1) == 1 % 不同高度温度变化图
    log{end+1}='不同高度温度变化图';
    message = '处理数据信息，请等待……';
    set(handles.edit1,'string',message);pause(0.5)
    
    getTemperatureVsTime;
    message = 'debug 1……';
    set(handles.edit1,'string',message);pause(0.5)
    figure('NumberTitle', 'off', 'Name', '不同高度温暖变化图');
    message = 'debug 2……';
    set(handles.edit1,'string',message);pause(0.5)
    drawTemperatureVsTime,grid on
    message = 'debug 3……';
    set(handles.edit1,'string',message);pause(0.5)
    frame = getframe(gcf);im = frame2im(frame);
    message = 'debug 4……';
    set(handles.edit1,'string',message);pause(0.5)
    imwrite(im,[NewFileName,'\不同高度温暖变化图.jpg'],'jpg');
    message = 'debug 5……';
    set(handles.edit1,'string',message);pause(0.5)
    
    message = '不同高度温暖变化图';
    set(handles.edit1,'string',message);
    
end

if ImageSelect(3) == 1 % 上表面料位变化图
    message = '处理数据信息，请等待……';
        log{end+1}='上表面料位变化图';
    set(handles.edit1,'string',message);pause(0.5)
    
    getHeightOfTopSurfaceVsTime;
    figure('NumberTitle', 'off', 'Name', '上表面料位变化图');
    drawtHeightOfTopSurfaceVsTime ,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\上表面料位变化图.jpg'],'jpg');
    
    
    message = '完成上表面料位变化图';
    set(handles.edit1,'string',message);
end

if ImageSelect(6) == 1  % 负压波动图
    message = '处理数据信息，请等待……';
    log{end+1}='负压波动图';
    set(handles.edit1,'string',message);pause(0.5)
    
    getPressureVsTime
    figure('NumberTitle', 'off', 'Name', '负压波动图');
    drawPressureVsTime,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\负压波动图.jpg'],'jpg');
    
    message = '完成负压波动图';
    set(handles.edit1,'string',message);
end

if ImageSelect(2) == 1  % 燃料层迁移趋势图
    message = '处理数据信息，请等待……';
    log{end+1}='燃料层迁移趋势图';
    set(handles.edit1,'string',message);pause(0.5)
    
    
    getHeightOfLRAVsTime
    figure('NumberTitle', 'off', 'Name', '燃料层迁移趋势图');
    drawtHeightOfLRAVsTime,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\燃料层迁移趋势图.jpg'],'jpg');
    
    message = '完成燃料层迁移趋势图';
    set(handles.edit1,'string',message);
    
end

if ImageSelect(4) == 1
    message = '处理数据信息，请等待……';
    log{end+1}='温度变化等级图';
    set(handles.edit1,'string',message);pause(0.5)
    
    getTemperatureGradient
    figure('NumberTitle', 'off', 'Name', '温度变化等级图');
    drawtTemperatureGradient,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\温度变化等级图.jpg'],'jpg');
    
    message = '完成上温度变化等级图';
    set(handles.edit1,'string',message);
end

if ImageSelect(5) == 1
    message = '处理数据信息，请等待……';
    set(handles.edit1,'string',message);pause(0.5)
    log{end+1}='温度变化趋势图';
    getTemperatureGradient
    figure('NumberTitle', 'off', 'Name', '温度变化趋势图');
    drawtTemperatureRrend,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\温度变化趋势图.jpg'],'jpg');
    
    message = '完成温度变化趋势图';
    set(handles.edit1,'string',message);
   log{end+1}='end drawing this time';

end
   save('D:\log','log');


% --- Executes on button press in chkbx_select_all.
function chkbx_select_all_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_select_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_select_all

% --- Executes on button press in chkbx_six.
if get(hObject,'Value')
    handles.chkbox_one2six_value = [1 1 1 1 1 1];
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
% [handle , config]=ParamterConfiguration('InfrareMainFrame',handles.figure1)
prompt = {'试验高度设置（mm）'};
dlg_title = '试验实际高度';
num_lines = 1;
defAns = {'800'};
RealHeight = inputdlg(prompt,dlg_title,num_lines,defAns);
if size(RealHeight,1) == 0
    RealHeight =defAns(1);
else
    RealHeight =RealHeight(1);
end
% RealHeight
save(['config', '\RealHeight.mat'],'RealHeight');


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


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = 'help\软件使用说明-20170702V1.pdf';%被选中的条目对应的字符串值
open(filename);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
