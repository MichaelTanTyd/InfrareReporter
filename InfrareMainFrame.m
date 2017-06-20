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
%����config.mat�е�key-value����ǰGUI�е�appdata��
initConfigAppData(hObject,'.\config\config.mat')
% ��appdata�л�ȡĬ�ϻ�ͼѡ������
handles.chkbox_one2six_value=str2num(getappdata(gcf,'defaultDrawingOrder'))
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InfrareMainFrame wait for user response (see UIRESUME)
% uiwait(handles.figure1);%% uiresume ���ʹ�� UIWAIT


% --- Outputs from this function are returned to the command line.
function varargout = InfrareMainFrame_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output
%% ����Ĭ�ϵĻ�ͼѡ��
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
% �ļ���ͼ % �����ļ��򿪽���
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
% �������ض����ļ�����
[data,T,S] = xlsread(fulfile);
ImageData = data(:,4:end);
TimeData = data(:,1);
% Time2Matri()
Time_Data = Time2Matri(TimeData);
%% ��ȡTemperatureVsTimeData
% TemperatureVsTime = [Time_Data,ImageData];
ImageData2 = ImageData;
% �����ݷ�Ϊ10��,Num=10
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
disp('����')
disp('���ͼ�����ݴ���')



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
method = questdlg('Ҫ�����һ��ͼ����?','��ʾ','Yes','No','No');
switch lower(method)
    case 'yes'
        clear figure
    case 'no'
end
% ��ʾͼ��
drawTemperatureVsTime(handle)
% [M, N] = size(allData); % MΪ�����꣬NΪ������
% for index = 1:M
%     plot(allData(index,4:end)); hold on; grid on;
% end
% legendTxt = num2str(allData(:,1));
% legend(legendTxt,0)
% xlabel('λ��ֵ Pix ');
% ylabel('�¶�ֵ ��');
% title('��ͬʱ��ε�λ��-�¶ȹ�ϵͼ')

% --- Executes on button press in btn_height.
function btn_height_Callback(hObject, eventdata, handles)
% hObject    handle to btn_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% �߶ȱ仯ͼ
global allData
method = questdlg('Ҫ�����һ��ͼ����?','��ʾ','Yes','No','No');
switch lower(method)
    case 'yes'
        clear figure
    case 'no'
end
[M, N] = size(allData); % MΪ�����꣬NΪ������
%% ʱ��߶ȹ�ϵ
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
xlabel('ʱ�� ms');
ylabel('�߶� Pix');
title([num2str(allData(1,1)) 'ʱ��߶ȹ�ϵͼ'])




% --- Executes on button press in btn_shrinkage.
function btn_shrinkage_Callback(hObject, eventdata, handles)
% hObject    handle to btn_shrinkage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global allData
method = questdlg('Ҫ�����һ��ͼ����?','��ʾ','Yes','No','No');
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
method = questdlg('Ҫ�����һ��ͼ����?','��ʾ','Yes','No','No');
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
% update��ͼѡ������
handles.chkbox_one2six_value(1)=get(hObject,'Value')
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
ImageSelect = handles.chkbox_one2six_value;
% FigureNum = sum(ImageSelect);
if ImageSelect(1) == 1
    figure
    drawTemperatureVsTime,grid on
end
if ImageSelect(2) == 1
    figure
    drawtHeightOfLRAVsTime,grid on % ȼ�ϲ�Ǩ������ͼ
end
if ImageSelect(3) == 1
    figure
    drawtHeightOfTopSurfaceVsTime ,grid on% �ϱ�����λ�仯ͼ
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
