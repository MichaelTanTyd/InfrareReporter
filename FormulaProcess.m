function varargout = FormulaProcess(varargin)
% FORMULAPROCESS MATLAB code for FormulaProcess.fig
%      FORMULAPROCESS, by itself, creates a new FORMULAPROCESS or raises the existing
%      singleton*.
%
%      H = FORMULAPROCESS returns the handle to a new FORMULAPROCESS or the handle to
%      the existing singleton*.
%
%      FORMULAPROCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORMULAPROCESS.M with the given input arguments.
%
%      FORMULAPROCESS('Property','Value',...) creates a new FORMULAPROCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FormulaProcess_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FormulaProcess_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FormulaProcess

% Last Modified by GUIDE v2.5 05-Nov-2018 14:25:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FormulaProcess_OpeningFcn, ...
                   'gui_OutputFcn',  @FormulaProcess_OutputFcn, ...
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


% --- Executes just before FormulaProcess is made visible.
function FormulaProcess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FormulaProcess (see VARARGIN)

% Choose default command line output for FormulaProcess
handles.output = hObject;

%% ȫ���м��������
global msg
msg={}
global timeVal %ʱ��̶�
global yuanshiguoshiBand %ԭʼ����ʪ���߶�
global fanyingBand %��Ӧ���߶�
global ganzaoBand %����Ԥ�ȴ��߶�
global RETOTHER %�������ݣ���ʽΪ��CO CO2 CH4 SO2 FQLL Height DP1  DP2 DP3 DP4 DP5 DP6 DP7 DP8

%% ȫ�ֽ���������������ڴ洢���������ݣ�����EXCEL����
global out_liaomianshousuolv  %1
global out_ranshaoxiaolv  %2
global out_ranshaofangrelinag  %3
global out_yexiangliang  %4
global out_yexiangshengchengliang  %5
global out_liaocengtouqixingzhishu  %6
handles.hasCalculated=zeros(1,6) %6����������Ƿ��Ѿ�����

addpath(genpath(pwd));
%% ����Ĭ�ϵĿ�ʼʱ��ͽ���ʱ��
timeData=load('.\config\timeSec.mat')
set(handles.startHour,'String',num2str(timeData.timeSec(1)))
set(handles.startMinute,'String',num2str(timeData.timeSec(2)))
set(handles.endHour,'String',num2str(timeData.timeSec(3)))
set(handles.endMinute,'String',num2str(timeData.timeSec(4)))

%% ��ʼ�������������ڱ������������ݺ�����������������������һ�²ſ��Լ���
handles.InfrareCount=0
handles.GasCount=0
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FormulaProcess wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FormulaProcess_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;






function TmpBand1_Callback(hObject, eventdata, handles)
% hObject    handle to TmpBand1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TmpBand1 as text
%        str2double(get(hObject,'String')) returns contents of TmpBand1 as a double


% --- Executes during object creation, after setting all properties.
function TmpBand1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TmpBand1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TmpBand2_Callback(hObject, eventdata, handles)
% hObject    handle to TmpBand2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TmpBand2 as text
%        str2double(get(hObject,'String')) returns contents of TmpBand2 as a double


% --- Executes during object creation, after setting all properties.
function TmpBand2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TmpBand2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TmpBand3_Callback(hObject, eventdata, handles)
% hObject    handle to TmpBand3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TmpBand3 as text
%        str2double(get(hObject,'String')) returns contents of TmpBand3 as a double


% --- Executes during object creation, after setting all properties.
function TmpBand3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TmpBand3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnInfrare.
function BtnInfrare_Callback(hObject, eventdata, handles)
% hObject    handle to BtnInfrare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName,pathName]=uigetfile('*.xlsx','Select Input file')
global msg 
msg{end+1}='���������ݴ��У�������Ҫ�����ӣ����Ժ󡣡���'
set(handles.MsgOutPut,'string',fliplr(msg))
h=msgbox('���������ݴ��У�������Ҫ�����ӣ����Ժ󡣡���')
pause(3)
close(h)

