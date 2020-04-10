function varargout = OutputScreen(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OutputScreen_OpeningFcn, ...
                   'gui_OutputFcn',  @OutputScreen_OutputFcn, ...
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
% --- Executes just before OutputScreen is made visible.
function OutputScreen_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

ha=axes('units','normalized',...
'position',[0 0 1 1]);
i = imread('heart3.jpg');
hi=imagesc(i)
set(ha,'handlevisibility','off',...
    'visible','off')

% --- Outputs from this function are returned to the command line.
function varargout = OutputScreen_OutputFcn(hObject, eventdata, handles) 
h= findobj('tag','uipanel1') % use to connect the other screen so that data transfer is possible
% Get default command line output from handles structure
varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function axes1_CreateFcn(hObject, eventdata, handles)
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles) % to show the result
per=getappdata(0,'per')  %getting the transfer value
st=getappdata(0,'st')
set(handles.edit2,'string',per) % set the values in editbox
set(handles.edit1,'string',st)
in = getappdata(0,'in');
axes('position',[0.6,0.35,0.4,0.4])
bar(in)
set(gca,'XTickLabel',{'age','gender','bp','chol','bs','cpt','res','exang','hb','output'},'xcolor','r','ycolor','b'); % to set x-axis lable

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles) % to redirect to inputscreen
close()
inputscreen()

% --- Executes on button press in home.
function home_Callback(hObject, eventdata, handles) % to redirect homescreen
close()
homescreen()
