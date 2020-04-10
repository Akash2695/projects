function varargout = inputscreen(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @inputscreen_OpeningFcn, ...
                   'gui_OutputFcn',  @inputscreen_OutputFcn, ...
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

% --- Executes just before inputscreen is made visible.
function inputscreen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to inputscreen (see VARARGIN)
% Choose default command line output for inputscreen
handles.output = hObject;
guidata(hObject, handles);
ha=axes('units','normalized',...
'position',[0 0 1 1]);
i = imread('heart3.jpg');
hi=imagesc(i)

% --- Outputs from this function are returned to the command line.
function varargout = inputscreen_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

function uipanel1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in age.
function age_Callback(hObject, eventdata, handles)

function age_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function bp_Callback(hObject, eventdata, handles)
function bp_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function chol_Callback(hObject, eventdata, handles)
function chol_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function cp_Callback(hObject, eventdata, handles)
function cp_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function hb_Callback(hObject, eventdata, handles)
function hb_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global gender1  %....making variable global
global exang1
global res1
global bs1
% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles) %  use to retrieve the selected radio button value
global gender1
switch(get(eventdata.NewValue,'Tag'))
    case 'male'
        gender1=1; 
    case 'female'
        gender1=0; 
end


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
global bs1
switch(get(eventdata.NewValue,'Tag'))
    case 'byes'
        bs1=1; 
    case 'bno'
        bs1=0; 
end


% --- Executes when selected object is changed in uipanel4.
function uipanel4_SelectionChangeFcn(hObject, eventdata, handles)
global res1
switch(get(eventdata.NewValue,'Tag'))
    case 'ryes'
        res1=1; 
    case 'rno'
        res1=0; 
end


% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
global exang1
switch(get(eventdata.NewValue,'Tag'))
    case 'eyes'
        exang1=1; 
    case 'eno'
        exang1=0; 
end
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global gender1
global exang1
global res1
global bs1
age1=str2num(get(handles.age,'string')) % retrieve the value of edit box from gui
bp1 = str2num(get(handles.bp,'string'))
chol1=str2num(get(handles.chol,'string'))
hb1=str2num(get(handles.hb,'string'))
content= get(handles.cp,'value') % retrieve the selected value from listbox
switch content
    case 1
          cpt1=0
    case 2
           cpt1=1
    case 3
           cpt1=2
    case 4
           cpt1=3
end
in=[age1,gender1,bp1,chol1,bs1,cpt1,res1,exang1,hb1]
fis=readfis('project') % read fis file
h=waitbar(0,'Please wait...','CreateCancelBtn','close');
for i=1:2000
    waitbar(i/2000)
end
close(h)
out=evalfis(in,fis) % getting output
per=out*100
if(per<0)
    per=-per;
end
in=[age1,gender1,bp1,chol1,bs1,cpt1,res1,exang1,hb1,per]
setappdata(0,'in',in)
if per>=0 && per<=40
    st='No'
elseif per>40 && per<=60
        st='May or May not be'
else  
     st='Yes'
end

setappdata(0,'per',per) % set the per value, used in next gui screen
setappdata(0,'st',st)
close()
OutputScreen() % calling the next gui screen

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, ~)
% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles) % to rest all editbox
set(handles.age,'string','');
set(handles.hb,'string','');
set(handles.chol,'string','');
set(handles.bp,'string','');

% --- Executes on button press in home.
function home_Callback(hObject, eventdata, handles) % to redirect to home screen
close()
homescreen()