guidata(hObject,handles);
global RET
global yuanshiguoshiBand
global fanyingBand
global ganzaoBand
global timeVal %ʱ��̶�
startHour=str2num(get(handles.startHour,'String'))
startMinute=str2num(get(handles.startMinute,'String'))
endHour=str2num(get(handles.endHour,'String'))
endMinute=str2num(get(handles.endMinute,'String'))
[ RET ,yuanshiguoshiBand,fanyingBand ,ganzaoBand] = InfrareDataCalcu( strcat(pathName,fileName),startHour,startMinute,endHour,endMinute )
timeVal=yuanshiguoshiBand(:,1)

handles.InfrareCount=length(yuanshiguoshiBand(:,1)) %��¼��������������

msg{end+1}=strcat('���������ݴ������,��: ',num2str(handles.InfrareCount),' ������')
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);

% --- Executes on button press in BtnGas.
function BtnGas_Callback(hObject, eventdata, handles)
% hObject    handle to BtnGas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName,pathName]=uigetfile('*.csv','Select Input file')
global msg 
set(handles.MsgOutPut,'string',fliplr(msg))
startHour=str2num(get(handles.startHour,'String'))
startMinute=str2num(get(handles.startMinute,'String'))
endHour=str2num(get(handles.endHour,'String'))
endMinute=str2num(get(handles.endMinute,'String'))
global RETOTHER 
[ RETOTHER ] = otherDataGet( strcat(pathName,fileName),startHour,startMinute,endHour,endMinute )
handles.GasCount=length(RETOTHER(:,1)) %��¼��������������

msg{end+1}=strcat('�������ݴ������,��: ',num2str(handles.GasCount),' ������')
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);

% --- Executes on button press in BtnRecipe.
function BtnRecipe_Callback(hObject, eventdata, handles)
% hObject    handle to BtnRecipe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% �����������˳��
% f.WriteLine(CStr(HMIRuntime.Tags("sjsyjg_sjkMS").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("zlcs_hhlpjld").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("zlcs_lchd").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("zlcs_glzrl").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("zlcs_gzlmd").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("syplb_bys").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("syplb_shs").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("syplb_jf").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("syplb_jk").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("sjsyjg_pkl").Read))
% 
% f.WriteLine(CStr(HMIRuntime.Tags("CO2����").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("��������ܶ�").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("�������ܶ�").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("�ȿ����ܶ�").Read))
% f.WriteLine(CStr(HMIRuntime.Tags("��ˮ����ϵ��").Read))


[fileName,pathName]=uigetfile('*.txt','Select Input file')
global msg 
OreRecipt=load(strcat(pathName,fileName))
handles.OreRecipt=OreRecipt
set(handles.table,'Data',OreRecipt)
msg{end+1}='������ݸ�����ɡ�����'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);


% --- Executes on button press in BtnHeightLevel.
function BtnHeightLevel_Callback(hObject, eventdata, handles)
% hObject    handle to BtnHeightLevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in BtnPressureDiff.
function BtnPressureDiff_Callback(hObject, eventdata, handles)
% hObject    handle to BtnPressureDiff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function MsgOutPut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MsgOutPut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in BondingEfficiency.
function BondingEfficiency_Callback(hObject, eventdata, handles)
% hObject    handle to BondingEfficiency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global msg
hhlpjmd=str2double(get(handles.TxtSmixAPMS,'String'))
if hhlpjmd==0 || isnan(hhlpjmd)
    msg{end+1}='�����ƽ���ܶ�Ϊ0����������ȷ����ֵ'
    set(handles.MsgOutPut,'string',fliplr(msg))
    return
end
cpsjkpjld=str2double(get(handles.StxtFinishSinterAPMS,'String'))
njxl=cpsjkpjld/hhlpjmd
set(handles.RslBondingEff,'String',num2str(njxl));

msg{end+1}='ճ��Ч�ʼ������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);

