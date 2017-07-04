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
javaFrame.setFigureIcon(javax.swing.ImageIcon('.\res\BYME_LOGO.jpg')); % �����ʱ����Ч����
% set(gcf,'menu','figure');
%����config.mat�е�key-value����ǰGUI�е�appdata��
path=strcat(pwd,'\config\config.mat')
initConfigAppData(hObject,path)
% ��appdata�л�ȡĬ�ϻ�ͼѡ������
handles.chkbox_one2six_value = str2num(getappdata(gcf,'defaultDrawingOrder')); % ��ͼѡ��
% Update handles structure
guidata(hObject, handles);

%�����ļ�Data���������ת����ProceedData��,��������ʱ����


% UIWAIT makes InfrareMainFrame wait for user response (see UIRESUME)
% uiwait(handles.figure1);%% uiresume ���ʹ�� UIWAIT


% --- Outputs from this function are returned to the command line.
function varargout = InfrareMainFrame_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%% ����Ĭ�ϵĻ�ͼѡ��
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

NewFileName = 'ProceedData\'; % ���ļ����浽�µ��ļ�����
%     NewFileName = 'Data\'; % ���ļ����浽�µ��ļ�����
for index = 1:size(filename,2)
    m = filename{1,index};
    if size(strfind(m,'�߶�'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'��λtemp.xlsx'])
    end
    
    if size(strfind(m,'�¶�'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'�¶�temp.xlsx'])
    end
    
    if size(strfind(m,'ѹ��'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'ѹ��temp.xlsx'])
    end
    
    
    if size(strfind(m,'����'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'����temp.xlsx'])
        
    end
    
    if size(strfind(m,'����'),1) ~= 0
        copyfile([pathname,m],[NewFileName,'ͼ��temp.xlsx'])
        
    end
end


