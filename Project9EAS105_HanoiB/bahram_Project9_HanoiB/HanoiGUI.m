function varargout = HanoiGUI(varargin)
% HANOIGUI MATLAB code for HanoiGUI.fig
%      HANOIGUI, by itself, creates a new HANOIGUI or raises the existing
%      singleton*.
%
%      H = HANOIGUI returns the handle to a new HANOIGUI or the handle to
%      the existing singleton*.
%
%      HANOIGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HANOIGUI.M with the given input arguments.
%
%      HANOIGUI('Property','Value',...) creates a new HANOIGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HanoiGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HanoiGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HanoiGUI

% Last Modified by GUIDE v2.5 03-Dec-2011 19:33:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @HanoiGUI_OpeningFcn, ...
    'gui_OutputFcn',  @HanoiGUI_OutputFcn, ...
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


% --- Executes just before HanoiGUI is made visible.
function HanoiGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HanoiGUI (see VARARGIN)

% Choose default command line output for HanoiGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(gca,'XTickLabel',[]);
set(gca,'XTick',[]);
set(gca,'YTickLabel',[]);
set(gca,'YTick',[]);


% UIWAIT makes HanoiGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HanoiGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in new.
function new_Callback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.hint,'Enable','on');
disks = get(handles.listbox1,'Value')+2;
R = randLocationR(disks);
S = rollcall2SA(R);
T = SA2TA(S);
handles.L = rollcall2List(R);
handles.Solved = SA2TA(rollcall2SA(ones(1,disks)*3));
distance = distTA(T,handles.Solved);
drawTowers(handles.L,handles.axes1);
set(handles.edit1,'String',num2str(distance));
handles.output = hObject;
guidata(hObject, handles);



% --- Executes on button press in hint.
function hint_Callback(hObject, eventdata, handles)
% hObject    handle to hint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

R = list2Rollcall(handles.L);
S = rollcall2SA(R);
T = SA2TA(S);
from = 3;
to = 3;
distance = distTA(T,handles.Solved);
for i = 1:3;
    for j = 1:3;
        if isLegalMove(handles.L,i,j)
            Lguess = makeMove(handles.L,i,j);
            Rguess = list2Rollcall(Lguess);
            Sguess = rollcall2SA(Rguess);
            Tguess = SA2TA(Sguess);
            if distTA(Tguess,handles.Solved)<distance
                from = i;
                to = j;
                distance = distTA(Tguess,handles.Solved);
            end
        end
    end
end
handles.L = makeMove(handles.L,from,to);
distance = distTA(T,handles.Solved);
drawTowers(handles.L,handles.axes1);
set(handles.edit1,'String',num2str(distance));
handles.output = hObject;
guidata(hObject, handles);
    


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(get(handles.pushbutton2,'Enable'),'on') && isequal(get(handles.pushbutton3,'Enable'),'on')
    set(handles.pushbutton1,'Enable','off');
    handles.from = 1;
    handles.output = hObject;
    guidata(hObject, handles);
else
    set(handles.pushbutton2,'Enable','on');
    set(handles.pushbutton2,'Enable','on');
    handles.L = makeMove(handles.L,handles.from,1);
    R = list2Rollcall(handles.L);
    S = rollcall2SA(R);
    T = SA2TA(S);
    distance = distTA(T,handles.Solved);
    drawTowers(handles.L,handles.axes1);
    set(handles.edit1,'String',num2str(distance));
    handles.output = hObject;
    guidata(hObject, handles);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(get(handles.pushbutton1,'Enable'),'on') && isequal(get(handles.pushbutton3,'Enable'),'on')
    set(handles.pushbutton2,'Enable','off');
    handles.from = 2;
    handles.output = hObject;
    guidata(hObject, handles);
else
    set(handles.pushbutton1,'Enable','on');
    set(handles.pushbutton3,'Enable','on');
    handles.L = makeMove(handles.L,handles.from,2);
    R = list2Rollcall(handles.L);
    S = rollcall2SA(R);
    T = SA2TA(S);
    distance = distTA(T,handles.Solved);
    drawTowers(handles.L,handles.axes1);
    set(handles.edit1,'String',num2str(distance));
    handles.output = hObject;
    guidata(hObject, handles);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(get(handles.pushbutton1,'Enable'),'on') && isequal(get(handles.pushbutton2,'Enable'),'on')
    set(handles.pushbutton3,'Enable','off');
    handles.from = 3;
    handles.output = hObject;
    guidata(hObject, handles);
else
    set(handles.pushbutton1,'Enable','on');
    set(handles.pushbutton2,'Enable','on');
    handles.L = makeMove(handles.L,handles.from,3);
    R = list2Rollcall(handles.L);
    S = rollcall2SA(R);
    T = SA2TA(S);
    distance = distTA(T,handles.Solved);
    drawTowers(handles.L,handles.axes1);
    set(handles.edit1,'String',num2str(distance));
    handles.output = hObject;
    guidata(hObject, handles);
end



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