function TxtSmixAPMS_Callback(hObject, eventdata, handles)
% hObject    handle to TxtSmixAPMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtSmixAPMS as text
%        str2double(get(hObject,'String')) returns contents of TxtSmixAPMS as a double


% --- Executes during object creation, after setting all properties.
function TxtSmixAPMS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtSmixAPMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global RETOTHER
shousuoH=RETOTHER(:,6)
global yuanshiguoshiBand %��Ӧ���߶�
global ganzaoBand %����Ԥ�ȴ��߶�
OreRecipt=handles.OreRecipt
lchd=OreRecipt(3)

[ shousuolv ] = liaomianshousuolv(yuanshiguoshiBand(:,1), shousuoH,lchd,yuanshiguoshiBand(:,2),ganzaoBand(:,2) )
global out_liaomianshousuolv
out_liaomianshousuolv=shousuolv(:,2)
handles.hasCalculated(1)=1

figure('NumberTitle', 'off', 'Name', '����������')
plot(shousuolv(:,1),shousuolv(:,2)*100,'g-o')
datetick('x',15)
legend('����������')
xlabel('ʱ��'); ylabel('���������� (%)');
grid on 

global msg 
msg{end+1}='���������ʼ������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);

function TxtMaterialHeight_Callback(hObject, eventdata, handles)
% hObject    handle to TxtMaterialHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtMaterialHeight as text
%        str2double(get(hObject,'String')) returns contents of TxtMaterialHeight as a double


% --- Executes during object creation, after setting all properties.
function TxtMaterialHeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtMaterialHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtDryPreWarmHeight_Callback(hObject, eventdata, handles)
% hObject    handle to TxtDryPreWarmHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtDryPreWarmHeight as text
%        str2double(get(hObject,'String')) returns contents of TxtDryPreWarmHeight as a double


% --- Executes during object creation, after setting all properties.
function TxtDryPreWarmHeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtDryPreWarmHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnAirPermeabilityIndex.
function BtnAirPermeabilityIndex_Callback(hObject, eventdata, handles)
% hObject    handle to BtnAirPermeabilityIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global RETOTHER
shousuoH=RETOTHER(:,6)
FQLL=RETOTHER(:,5)
global timeVal %ʱ��̶�
OreRecipt=handles.OreRecipt
lchd=OreRecipt(3)
shaojiefuya=OreRecipt(10)

[ touqixing ] = touqixingzhishu( timeVal,FQLL,lchd,shousuoH,shaojiefuya,RETOTHER(:,7:14) )
global out_liaocengtouqixingzhishu  %6
out_liaocengtouqixingzhishu=touqixing(:,2:10)
handles.hasCalculated(6)=1

figure('NumberTitle', 'off', 'Name', '͸����ָ��')
plot(touqixing(:,1),touqixing(:,2:10),'-s')
datetick('x',15)
legend('��͸����','ѹ��1͸����','ѹ��2͸����','ѹ��3͸����','ѹ��4͸����','ѹ��5͸����','ѹ��6͸����','ѹ��7͸����','ѹ��8͸����')
xlabel('ʱ��'); ylabel('͸����ָ��');
grid on 

global msg 
msg{end+1}='�ϲ�͸����ָ���������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);



% --- Executes on button press in BtnBurningEffi.
function BtnBurningEffi_Callback(hObject, eventdata, handles)
% hObject    handle to BtnBurningEffi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global RETOTHER
global yuanshiguoshiBand
CO=RETOTHER(:,1)
CO2=RETOTHER(:,2)
CH4=RETOTHER(:,3)
feiqiliuliang=RETOTHER(:,5)

OreRecipt=handles.OreRecipt
glzrl=OreRecipt(4)
shs=OreRecipt(7)
bys=OreRecipt(6)
lchd=OreRecipt(3)
CO2_percent=OreRecipt(11)
[ ranshaoxiaolv,ranshaoCO2 ] = BurningEffiCalu( yuanshiguoshiBand(:,1),CO,CH4,CO2,glzrl,shs,CO2_percent,bys,yuanshiguoshiBand(:,2),lchd,feiqiliuliang )
global out_ranshaoxiaolv  %2
out_ranshaoxiaolv=ranshaoxiaolv(:,2)
handles.hasCalculated(2)=1