% --- Executes on button press in btn_generate_reporter.
function btn_generate_reporter_Callback(hObject, eventdata, handles)
% ���ɱ���
% hObject    handle to btn_generate_reporter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% the code below are used for test ,delete it future
% configData = getappdata(gcf);% get all the appdata of gcf
% setappdata(gcf,'defaultStep',2) % set 'defaultStep' to 2
% resetConfigAppData(gcf,'.\config\config.mat') % update config.mat
folder_name = uigetdir;
message = '���������Ϣ����ȴ�����';
set(handles.edit1,'string',message);pause(0.5)
t = now;
foldername2 = datestr(t,'yyyymmddTHHMMSS');
folder = [folder_name,'\','����Report_',foldername2];
mkdir(folder)
oldpathname = 'ProceedData\'; 

name = '\�ϱ�����λ�仯ͼ.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end

name = '\��ͬ�߶���ů�仯ͼ.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
name = '\�¶ȱ仯�ȼ�ͼ.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
name = '\�¶ȱ仯����ͼ.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
name = '\ȼ�ϲ�Ǩ������ͼ.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
name = '\��ѹ����ͼ.jpg';
if exist([oldpathname,name]) ~= 0
    copyfile([oldpathname,name],[folder,name])
end
message = '����ɹ��������';
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
% �߶ȱ仯ͼ

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
% update��ͼѡ������
handles.chkbox_one2six_value(1) = get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_second.
function chkbx_second_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_second (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_second
% update��ͼѡ������
handles.chkbox_one2six_value(2)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_third.
function chkbx_third_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_third (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_third
% update��ͼѡ������
handles.chkbox_one2six_value(3)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_fourth.
function chkbx_fourth_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_fourth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_fourth
% update��ͼѡ������
handles.chkbox_one2six_value(4)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in chkbx_five.
function chkbx_five_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_five (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_five
% update��ͼѡ������
handles.chkbox_one2six_value(5)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

function chkbx_six_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx_six (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx_six
% update��ͼѡ������
handles.chkbox_one2six_value(6)=get(hObject,'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in btn_draw.
function btn_draw_Callback(hObject, eventdata, handles)
% hObject    handle to btn_draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.chkbox_one2six_value��ʾ��ͼ���ã�������ʾ��һ��������ͼ�Ƿ���ƣ�0,1��
%% TODO ��ͼ����
% close all
disp ����Ҫ���������ͼ��
log={'initial drawing';'begning drawing'};
ImageSelect = handles.chkbox_one2six_value;
NewFileName = 'ProceedData\'; % ���ļ����浽�µ��ļ�����
% FigureNum = sum(ImageSelect);
if ImageSelect(1) == 1 % ��ͬ�߶��¶ȱ仯ͼ
    log{end+1}='��ͬ�߶��¶ȱ仯ͼ';
    message = '����������Ϣ����ȴ�����';
    set(handles.edit1,'string',message);pause(0.5)
    
    getTemperatureVsTime;
    message = 'debug 1����';
    set(handles.edit1,'string',message);pause(0.5)
    figure('NumberTitle', 'off', 'Name', '��ͬ�߶���ů�仯ͼ');
    message = 'debug 2����';
    set(handles.edit1,'string',message);pause(0.5)
    drawTemperatureVsTime,grid on
    message = 'debug 3����';
    set(handles.edit1,'string',message);pause(0.5)
    frame = getframe(gcf);im = frame2im(frame);
    message = 'debug 4����';
    set(handles.edit1,'string',message);pause(0.5)
    imwrite(im,[NewFileName,'\��ͬ�߶���ů�仯ͼ.jpg'],'jpg');
    message = 'debug 5����';
    set(handles.edit1,'string',message);pause(0.5)
    
    message = '��ͬ�߶���ů�仯ͼ';
    set(handles.edit1,'string',message);
    
end

if ImageSelect(3) == 1 % �ϱ�����λ�仯ͼ
    message = '����������Ϣ����ȴ�����';
        log{end+1}='�ϱ�����λ�仯ͼ';
    set(handles.edit1,'string',message);pause(0.5)
    
    getHeightOfTopSurfaceVsTime;
    figure('NumberTitle', 'off', 'Name', '�ϱ�����λ�仯ͼ');
    drawtHeightOfTopSurfaceVsTime ,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\�ϱ�����λ�仯ͼ.jpg'],'jpg');
    
    
    message = '����ϱ�����λ�仯ͼ';
    set(handles.edit1,'string',message);
end

if ImageSelect(6) == 1  % ��ѹ����ͼ
    message = '����������Ϣ����ȴ�����';
    log{end+1}='��ѹ����ͼ';
    set(handles.edit1,'string',message);pause(0.5)
    
    getPressureVsTime
    figure('NumberTitle', 'off', 'Name', '��ѹ����ͼ');
    drawPressureVsTime,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\��ѹ����ͼ.jpg'],'jpg');
    
    message = '��ɸ�ѹ����ͼ';
    set(handles.edit1,'string',message);
end

if ImageSelect(2) == 1  % ȼ�ϲ�Ǩ������ͼ
    message = '����������Ϣ����ȴ�����';
    log{end+1}='ȼ�ϲ�Ǩ������ͼ';
    set(handles.edit1,'string',message);pause(0.5)
    
    
    getHeightOfLRAVsTime
    figure('NumberTitle', 'off', 'Name', 'ȼ�ϲ�Ǩ������ͼ');
    drawtHeightOfLRAVsTime,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\ȼ�ϲ�Ǩ������ͼ.jpg'],'jpg');
    
    message = '���ȼ�ϲ�Ǩ������ͼ';
    set(handles.edit1,'string',message);
    
end

if ImageSelect(4) == 1
    message = '����������Ϣ����ȴ�����';
    log{end+1}='�¶ȱ仯�ȼ�ͼ';
    set(handles.edit1,'string',message);pause(0.5)
    
    getTemperatureGradient
    figure('NumberTitle', 'off', 'Name', '�¶ȱ仯�ȼ�ͼ');
    drawtTemperatureGradient,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\�¶ȱ仯�ȼ�ͼ.jpg'],'jpg');
    
    message = '������¶ȱ仯�ȼ�ͼ';
    set(handles.edit1,'string',message);
end

if ImageSelect(5) == 1
    message = '����������Ϣ����ȴ�����';
    set(handles.edit1,'string',message);pause(0.5)
    log{end+1}='�¶ȱ仯����ͼ';
    getTemperatureGradient
    figure('NumberTitle', 'off', 'Name', '�¶ȱ仯����ͼ');
    drawtTemperatureRrend,grid on
    frame = getframe(gcf);im = frame2im(frame);
    imwrite(im,[NewFileName,'\�¶ȱ仯����ͼ.jpg'],'jpg');
    
    message = '����¶ȱ仯����ͼ';
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
prompt = {'����߶����ã�mm��'};
dlg_title = '����ʵ�ʸ߶�';
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
prompt = {'�ȿ�','�ս��','����ʯ','����ʯ','ʯ��ʯ','��ʯ��','����','����'};
dlg_title = '�������ϱ�';
num_lines = 1;
defAns = {'63.54', '4.68', '0.42', '2.71', '2.36', '3.90', '3.67','18.72'};
% answer = inputdlg(prompt,dlg_title,num_lines,defAns,options)
shiyanpeibi = inputdlg(prompt,dlg_title,num_lines,defAns);
% --- Executes on button press in gongshi2.
function gongshi2_Callback(hObject, eventdata, handles)
% hObject    handle to gongshi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'�ϲ��ȣ�mm��','�����ϣ�kg��','Ŀ��ˮ�֣�%��','�ⶨˮ�֣�%��','ʪ��װ������kg��','����װ������kg��','ʪװ���ܶȣ�t/m^3��','��װ���ܶȣ�t/m^3��','�����ƽ�����ȣ�mm��'};
dlg_title = 'װ�ϲ���';
num_lines = 1;
defAns = {'750', '2.00', '7.20', '7.02', '93.22','86.68','1.73','1.61','2.73'};
zhuangliaocanshu = inputdlg(prompt,dlg_title,num_lines,defAns);

% --- Executes on button press in gongshi3.
function gongshi3_Callback(hObject, eventdata, handles)
% hObject    handle to gongshi3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'���ǰ������m^3/min��','���ʱ�䣨Sec��','����¶ȣ��棩','���ѹ��Pa��','�սḺѹ��Pa��','��ȴ��ѹ��Pa��','��������¶ȣ��棩','�ս�ʱ�䣨Sec��','����������m^3/min��','͸����','��������mm��'};
dlg_title = '�ս���̲���';
num_lines = 1;
defAns = {'0.00', '120.00', '967.00', '-8830.00', '-14710.00','-7840.00','559.50','1820.00','0.00','-0.01','132'};
shaojieguochengcanshu = inputdlg(prompt,dlg_title,num_lines,defAns);

% --- Executes on button press in gongshijieguo4.
function gongshijieguo4_Callback(hObject, eventdata, handles)
% hObject    handle to gongshijieguo4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'�ſ�����kg��','��Ʒ����kg��','��ֱ�ս��ٶȣ�mm/min��','�ս��ʣ�%��','����Ʒ�ʣ�%��','������(%)','��Ʒ�ʣ�%��','�����ʣ�t/m^2*h��','ȼ�ϵ��ģ�kg/t��','ת��ָ����%��','ƽ��ϵ��B','�ս᷵��M.S','B=1�����ĳ�Ʒ�ʣ�%��','B=1�����������ʣ�t/m^2*h��','B=1������ȼ�ϵ��ģ�kg/t��'};
dlg_title = '�ս�������';
num_lines = 1;
defAns = {'76.20', '61.10', '24.73', '87.91', '70.49','17.42','80.18','1.55','52.06','55.00','0.93','22.57','78.71','1.52','53.04'};
shaojiejieguo = inputdlg(prompt,dlg_title,num_lines,defAns);


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = 'help\���ʹ��˵��-20170702V1.pdf';%��ѡ�е���Ŀ��Ӧ���ַ���ֵ
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
