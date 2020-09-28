function varargout = untitled1(varargin)
% UNTITLED1 MATLAB code for untitled1.fig
%      UNTITLED1, by itself, creates a new UNTITLED1 or raises the existing
%      singleton*.
%
%      H = UNTITLED1 returns the handle to a new UNTITLED1 or the handle to
%      the existing singleton*.
%
%      UNTITLED1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED1.M with the given input arguments.
%
%      UNTITLED1('Property','Value',...) creates a new UNTITLED1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled1

% Last Modified by GUIDE v2.5 15-May-2015 14:11:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled1_OutputFcn, ...
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


% --- Executes just before untitled1 is made visible.
function untitled1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled1 (see VARARGIN)

% Choose default command line output for untitled1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear;
close all
GA='27 4/7';
disp('Load video and conver to grayscale');
%Load the video to start the process
[fname path]=uigetfile('F:\New Datas_Protocal_02052015\Patient35_36_04132015\801229986\Normal\*.*','Select The Video or DICOM file');
filename=strcat(path,fname);
vid=VideoReader(filename);
%Get number of frames in the video read 
vidframes=read(vid);
%Stores the total number of frames in the video (Just the count)
nframes=get(vid,'NumberOfFrames');
height=vid.Height;
width=vid.Width;
% implay(vidframes);
%Stores the frame rate of the original video
rate=vid.FrameRate; 
% Get Individual frams of video and converts it to gray scale images or
% frames
%img_gray=zeros(height,width,nframes);
for k=1:nframes
    mov(k).cdata=vidframes(:,:,:,k);
    mov(k).colormap=[];
    img_gray(:,:,k)=im2single(rgb2gray(mov(k).cdata));    
end
implay(img_gray);
hold on


% --- Executes on button press in l_contour.
function l_contour_Callback(hObject, eventdata, handles)
% hObject    handle to l_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Lefteye
%Determine the Center of the eye ball using NORMXCORR2
%1.Get the cropped image
%2.Do correlation of the image with the entire image
%3.Obtain the center of the eyeball
close all
h1=warndlg('All Processing for Left Eye'); 
waitfor(h1);
disp('Correlation and Center of Eyeball');
tic
ppp_l=1;
figure
imshow(img_gray(:,:,ppp_l));
h=imellipse;
position=wait(h);
BW=createMask(h);
figure,imshow(BW);
[pt rad]=imfindcircles(BW,[1 100]);
%Warning box to alert the uimser on eyeball region cropping
% h=warndlg('First choose the point to the left to centre and then at the top','Warning !');
% waitfor(h);
% figure,imshow(img_gray(:,:,ppp_l));
% [x0,y0]=ginput(3);
% %coordinate of the eyeball region
% rec_l=[(x0(3)-(x0(1)-x0(2))),(y0(3)-(y0(1)-y0(2))),2.*(x0(1)-x0(2)),2.*(y0(1)-y0(3))]
% pt=[x0(1),y0(1)];
% rad=floor(sqrt((x0(2)-x0(1)).^2+((y0(2)-y0(1)).^2)));
[img,rec_l]=cropping(img_gray(:,:,ppp_l),pt(1,:),rad(1)+20);
%coordinate of the plane to crop and perform the correlation for eyeball
%correlation.
rec1_l=[rec_l(1,1)-200,rec_l(1,2)-100,rec_l(1,3)+300,rec_l(1,4)+200]%Plane image for correlation with template
for i=1:nframes
    img_corr_l(:,:,i)=imcrop(img_gray(:,:,i),rec1_l);
end
%Correlation of individual frames of the video
for i=1:nframes-1
    cor_l=normxcorr2(img,img_corr_l(:,:,i+1));
    num=max(max(cor_l));
    [b a]=ind2sub(size(cor_l),find(cor_l==num));
    u_l(i)=(rec1_l(1,1)+a-((size(img,2)+1)/2));    
    v_l(i)=(rec1_l(1,2)+b-((size(img,1)+1)/2));
end
%verification for proper correlation
qqq_l=1;
figure,imshow(img_gray(:,:,qqq_l));
hold on
plot(u_l,v_l,'o');
toc

