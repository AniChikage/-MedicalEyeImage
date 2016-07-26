function varargout = system(varargin)
% SYSTEM MATLAB code for system.fig
%      SYSTEM, by itself, creates a new SYSTEM or raises the existing
%      singleton*.
%
%      H = SYSTEM returns the handle to a new SYSTEM or the handle to
%      the existing singleton*.
%
%      SYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SYSTEM.M with the given input arguments.
%
%      SYSTEM('Property','Value',...) creates a new SYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before system_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to system_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help system

% Last Modified by GUIDE v2.5 08-Jun-2016 16:22:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @system_OpeningFcn, ...
                   'gui_OutputFcn',  @system_OutputFcn, ...
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


% --- Executes just before system is made visible.
function system_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to system (see VARARGIN)

% Choose default command line output for system
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes system wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = system_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in OpenImage.
function OpenImage_Callback(~, ~, handles)
% hObject    handle to OpenImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'选择图像');
% if isequal(filename,0)||isequal(pathname,0)
%   errordlg('您还没有选取图片！！','温馨提示');%如果没有输入，则创建错误对话框 
%   return;
% else
%     image=[pathname,filename];%合成路径+文件名
%     im=imread(image);%读取图像
%     set(handles.axes1,'HandleVisibility','ON');%打开坐标，方便操作
%     axes(handles.axes1);%%使用图像，操作在坐标1
%     imshow(im);%在坐标axes1显示原图像 
%     constantImage=im;
%     title('原始图像');
%     
%     waitforbuttonpress;              % 等待鼠标按下
%     point1 = get(gca,'CurrentPoint');    % 鼠标按下了
%     finalRect = rbbox;                   %
%     point2 = get(gca,'CurrentPoint');    % 鼠标松开了
%     point1 = int32(point1(1,1:2));              % 提取出两个点
%     point2 = int32(point2(1,1:2));
%     x1=fix(point1(1));
%     y1=fix(point1(2));
%     x2=fix(point2(1));
%     y2=fix(point2(2));
%     img=im(y1:y2,x1:x2,:);
%     %imshow(img)
%     axes(handles.axes1);%%使用图像，操作在坐标1
%     imshow(img);%在坐标axes1显示原图像 
% end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --------------------------------------------------------------------
function openNewImage_Callback(hObject, eventdata, handles)
% hObject    handle to openNewImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'选择图像');
if isequal(filename,0)||isequal(pathname,0)
  %errordlg('您还没有选取图片！！','温馨提示');%如果没有输入，则创建错误对话框 
  %return;
else
    image=[pathname,filename];%合成路径+文件名
    im=imread(image);%读取图像
    set(handles.axes1,'HandleVisibility','ON');%打开坐标，方便操作
    axes(handles.axes1);%%使用图像，操作在坐标1
    imshow(im);%在坐标axes1显示原图像 
    title('原始图像');
    
    waitforbuttonpress;              % 等待鼠标按下
    point1 = get(gca,'CurrentPoint');    % 鼠标按下了
    finalRect = rbbox;                   %
    point2 = get(gca,'CurrentPoint');    % 鼠标松开了
    point1 = int32(point1(1,1:2));              % 提取出两个点
    point2 = int32(point2(1,1:2));
    x1=fix(point1(1));
    y1=fix(point1(2));
    x2=fix(point2(1));
    y2=fix(point2(2));
    img=im(y1:y2,x1:x2,:);
    %imshow(img)
    axes(handles.axes1);%%使用图像，操作在坐标1
    imshow(img);%在坐标axes1显示原图像 
    title('截取图像');
    %set('ui_handle','testd',point1(1,1:2));
    setappdata(system,'originImg',im);
    setappdata(system,'selectedImg',img);
end


% --------------------------------------------------------------------
function reSelectArea_Callback(hObject, eventdata, handles)
% hObject    handle to reSelectArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    im=getappdata(system,'originImg');
    axes(handles.axes1);%%使用图像，操作在坐标1
    imshow(im);%在坐标axes1显示原图像 
    title('原始图像');
    
    waitforbuttonpress;              % 等待鼠标按下
    point1 = get(gca,'CurrentPoint');    % 鼠标按下了
    finalRect = rbbox;                   %
    point2 = get(gca,'CurrentPoint');    % 鼠标松开了
    point1 = int32(point1(1,1:2));              % 提取出两个点
    point2 = int32(point2(1,1:2));
    x1=fix(point1(1));
    y1=fix(point1(2));
    x2=fix(point2(1));
    y2=fix(point2(2));
    img=im(y1:y2,x1:x2,:);
    %imshow(img)
    axes(handles.axes1);%%使用图像，操作在坐标1
    imshow(img);%在坐标axes1显示原图像 
    setappdata(system,'selectedImg',img);
    title('截取图像');
catch
  %  errordlg('您还没有选取图片！！','温馨提示');%如果没有输入，则创建错误对话框 
 % return;
end

% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about();