figure('NumberTitle', 'off', 'Name', 'ȼ��Ч��')
plot(ranshaoxiaolv(:,1),ranshaoxiaolv(:,2)*100,'b-o')
datetick('x',15)
legend('ȼ��Ч��')
xlabel('ʱ��'); ylabel('ȼ��Ч�� (%)');
grid on 

global msg 
msg{end+1}='ȼ��Ч�ʼ������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);


function TxtMixRealDensity_Callback(hObject, eventdata, handles)
% hObject    handle to TxtMixRealDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtMixRealDensity as text
%        str2double(get(hObject,'String')) returns contents of TxtMixRealDensity as a double


% --- Executes during object creation, after setting all properties.
function TxtMixRealDensity_CreateFcn(hObject, eventdata, ~)
% hObject    handle to TxtMixRealDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnOriginPorosity.
function BtnOriginPorosity_Callback(hObject, eventdata, handles)
% hObject    handle to BtnOriginPorosity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OreRecipt=handles.OreRecipt
gzlmd=OreRecipt(5)
hhlzmd=OreRecipt(12)
yskxl=1-gzlmd/hhlzmd
set(handles.kongxilv,'String',num2str(yskxl)); 
global msg 
msg{end+1}='�����ԭʼ��϶�ʼ������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);

% --- Executes on button press in BtnBurningOreVolume.
function BtnBurningOreVolume_Callback(hObject, eventdata, handles)
% hObject    handle to BtnBurningOreVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global msg
zlgd=str2double(get(handles.StxtLoadOreHeight,'String'))
sjktj=zlgd*0.0706858
set(handles.RSL_sjktj,'String',num2str(sjktj));  
set(handles.StxtBurningOreVolume,'String',num2str(sjktj));  

msg{end+1}='�ս������������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);


% --- Executes on button press in BtnBurningCO2Percent.
function BtnBurningCO2Percent_Callback(hObject, eventdata, handles)
% hObject    handle to BtnBurningCO2Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function TxtCO2Percent_Callback(hObject, eventdata, handles)
% hObject    handle to TxtCO2Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtCO2Percent as text
%        str2double(get(hObject,'String')) returns contents of TxtCO2Percent as a double


% --- Executes during object creation, after setting all properties.
function TxtCO2Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtCO2Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtCO2Percent2_Callback(hObject, eventdata, handles)
% hObject    handle to TxtCO2Percent2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtCO2Percent2 as text
%        str2double(get(hObject,'String')) returns contents of TxtCO2Percent2 as a double


% --- Executes during object creation, after setting all properties.
function TxtCO2Percent2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtCO2Percent2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnBurningOreApparentDensity.
function BtnBurningOreApparentDensity_Callback(hObject, eventdata, handles)
% hObject    handle to BtnBurningOreApparentDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OreRecipt=handles.OreRecipt
pkl=OreRecipt(10)
lchd=OreRecipt(3)
global msg
sjktj=lchd*0.0706858
if sjktj==0
    msg{end+1}='�ս�����û����ֵ�����ȼ����ս�����'
    set(handles.MsgOutPut,'string',fliplr(msg))
    return
end
sjkbgmd=pkl/sjktj
set(handles.RSL_sjkbgmd,'String',num2str(sjkbgmd));  

msg{end+1}='�ս�����ܶȼ������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global RETOTHER
global timeVal
CO=RETOTHER(:,1)
CO2=RETOTHER(:,2)
SO2=RETOTHER(:,4)
feiqiliuliang=RETOTHER(:,5)
[ Qmin ] = BurningHeatCalue( timeVal,CO,CO2,SO2,feiqiliuliang )
global out_ranshaofangrelinag  %3
out_ranshaofangrelinag=Qmin(:,2)
handles.hasCalculated(3)=1

