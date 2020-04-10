function varargout = homescreen(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @homescreen_OpeningFcn, ...
                   'gui_OutputFcn',  @homescreen_OutputFcn, ...
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


% --- Executes just before homescreen is made visible.
function homescreen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% Choose default command line output for homescreen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
ha=axes('units','normalized',...   %to resize the image according to axes size
'position',[0 0 1 1]);
i = imread('heart3.jpg');   % used to read image
hi=imagesc(i)



% --- Outputs from this function are returned to the command line.
function varargout = homescreen_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
close()
inputscreen() % call next screen