% --------------------------------------------------------------------
function calcu_Callback(hObject, eventdata, handles)
% hObject    handle to calcu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgrgb=getappdata(system,'selectedImg');
    [m,n] = size(imgrgb);
    imgrgb_t=imgrgb(:,:,:);%缓存原图像
    
    imgrgb_Artery=imgrgb(:,:,:);%获取静脉图像
    imgrgb_Vein=imgrgb(:,:,:);%获取动脉图像
    
    [m1,n1] = size(imgrgb_t);
    figure;
    imshow(imgrgb_Artery);
    threshArtery = 35; %静脉阈值
    threshVeinLow = 19; %动脉阈值
    threshVeinHigh = 30; %动脉阈值
    rb = 22;     %边界
    ll = rb;
    try
    for oi=rb+1:m1-rb-1
        for oj=rb+1:n1-rb-1  
            %deal artery
            if (imgrgb_t(oi-ll,oj)-imgrgb_t(oi,oj)>threshArtery)||...
                    (imgrgb_t(oi,oj-ll)-imgrgb_t(oi,oj)>threshArtery)||...
                    (imgrgb_t(oi-fix(ll/sqrt(2)),oj-fix(ll/sqrt(2)))-imgrgb_t(oi,oj)>threshArtery)||...
                    (imgrgb_t(oi-fix(ll/sqrt(2)),oj+fix(ll/sqrt(2)))-imgrgb_t(oi,oj)>threshArtery)
                imgrgb_Artery(oi,oj)=0;
            else 
                imgrgb_Artery(oi,oj)=255;
            end
            %deal end
            
            %deal vein
            if (imgrgb_t(oi-ll,oj)-imgrgb_t(oi,oj)>threshVeinLow && imgrgb_t(oi-ll,oj)-imgrgb_t(oi,oj)<threshVeinHigh)||...
                    (imgrgb_t(oi,oj-ll)-imgrgb_t(oi,oj)>threshVeinLow && imgrgb_t(oi,oj-ll)-imgrgb_t(oi,oj)<threshVeinHigh)||...
                    (imgrgb_t(oi-fix(ll/sqrt(2)),oj-fix(ll/sqrt(2)))-imgrgb_t(oi,oj)>threshVeinLow && imgrgb_t(oi-fix(ll/sqrt(2)),oj-fix(ll/sqrt(2)))-imgrgb_t(oi,oj)<threshVeinHigh)||...
                    (imgrgb_t(oi-fix(ll/sqrt(2)),oj+fix(ll/sqrt(2)))-imgrgb_t(oi,oj)>threshVeinLow && imgrgb_t(oi-fix(ll/sqrt(2)),oj+fix(ll/sqrt(2)))-imgrgb_t(oi,oj)<threshVeinHigh)
                imgrgb_Vein(oi,oj)=0;
            else 
                imgrgb_Vein(oi,oj)=255;
            end
            %deal end   
        end
    end
    figure;
    imshow(imgrgb_Artery);
    figure;
    imga_Artery=im2bw(rgb2gray(imgrgb_Artery));
    imshow(imga_Artery);
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%     figure;
%     imshow(imgrgb_Vein);
%     figure;
%     imga_ArteryVein=im2bw(rgb2gray(imgrgb_Vein));
%     imshow(imga_ArteryVein);
    
    [m2,n2]=size(imga_Artery);
    line=m2-50;
    left_bound_pos=zeros(1,20);
    begin_=1;
    for oj=rb+1:n2-rb-1                    
            if (imga_Artery(line,oj-1)==1&&imga_Artery(line,oj)==0&&imga_Artery(line,oj+1)==0)
                   left_bound_pos(begin_) = oj;begin_=begin_+1;
            end
            if (imga_Artery(line,oj-1)==0&&imga_Artery(line,oj)==0&&imga_Artery(line,oj+1)==1)
                   left_bound_pos(begin_) = oj;begin_=begin_+1;
            end   
    end
    maxl=left_bound_pos(1);
    maxr=left_bound_pos(2);
    maxlen=maxr-maxl;
    for inn=3:2:9
        if((left_bound_pos(inn+1)-left_bound_pos(inn))>maxlen)
            maxl=left_bound_pos(inn);
            maxr=left_bound_pos(inn+1);
            maxlen=maxr-maxl;
        end
    end
    
    mid_posx=line;
    mid_posy=(maxl+maxr)/2;
    min_radiu=maxlen;
    for si=mid_posx-fix(maxlen/2):mid_posx
        for sj=fix(mid_posy)-fix(maxlen/2):fix(mid_posy)
            if(imga_Artery(si-1,sj)==1&&imga_Artery(si,sj)==0&&imga_Artery(si+1,sj)==0)
                if(sqrt((si-mid_posx)^2+(sj-mid_posy)^2)<min_radiu)
                    min_radiu=sqrt((si-mid_posx)^2+(sj-mid_posy)^2);
                end
            end
        end
    end
    width=2*min_radiu;
    set(handles.Lartery,'string',num2str(width));
    text(maxr,line,[' \leftarrow' num2str(width)]);
    catch
        errordlg('您选择的区域过小，请重新选择','提示')
    end


% --------------------------------------------------------------------
function DocHelp_Callback(hObject, eventdata, handles)
% hObject    handle to DocHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://github.com/AniChikage/-MedicalEyeImage/blob/master/README.md','-browser');



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