figure('NumberTitle', 'off', 'Name', 'ȼ�շ�����')
plot(Qmin(:,1),Qmin(:,2),'m-s')
datetick('x',15)
legend('ȼ�շ�����')
xlabel('ʱ��'); ylabel('ȼ�շ����� (kJ/min)');
grid on 

global msg 
msg{end+1}='ȼ�շ������������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);


% --- Executes on button press in BtnQCO.
function BtnQCO_Callback(hObject, eventdata, handles)
% hObject    handle to BtnQCO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BtnQCO2.
function BtnQCO2_Callback(hObject, eventdata, handles)
% hObject    handle to BtnQCO2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BtnQSO2.
function BtnQSO2_Callback(hObject, eventdata, handles)
% hObject    handle to BtnQSO2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BtnTotalBondff.
function BtnTotalBondff_Callback(hObject, eventdata, handles)
% hObject    handle to BtnTotalBondff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BtnNoPhase.
function BtnNoPhase_Callback(hObject, eventdata, handles)
% hObject    handle to BtnNoPhase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function TxtParaffinDensity_Callback(hObject, eventdata, handles)
% hObject    handle to TxtParaffinDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtParaffinDensity as text
%        str2double(get(hObject,'String')) returns contents of TxtParaffinDensity as a double


% --- Executes during object creation, after setting all properties.
function TxtParaffinDensity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtParaffinDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnAverOreNoH2O.
function BtnAverOreNoH2O_Callback(hObject, eventdata, handles)
% hObject    handle to BtnAverOreNoH2O (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function jksmd_Callback(hObject, eventdata, handles)
% hObject    handle to jksmd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jksmd as text
%        str2double(get(hObject,'String')) returns contents of jksmd as a double


% --- Executes during object creation, after setting all properties.
function jksmd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jksmd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tsssxs_Callback(hObject, eventdata, handles)
% hObject    handle to tsssxs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tsssxs as text
%        str2double(get(hObject,'String')) returns contents of tsssxs as a double


% --- Executes during object creation, after setting all properties.
function tsssxs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tsssxs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnLiquid.
function BtnLiquid_Callback(hObject, eventdata, handles)
% hObject    handle to BtnLiquid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global RETOTHER
global timeVal
shousuoH=RETOTHER(:,6)
global yuanshiguoshiBand %
global ganzaoBand %����Ԥ�ȴ��߶�
OreRecipt=handles.OreRecipt
lchd=OreRecipt(3)
glzrl=OreRecipt(4)
jf=OreRecipt(8)
jk=OreRecipt(9)

jfsmd=OreRecipt(13)
jksmd=OreRecipt(14)
tsssxs=OreRecipt(15)
[ yexiangliang ] = yexiangshengchengliang( timeVal,shousuoH,lchd,glzrl,jf,yuanshiguoshiBand,ganzaoBand,jfsmd,jk,jksmd,tsssxs )
global out_yexiangliang  %4
out_yexiangliang=yexiangliang(:,2)
handles.hasCalculated(4)=1

figure('NumberTitle', 'off', 'Name', 'Һ����')
plot(yexiangliang(:,1),yexiangliang(:,2),'r-s')
datetick('x',15)
legend('Һ����')
xlabel('ʱ��'); ylabel('Һ���� (ml)');
grid on 

global msg 
msg{end+1}='Һ�����������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);


% --- Executes on button press in BtnLiquidCount.
function BtnLiquidCount_Callback(hObject, eventdata, handles)
% hObject    handle to BtnLiquidCount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in MsgOutPut.
function MsgOutPut_Callback(hObject, eventdata, handles)
% hObject    handle to MsgOutPut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MsgOutPut contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MsgOutPut


% --- Executes during object creation, after setting all properties.
function MsgList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MsgOutPut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function endMinute_Callback(hObject, eventdata, handles)
% hObject    handle to endMinute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of endMinute as text
%        str2double(get(hObject,'String')) returns contents of endMinute as a double


% --- Executes during object creation, after setting all properties.
function endMinute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endMinute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function endHour_Callback(hObject, eventdata, handles)
% hObject    handle to endHour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of endHour as text
%        str2double(get(hObject,'String')) returns contents of endHour as a double


% --- Executes during object creation, after setting all properties.
function endHour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endHour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function startMinute_Callback(hObject, eventdata, handles)
% hObject    handle to startMinute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startMinute as text
%        str2double(get(hObject,'String')) returns contents of startMinute as a double


% --- Executes during object creation, after setting all properties.
function startMinute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startMinute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function startHour_Callback(hObject, eventdata, handles)
% hObject    handle to startHour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startHour as text
%        str2double(get(hObject,'String')) returns contents of startHour as a double


% --- Executes during object creation, after setting all properties.
function startHour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startHour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nianjiexiaolv.
function nianjiexiaolv_Callback(hObject, eventdata, handles)
% hObject    handle to nianjiexiaolv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ճ��Ч�ʼ���
OreRecipt=handles.OreRecipt
sjkMS=OreRecipt(1)
hhlpjld=OreRecipt(2)
effi=(sjkMS/hhlpjld)^3*0.7405
set(handles.RetNianjiexiaolv,'String',num2str(effi)); 
global msg 
msg{end+1}='ճ��Ч�ʼ������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);


% --- Executes on button press in clearLog.
function clearLog_Callback(hObject, eventdata, handles)
% hObject    handle to clearLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global msg 
msg=''
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
startHour=str2num(get(handles.startHour,'String'))
startMinute=str2num(get(handles.startMinute,'String'))
endHour=str2num(get(handles.endHour,'String'))
endMinute=str2num(get(handles.endMinute,'String'))
timeSec=[ startHour startMinute endHour endMinute]
save(['config', '\timeSec.mat'],'timeSec');

delete(hObject);


% --- Executes on button press in outportExcel.
function outportExcel_Callback(hObject, eventdata, handles)
% hObject    handle to outportExcel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName PathName]=uiputfile('*.xlsx','ѡ�񵼳��ļ�');
savePath=strcat(PathName,FileName)

