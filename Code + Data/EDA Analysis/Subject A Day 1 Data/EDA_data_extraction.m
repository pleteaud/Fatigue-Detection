close all 
clear vars 
clc
% list of file names
fileName = ['Day 1 Morning EDA Results Davo.txt',...
            'Davo Day 1 Afternoon before Test ECG andEDA Results.txt',...
            'Davo Day 1 Afternoon TEST 1 ECG AND EDA.txt', 'Davo Day 1 AFTERNOON TEST 2 ECG AND EDA.txt',...
            'Davo Day 1 AFTERNOON TEST 3 ECG AND EDA.txt','Davo Day 1 AFTERNOON TEST 4 ECG AND EDA.txt',...
            'Davo Day 1 AFTERNOON TEST 5 ECG AND EDA.txt', 'Davo Day 1 AFTERNOON TEST 6 ECG AND EDA.txt'];

%Morning Refresh
D1R=readmatrix('Day 1 Morning EDA Results Davo.txt');
EDAD1R = D1R(:,6); %desired ecg output A2
TD1R = 1:length(D1R);
TD1R = TD1R/1000;
%Time = 0
D10=readmatrix('Davo Day 1 Afternoon before Test ECG andEDA Results.txt');
EDAD10 = D10(:,7); %desired ecg output A2
TD10 = 1:length(D10);
TD10 = TD10/1000;
%Time = 10
D11=readmatrix('Davo Day 1 Afternoon TEST 1 ECG AND EDA.txt');
EDAD11 = D11(:,7); %desired ecg output A2
TD11 = 1:length(D11);
TD11 = TD11/1000;
%Time = 20
D12=readmatrix('Davo Day 1 AFTERNOON TEST 2 ECG AND EDA.txt');
EDAD12 = D12(:,7); %desired ecg output A2
TD12 = 1:length(D12);
TD12 = TD12/1000;
%Time = 30
D13=readmatrix('Davo Day 1 AFTERNOON TEST 3 ECG AND EDA.txt');
EDAD13 = D13(:,7); %desired ecg output A2
TD13 = 1:length(D13);
TD13 = TD13/1000;
%Time = 40
D14=readmatrix('Davo Day 1 AFTERNOON TEST 4 ECG AND EDA.txt');
EDAD14 = D14(:,7); %desired ecg output A2
TD14 = 1:length(D14);
TD14 = TD14/1000;
%Time = 50
D15=readmatrix('Davo Day 1 AFTERNOON TEST 5 ECG AND EDA.txt');
EDAD15 = D15(:,7); %desired ecg output A2
TD15 = 1:length(D15);
TD15 = TD15/1000;
%Time = 60
D16=readmatrix('Davo Day 1 AFTERNOON TEST 6 ECG AND EDA.txt');
EDAD16 = D16(:,7); %desired ecg output A2
TD16 = 1:length(D16);
TD16 = TD16/1000;

%Filter and Plot
%Refreshed State
fftEDAD1R=fft(EDAD1R);
[maxValue] = max(fftEDAD1R);
fD1R = 1000/(maxValue*10^-6);
fD1R = round(fD1R);
subplot(4,2,1)
plot(TD1R,sgolayfilt(EDAD1R,1,fD1R))
ylabel('Conductance (uS)')
xlabel('Time (s)')
title('Skin Conductance - Refreshed State')
Time = 0 min
fftEDAD10=fft(EDAD10);
[maxValue] = max(fftEDAD10);
fD10 = 1000/(maxValue*10^-6);
fD10 = round(fD10);
subplot(4,2,2)
plot(TD10,sgolayfilt(EDAD10,1,fD10))
ylabel('Conductance (uS)')
xlabel('Time (s)')
title('Skin Conductance at 0min')
Time = 10 min
fftEDAD11=fft(EDAD11);
[maxValue] = max(fftEDAD11);
fD11 = 1000/(maxValue*10^-6);
fD11 = round(fD11)+1;
subplot(4,2,3)
plot(TD11,sgolayfilt(EDAD11,1,fD11))
ylabel('Conductance (uS)')
xlabel('Time (s)')
title('Skin Conductance at 10min')
Time = 20 min
fftEDAD12=fft(EDAD12);
[maxValue] = max(fftEDAD12);
fD12 = 1000/(maxValue*10^-6);
fD12 = round(fD12);
subplot(4,2,4)
plot(TD12,sgolayfilt(EDAD12,1,fD12))
ylabel('Conductance (uS)')
xlabel('Time (s)')
title('Skin Conductance at 20min')
Time = 30 min
fftEDAD13=fft(EDAD13);
[maxValue] = max(fftEDAD13);
fD13 = 1000/(maxValue*10^-6);
fD13 = round(fD13)+1;
subplot(4,2,5)
plot(TD13,sgolayfilt(EDAD13,1,fD13))
ylabel('Conductance (uS)')
xlabel('Time (s)')
title('Skin Conductance at 30min')
Time = 40 min
fftEDAD14=fft(EDAD14);
[maxValue] = max(fftEDAD14);
fD14 = 1000/(maxValue*10^-6);
fD14 = round(fD14);
subplot(4,2,6)
plot(TD14,sgolayfilt(EDAD14,1,fD14))
ylabel('Conductance (uS)')
xlabel('Time (s)')
title('Skin Conductance at 40min')
Time = 50 min
fftEDAD15=fft(EDAD15);
[maxValue] = max(fftEDAD15);
fD15 = 1000/(maxValue*10^-6);
fD15 = round(fD15);
subplot(4,2,7)
plot(TD15,sgolayfilt(EDAD15,1,fD15))
ylabel('Conductance (uS)')
xlabel('Time (s)')
title('Skin Conductance at 50min')
Time = 60 min
fftEDAD16=fft(EDAD16);
[maxValue] = max(fftEDAD16);
fD16 = 1000/(maxValue*10^-6);
fD16 = round(fD16);
subplot(4,2,8)
plot(TD16,sgolayfilt(EDAD16,1,fD16))
ylabel('Conductance (uS)')
xlabel('Time (s)')
title('Skin Conductance at 60min')