% --- Executes on button press in l_lens.
function l_lens_Callback(hObject, eventdata, handles)
% hObject    handle to l_lens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
close all
disp('Correlation of Eye Lens');
ppp_l=get(hObject,'String'); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure,imshow(img_corr_l(:,:,ppp_l));
pt=floor(ginput(1));
[L,rect_l]=cropping(img_corr_l(:,:,ppp_l),pt,10);
%     figure(4),imshow(L,[]);
[L1,rect1_l] =cropping1(img_corr_l(:,:,ppp_l+1),pt,20);
%     figure(2),imshow(L1,[]);
c=normxcorr2(L,L1);
%     figure(3),imshow(c);
[max_cc, imax] = max(abs(c(:)));
[ypeak, xpeak] = ind2sub(size(c),imax(1));
x1=floor(rect1_l(1,1)+xpeak-((size(L,1)+1)/2));
y1=floor(rect1_l(1,2)+ypeak-((size(L,2)+1)/2));
for i =ppp_l:nframes-1
    [L,rect_l]=cropping(img_corr_l(:,:,i),pt,10);
    [L1,rect1_l]=cropping1(img_corr_l(:,:,i+1),pt,20);
    c=normxcorr2(L,L1);
    t1(i)=max(abs(c(:)));
    [max_cc,imax]=max(abs(c(:)));
    [ypeak,xpeak]=ind2sub(size(c),imax(1));
    x_l(i)=(rect_l(1,1)+xpeak-((size(L1,1)+1)/2));
    y_l(i)=(rect_l(1,2)+ypeak-((size(L1,2)+1)/2));    
    [m_L,Lmax]=max(abs(L(:)));
    [y_L,x_L]=ind2sub(size(L),Lmax(1));
    if (x_L-1)==xpeak-((size(L1,1)+1)/2) && (y_L-1)==ypeak-((size(L1,2)+1)/2)
        pt=[x_l(i),y_l(i)];
    else
        pt=[(rect_l(1,1)+(x_L-1)),(rect_l(1,2)+(y_L-1))];
    end
end
figure,plot(t1)
p=nframes-1;
figure,imshow((img_corr_l(:,:,p)))
hold on
plot(x_l(p),y_l(p),'o')
toc