global timeVal %ʱ��̶�
global out_liaomianshousuolv  %1
global out_ranshaoxiaolv  %2
global out_ranshaofangrelinag  %3
global out_yexiangliang  %4
global out_yexiangshengchengliang  %5
global out_liaocengtouqixingzhishu  %6

len=length(timeVal)
if handles.hasCalculated(1)==0
    out_liaomianshousuolv=zeros(len,1)
end
if handles.hasCalculated(2)==0
    out_ranshaoxiaolv=zeros(len,1)
end
if handles.hasCalculated(3)==0
    out_ranshaofangrelinag=zeros(len,1)
end
if handles.hasCalculated(4)==0
    out_yexiangliang=zeros(len,1)
end
if handles.hasCalculated(5)==0
    out_yexiangshengchengliang=zeros(len,1)
end
if handles.hasCalculated(6)==0
    out_liaocengtouqixingzhishu=zeros(len,9)
end
excelColTitle={'ʱ��','����������','ȼ��Ч��','ȼ�շ�����','Һ����','Һ��������','��͸����','ѹ��1͸����','ѹ��2͸����','ѹ��3͸����','ѹ��4͸����','ѹ��5͸����','ѹ��6͸����','ѹ��7͸����','ѹ��8͸����'}
data=[timeVal out_liaomianshousuolv   out_ranshaoxiaolv  out_ranshaofangrelinag  out_yexiangliang   out_yexiangshengchengliang  out_liaocengtouqixingzhishu]
xlswrite(savePath,excelColTitle,1,'A1')
xlswrite(savePath,data,1,'A2')
global msg 
msg{end+1}='EXCEL�������'
set(handles.MsgOutPut,'string',fliplr(msg))
guidata(hObject,handles);