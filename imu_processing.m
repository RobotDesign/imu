%% Initialization
close all;
clear all;
clc;

%% Create serial object for Arduino
baudrate = 9600; % set baudrate same as arduino
try
    s = serial('/dev/tty.usbmodemFD121','BaudRate',baudrate); % change the Port number as needed
catch
    fprintf('couldnt create serial object');
end  
s.ReadAsyncMode = 'manual';
set(s,'InputBufferSize',1000);
%% Connect the serial port to Arduino
try
    fopen(s);
    fprintf('Connected to Arduino\n');
catch err
    fclose(instrfind);
    error('Make sure you select the correct Port where the Arduino is connected.');
end

% %% Prepare Figures
% Fig = figure('Position',[9 9 913 1014],'ToolBar','none');
% Ax(1) = axes('Position',[0.04 .81 0.92 .18]);grid;hold on;
% % initialise 3 plots 
% for k = 1:3
%     H(k) = plot(0,0);
% end
% Ax(2) = axes('Position',[.15 0.03 .7 .7],'CameraPosition',[-9.1314 -11.9003 8.6603]);hold on;
% axis([-1 1 -1 1 -1 1]);
%% Process the data from Arduino
fprintf('pre-loop\n');
fprintf('%d\n', s.BytesAvailable);
while s.BytesAvailable
   buff = readasync(s, s.BytesAvailable); 
   fprintf('%s\n', buff);
end