% --- Executes on button press in l_test.
function l_test_Callback(hObject, eventdata, handles)
% hObject    handle to l_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Generating Video and Plotting Displacement');
f=rate;
videoPlayer = vision.VideoPlayer('Position', [100, 100, width, height]);
pause(2);
for i=1:nframes-1
    if i<nframes
        pause(0.1);
        track_img=insertMarker(img_corr_l(:,:,i),[x_l(i),y_l(i)],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[u_l(i),v_l(i)],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        y_prime_l(i)= v_l(i)-y_l(i);
        x_prime_l(i)= u_l(i)-x_l(i);
        theta_l(i)=atan2d(y_prime_l(i),x_prime_l(i));
        hold on
        plot(i,theta_l(i),'o')
    else
        theta_l(i)=NaN;
        pause(0.1);
        track_img=insertMarker(img_corr_l(:,:,i),[2000,2000],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[2000,2000],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        x_prime_l(i)=NaN;
        y_prime_l(i)=NaN;
        hold on
        plot(i,theta_l(i),'o')
    end
    img_video_l(:,:,:,i)=track_img1;
end

% --- Executes on button press in l_coordinates.
function l_coordinates_Callback(hObject, eventdata, handles)
% hObject    handle to l_coordinates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
close all
disp('Changing the coordinate to original formate');
for i=1:nframes-1
x_l(i)=rec1_l(1,1)+x_l(i);
y_l(i)=rec1_l(1,2)+y_l(i);
end
% p=9;
% figure,imshow((img_gray(:,:,p)))
% hold on
% plot(x_l(p),y_l(p),'o')
toc

function l_frame_Callback(hObject, eventdata, handles)
% hObject    handle to l_frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l_frame as text
%        str2double(get(hObject,'String')) returns contents of l_frame as a double
handles.left=str2double(get(hObject,'String'));
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function l_frame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l_frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in l_displacement.
function l_displacement_Callback(hObject, eventdata, handles)
% hObject    handle to l_displacement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
close all
disp('Generating Video and Plotting Displacement');
f=rate;
videoPlayer = vision.VideoPlayer('Position', [100, 100, width, height]);
pause(2);
for i=1:nframes-1
    if  i>11 && i<84 || i>115
        pause(0.02);
        track_img=insertMarker(img_gray(:,:,i),[x_l(i),y_l(i)],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[u_l(i),v_l(i)],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        y_prime_l(i)= v_l(i)-y_l(i);
        x_prime_l(i)= u_l(i)-x_l(i);
        theta_l(i)=atan2d(y_prime_l(i),x_prime_l(i));
%         hold on
%         plot(i,theta_l(i),'o')
    else
        theta_l(i)=NaN;
        pause(0.02);
        track_img=insertMarker(img_gray(:,:,i),[2000,2000],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[2000,2000],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        x_prime_l(i)=NaN;
        y_prime_l(i)=NaN;
%         hold on
%         plot(i,theta_l(i),'o')
    end
end
figure,plot(theta_l);
toc

% --- Executes on button press in r_contour.
function r_contour_Callback(hObject, eventdata, handles)
% hObject    handle to r_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in r_lens.
function r_lens_Callback(hObject, eventdata, handles)
% hObject    handle to r_lens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in r_test.
function r_test_Callback(hObject, eventdata, handles)
% hObject    handle to r_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in r_coordinates.
function r_coordinates_Callback(hObject, eventdata, handles)
% hObject    handle to r_coordinates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in r_displacement.
function r_displacement_Callback(hObject, eventdata, handles)
% hObject    handle to r_displacement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function r_edit_Callback(hObject, eventdata, handles)
% hObject    handle to r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r_edit as text
%        str2double(get(hObject,'String')) returns contents of r_edit as a double


% --- Executes during object creation, after setting all properties.
function r_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in head.
function head_Callback(hObject, eventdata, handles)
% hObject    handle to head (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
vect_x=u_r-u_l;
vect_y=v_r-v_l;
disp('Generating Video and Plotting Head Motion');
f=rate;
videoPlayer = vision.VideoPlayer('Position', [100, 100, width, height]);
pause(2);
for i=1:nframes-1
    if i<nframes
        track_img=insertMarker(img_gray(:,:,i),[u_r(i),v_r(i)],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[u_l(i),v_l(i)],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        head_theta(i)=atan2d(vect_y(i),vect_x(i));
        hold on
        plot(i,head_theta(i),'o')
    else
        track_img=insertMarker(img_gray(:,:,i),[2000,2000],'*','color','red','size',8);
        track_img1=insertMarker(track_img,[2000,2000],'o','color','red','size',8);
        step(videoPlayer,track_img1);
        head_theta(i)=NaN;
        hold on
        plot(i,head_theta(i),'o')
    end
end
figure,plot(head_theta)
h2=warndlg('Entire Tracking Processing is done');
waitfor(h2);

% --- Executes on button press in jer.
function jer_Callback(hObject, eventdata, handles)
% hObject    handle to jer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
close all
H=warndlg('Values for Left Eye');
waitfor(H);
%Final theta
% f=57;
q=head_theta(~isnan(head_theta));
head_theta=head_theta-q(1);
p1=theta_l(~isnan(theta_l));
theta_l=theta_l-p1(1);
for i=1:nframes-1
    if isnan(head_theta(i))
        final_theta_l(i)=theta_l(i);
    else
        final_theta_l(i)=theta_l(i)-head_theta(i);
    end
end
p=final_theta_l(~isnan(final_theta_l));
final_theta_l=final_theta_l-p(1);
% figure,plot(head_theta(60:378))
total_dis=sum(final_theta_l(~isnan(final_theta_l)));
m1=max(final_theta_l);
m2=min(final_theta_l);
p2p_dis_l=m1-m2;
t=0:1/f:1/f*1000;
% figure,plot(t(1:size(final_theta_l,2)),final_theta_l)
% figure,plot(t(1:size(theta_l,2)),theta_l);
% figure,plot(t(1:size(final_theta_l,2)),final_theta_l)
% ylim([-110 120])
% figure,plot(t(1:size(theta_l,2)),theta_l);
% ylim([-110 120])

%Velocity
for i=2:size(final_theta_l,2)
    velocity_l(i)=((final_theta_l(i)-final_theta_l(i-1))*f);
end
tot_vel_pos=sum(velocity_l(velocity_l>0));
tot_vel_neg=sum(velocity_l(velocity_l<0));
m1_vel_pos=max(velocity_l(velocity_l>0));
m2_vel_neg=min(velocity_l(velocity_l>0));
p2p_vel_pos=(m1_vel_pos-m2_vel_neg)/nframes;
m1_vel_pos=max(velocity_l(velocity_l<0));
m2_vel_neg=min(velocity_l(velocity_l<0));
p2p_vel_neg=(m1_vel_pos-m2_vel_neg)/nframes;
Avg_vel_l=(p2p_vel_pos+p2p_vel_neg)/2;
% figure,plot(t(1:size(velocity,2)),velocity);

%Acceleration
for i=2:size(velocity_l,2)
    ace_l(i)=((velocity_l(i)-velocity_l(i-1))*f);
end
tot_ace_pos=sum(ace_l(ace_l>0));
tot_ace_neg=sum(ace_l(ace_l<0));
m1_ace_pos=max(ace_l(ace_l>0));
m1_ace_neg=min(ace_l(ace_l>0));
p2p_ace_pos=(m1_ace_pos-m1_ace_neg)/nframes;
m1_ace_pos=max(ace_l(ace_l<0));
m2_ace_neg=min(ace_l(ace_l<0));
p2p_ace_neg=(m1_ace_pos-m2_ace_neg)/nframes;
Avg_Acc_l=(p2p_ace_pos+p2p_ace_neg)/2;
% figure,plot(t(1:size(ace,2)),ace)

%Jerk
for i=2:size(ace_l,2)
    jerk_l(i)=((ace_l(i)-ace_l(i-1))*f);
end
tot_jerk_pos=sum(jerk_l(jerk_l>0));
tot_jerk_neg=sum(jerk_l(jerk_l<0));
m1_jerk_pos=max(jerk_l(jerk_l>0));
m1_jerk_neg=min(jerk_l(jerk_l>0));
p2p_jerk_pos=(m1_jerk_pos-m1_jerk_neg)/nframes;
m1_jerk_pos=max(jerk_l(jerk_l<0));
m2_jerk_neg=min(jerk_l(jerk_l<0));
p2p_jerk_neg=(m1_jerk_pos-m2_jerk_neg)/nframes;
Avg_jerk_l=(p2p_jerk_pos+p2p_jerk_neg)/2;
% figure,plot(t(1:size(jerk,2)),jerk)
% Output_l=[total_dis,p2p_dis,NaN,tot_vel_pos,tot_vel_neg,p2p_vel_pos,p2p_vel_neg,NaN,NaN,NaN,NaN,tot_ace_pos,tot_ace_neg,p2p_ace_pos,p2p_ace_neg,NaN,NaN,NaN,NaN,tot_jerk_pos,tot_jerk_neg,p2p_jerk_pos,p2p_jerk_neg]

%Final theta
H=warndlg('Values for Right Eye');
waitfor(H);
% f=57;
q=head_theta(~isnan(head_theta));
head_theta=head_theta-q(1);
p1=theta_r(~isnan(theta_r));
theta_r=theta_r-p1(1);
for i=1:nframes-1
    if isnan(head_theta(i))
        final_theta_r(i)=theta_r(i);
    else
        final_theta_r(i)=theta_r(i)-head_theta(i);
    end
end
p=final_theta_r(~isnan(final_theta_r));
final_theta_r=final_theta_r-p(1);
% figure,plot(head_theta(60:378))
total_dis=sum(final_theta_r(~isnan(final_theta_r)));
m1=max(final_theta_r);
m2=min(final_theta_r);
p2p_dis_r=m1-m2
t=0:1/f:1/f*1000;
% figure,plot(t(1:size(final_theta_r,2)),final_theta_r)
% figure,plot(t(1:size(theta_r,2)),theta_r);
% figure,plot(t(1:size(final_theta_r,2)),final_theta_r)
% ylim([-110 120])
% figure,plot(t(1:size(theta_r,2)),theta_r);
% ylim([-110 120])

%Velocity
for i=2:size(final_theta_r,2)
    velocity_r(i)=((final_theta_r(i)-final_theta_r(i-1))*f);
end
tot_vel_pos=sum(velocity_r(velocity_r>0));
tot_vel_neg=sum(velocity_r(velocity_r<0));
m1_vel_pos=max(velocity_r(velocity_r>0));
m2_vel_neg=min(velocity_r(velocity_r>0));
p2p_vel_pos=(m1_vel_pos-m2_vel_neg)/nframes;
m1_vel_pos=max(velocity_l(velocity_l<0));
m2_vel_neg=min(velocity_l(velocity_l<0));
p2p_vel_neg=(m1_vel_pos-m2_vel_neg)/nframes;
Avg_vel_r=(p2p_vel_pos+p2p_vel_neg)/2;
% figure,plot(t(1:size(velocity,2)),velocity);

%Acceleration
for i=2:size(velocity_r,2)
    ace_r(i)=((velocity_r(i)-velocity_r(i-1))*f);
end
tot_ace_pos=sum(ace_r(ace_r>0));
tot_ace_neg=sum(ace_r(ace_r<0));
m1_ace_pos=max(ace_r(ace_r>0));
m1_ace_neg=min(ace_r(ace_r>0));
p2p_ace_pos=(m1_ace_pos-m1_ace_neg)/nframes;
m1_ace_pos=max(ace_l(ace_l<0));
m2_ace_neg=min(ace_l(ace_l<0));
p2p_ace_neg=(m1_ace_pos-m2_ace_neg)/nframes;
Avg_Acc_r=(p2p_ace_pos+p2p_ace_neg)/2;
% figure,plot(t(1:size(ace,2)),ace)

%Jerk
for i=2:size(ace_r,2)
    jerk_r(i)=((ace_r(i)-ace_r(i-1))*f);
end
tot_jerk_pos=sum(jerk_r(jerk_r>0));
tot_jerk_neg=sum(jerk_r(jerk_r<0));
m1_jerk_pos=max(jerk_r(jerk_r>0));
m1_jerk_neg=min(jerk_r(jerk_r>0));
p2p_jerk_pos=(m1_jerk_pos-m1_jerk_neg)/nframes;
m1_jerk_pos=max(jerk_l(jerk_l<0));
m2_jerk_neg=min(jerk_l(jerk_l<0));
p2p_jerk_neg=(m1_jerk_pos-m2_jerk_neg)/nframes;
Avg_jerk_r=(p2p_jerk_pos+p2p_jerk_neg)/2;
% figure,plot(t(1:size(jerk,2)),jerk)
% Output_r=[total_dis,p2p_dis,NaN,tot_vel_pos,tot_vel_neg,p2p_vel_pos,p2p_vel_neg,NaN,NaN,NaN,NaN,tot_ace_pos,tot_ace_neg,p2p_ace_pos,p2p_ace_neg,NaN,NaN,NaN,NaN,tot_jerk_pos,tot_jerk_neg,p2p_jerk_pos,p2p_jerk_neg]

h1=figure;
plot(t(1:size(final_theta_r,2)),final_theta_r,t(1:size(final_theta_l,2)),final_theta_l);
kkk=strfind(fname,'.');
path_n='F:\New Datas_Protocal_02052015\Patient35_36_04132015\801229986\Figures\';
s1=fname(1:kkk-1);
s1=strcat(path_n,s1);
saveas(h1,s1,'jpg');
h2=figure;
plot(t(1:size(final_theta_r,2)),final_theta_r,t(1:size(final_theta_l,2)),final_theta_l);
ylim([-150 100])
s0='_1';
fname1=strcat(s1,s0);
saveas(h2,fname1,'jpg')

% --- Executes on button press in correlation.
function correlation_Callback(hObject, eventdata, handles)
% hObject    handle to correlation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Correlation
m1=(final_theta_l);
m1=m1(~isnan(m1));
m2=(final_theta_r);
m2=m2(~isnan(m2));
disp('Without ABS');
% figure,plot(m1,m2);
cor2=corr2(m1,m2(1:size(m1,2)))
cor2=corr2(m2,m1(1:size(m2,2)))

% --- Executes on button press in excel.
function excel_Callback(hObject, eventdata, handles)
% hObject    handle to excel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Creating Excel File
tic
sheetno=4
s=struct;
s1=struct;
s2=struct;
s3=struct;
s1.Gestational_Age= GA;
s1.Height=height;
s1.Width=width;
s1.NFrames=nframes;
s1.videoName=fname
s1.Frequency=rate;
s1.Correlation= cor2;
s1.Stumili=0
s2.P2P_Distance=p2p_dis_l;
s2.Average_Velocity=Avg_vel_l;
s2.Average_Acceleration=Avg_Acc_l;
s2.Average_Jerk=Avg_jerk_l;
s3.P2P_Distance=p2p_dis_r;
s3.Average_Velocity=Avg_vel_r;
s3.Average_Acceleration=Avg_Acc_r;
s3.Average_Jerk=Avg_jerk_r;
s.u_l=u_l';
s.v_l=v_l';
s.u_r=u_r';
s.v_r=v_r';
s.x_l=x_prime_l';
s.y_l=y_prime_l';
s.x_r=x_prime_r';
s.y_r=y_prime_r';
s.head_theta=head_theta';
s.final_theta_l=final_theta_l';
s.final_theta_r=final_theta_r';
s.velocity_l=velocity_l';
s.velocity_r=velocity_r';
s.ace_l=ace_l';
s.ace_r=ace_r';
s.jerk_l=jerk_l';
s.jerk_r=jerk_r';
T=struct2table(s);
T1=struct2table(s1);
T2=struct2table(s2);
T3=struct2table(s3);
warning('off','MATLAB:xlswrite:AddSheet')
path1='F:\New Datas_Protocal_02052015\Case_excel\';
typ='.xls';
fna='case-35';
fna1=strcat(path1,fna);
fname1=strcat(fna1,typ);
writetable(T1,fname1,'sheet',sheetno)
writetable(T2,fname1,'sheet',sheetno,'Range','A5')
writetable(T3,fname1,'sheet',sheetno,'Range','A10')
writetable(T,fname1,'sheet',sheetno,'Range','A15')
% close('C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_02052015\HUZ684128\HUZ6841.xls')
toc
