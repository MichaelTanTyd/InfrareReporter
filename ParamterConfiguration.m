function varargout = ParamterConfiguration(varargin)
% PARAMTERCONFIGURATION MATLAB code for ParamterConfiguration.fig
%      PARAMTERCONFIGURATION, by itself, creates a new PARAMTERCONFIGURATION or raises the existing
%      singleton*.
%
%      H = PARAMTERCONFIGURATION returns the handle to a new PARAMTERCONFIGURATION or the handle to
%      the existing singleton*.
%
%      PARAMTERCONFIGURATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARAMTERCONFIGURATION.M with the given input arguments.
%
%      PARAMTERCONFIGURATION('Property','Value',...) creates a new PARAMTERCONFIGURATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ParamterConfiguration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ParamterConfiguration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ParamterConfiguration

% Last Modified by GUIDE v2.5 28-Feb-2017 22:55:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ParamterConfiguration_OpeningFcn, ...
                   'gui_OutputFcn',  @ParamterConfiguration_OutputFcn, ...
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


% --- Executes just before ParamterConfiguration is made visible.
function ParamterConfiguration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ParamterConfiguration (see VARARGIN)

% Choose default command line output for ParamterConfiguration
handles.output = hObject;
handles.new_config={}
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ParamterConfiguration wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ParamterConfiguration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
varargout{2} = handles.new_config;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
handles.new_config={'add',2;'dddd',3}
guidata(hObject, handles);
uiresume
delete(hObject);
