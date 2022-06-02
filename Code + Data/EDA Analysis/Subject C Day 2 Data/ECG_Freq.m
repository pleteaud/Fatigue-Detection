k = 9;
i = 0;
figList = [1 2 3];
close all;
heart_rates = zeros(1,9);
hrvs = zeros(1,9);

ECG_reading(0,figList(2),1,60,1,1,5,50)
ECG_reading(0,figList(2),60,120,1,1,5,50)
% %Acquire Raw data
% figure(1);
% for j=1:8
%     subplot(2,4,j);
%     if j == 1
%         ECG_reading(j-1,figList(1),1,120,0,0,5,50);
%     else
%         ECG_reading(j-1,figList(1),1,30,0,0,5,50);
%     end
% end
% 
% %Acquire filtered data
% figure(2);
% for j=1:8
%     subplot(2,4,j);
%     if j == 1
%         ECG_reading(j-1,figList(2),1,120,1,0,5,50);
%     else
%         ECG_reading(j-1,figList(2),1,30,1,0,5,50);
%     end
% end

%Acquire filtered and peak data
% figure(3);
% for j=1:8
%     subplot(2,4,j);
%     if j == 1
%         ECG_reading(j-1,figList(3),1,120,1,1,5,50);
%     else
%         ECG_reading(j-1,figList(3),1,30,1,1,5,50);
%     end
% end

% for j=1:k
%     if i == 0
%         [heart_rates(j), hrvs(j)] = ECG_reading(1,1,28,1,1,5,50);
%     else
%         [heart_rates(j), hrvs(j)] = ECG_reading(1,i,i+5,1,1,5,50);
%     end
%     i = i + 2.5;
% end
% intervals = 1:9;
% figure(2)
% plot(intervals,heart_rates);
% title('Average heart rate at 60s intervals');
% ylabel('Average heart rate')
% xlabel('Intervals (60s)')
% grid on;
% 
% figure(3)
% plot(intervals,hrvs);
% title('Average heart rate variability at 60s intervals');
% ylabel('Average heart rate variability')
% xlabel('Intervals (60s)')
% grid on;
% figure(4)
% plot(intervals,breath_rates);
% title('Average breath rate at 60s intervals');
% ylabel('Average breath rate')
% xlabel('Intervals (60s)')
% grid on;



function [heart_rate, hrv] = ECG_reading(fileID,figID,startTime,endTime,apply_filter,apply_peak,n_order,f_c)
%close all
timeLabel = "Time(s)";
mvLabel = "Voltage(mV)";
switch fileID
    case 0
        file_name = 'eric day 2 morning.txt'
        graphTitle = "Day 1 ECG Refreshed State-Davo (unfiltered)";
        filtGraphTitle = "Day 1 ECG Refreshed State-Davo (filtered)";
        pkTitle = "Day 1 ECG Refreshed State-Davo (filtered, peaks)";
    case 1
        file_name = 'Davo Day 1 Afternoon before Test ECG andEDA Results.txt'
        graphTitle = "Day 1 ECG Signal at 0min-Davo (unfiltered)";
        filtGraphTitle = "Day 1 ECG Signal at 0min-Davo (filtered)";
        pkTitle = "Day 1 ECG Signal at 0min-Davo (filtered, peaks)";
    case 2        
        file_name = 'Davo Day 1 Afternoon TEST 1 ECG AND EDA.txt'
        graphTitle = "Day 1 ECG Signal at 10min-Davo (unfiltered)";
        filtGraphTitle = "Day 1 ECG Signal at 10min-Davo (filtered)";
        pkTitle = "Day 1 ECG Signal at 10min-Davo (filtered, peaks)";
    case 3
        file_name = 'Davo Day 1 AFTERNOON TEST 2 ECG AND EDA.txt'
        graphTitle = "Day 1 ECG Signal at 20min-Davo (unfiltered)";
        filtGraphTitle = "Day 1 ECG Signal at 20min-Davo (filtered)";
        pkTitle = "Day 1 ECG Signal at 20min-Davo (filtered, peaks)";
    case 4
        file_name = 'Davo Day 1 AFTERNOON TEST 3 ECG AND EDA.txt'
        graphTitle = "Day 1 ECG Signal at 30min-Davo (unfiltered)";
        filtGraphTitle = "Day 1 ECG Signal at 30min-Davo (filtered)";
        pkTitle = "Day 1 ECG Signal at 30min-Davo (filtered, peaks)";
    case 5        
        file_name = 'Davo Day 1 Afternoon TEST 4 ECG AND EDA.txt'
        graphTitle = "Day 1 ECG Signal at 40min-Davo (unfiltered)";
        filtGraphTitle = "Day 1 ECG Signal at 40min-Davo (filtered)";
        pkTitle = "Day 1 ECG Signal at 40min-Davo (filtered, peaks)";
    case 6
        file_name = 'Davo Day 1 AFTERNOON TEST 5 ECG AND EDA.txt'
        graphTitle = "Day 1 ECG Signal at 50min-Davo (unfiltered)";
        filtGraphTitle = "Day 1 ECG Signal at 50min-Davo (filtered)";
        pkTitle = "Day 1 ECG Signal at 50min-Davo (filtered, peaks)";
    otherwise
        file_name = 'Davo Day 1 AFTERNOON TEST 6 ECG AND EDA.txt'
        graphTitle = "Day 1 ECG Signal at 60min-Davo (unfiltered)";
        filtGraphTitle = "Day 1 ECG Signal at 60min-Davo (filtered)";
        pkTitle = "Day 1 ECG Signal at 60min-Davo (filtered, peaks)";
end

DD1R = readmatrix(file_name);
data = DD1R(:,7);

% sampling rate
sampl_rate = 1000;

% number of samples per sampling interval
nr_samples = 1000;
ecg_data = data;

% shorten the signal to have the same signal length in all trials
shorten_sig = 1;
%Shortening of the PPG data
ecg_time = [0:1/sampl_rate:numel(ecg_data)/sampl_rate]';
len = min (numel(ecg_data),numel(ecg_time));
ecg_time = ecg_time(1:len);
ecg_data = ecg_data(1:len);
if(shorten_sig == 1) %consider only the the interval given by Start and End Time
    ecg_data = ecg_data(startTime*sampl_rate+1:endTime*sampl_rate);
    ecg_time = ecg_time(startTime*sampl_rate+1:endTime*sampl_rate)-ecg_time(startTime*sampl_rate);
end

%Display ecg_ir versus time
if figID == 1
    figure(figID)
    plot(ecg_time, ecg_data),
    title(graphTitle);
    ylabel(mvLabel)
    xlabel(timeLabel)
    grid on
end


if apply_filter == 1
    %%%%%%%%%%%% Lowpass filtering of ECG signal %%%%%%%%%%%%%

    ecg_data_filtered = lowpass_filter(ecg_data, sampl_rate, n_order,f_c);
    
    if figID == 2
        figure(figID)
        plot(ecg_time, ecg_data_filtered), hold on
        title(filtGraphTitle)
        ylabel(mvLabel)
        xlabel(timeLabel)
        grid on
    end
end

if apply_peak == 1
    %%%%%%%%%%%%%% Find peaks %%%%%%%%%%%%%
    max_pulse = 160;
    [ppg_pks,ppg_pks_loc] = find_peaks(ecg_data_filtered, ecg_time, sampl_rate,max_pulse);
    k = numel(ppg_pks_loc);
    ux = 0;
    for i=1:k-1
        ux = ux + ppg_pks_loc(i+1) - ppg_pks_loc(i);
    end
    
    hrv = ux/(k-1);
    heart_rate = 60/hrv;
    hrv_2 = sqrt(mean(diff(ppg_pks_loc).^2));

    if figID == 3
        figure(figID)
        plot(ecg_time, ecg_data_filtered), hold on
        plot(ppg_pks_loc, ppg_pks, 'r*')
        title(pkTitle)
        ylabel(mvLabel)
        xlabel(timeLabel)
        grid on
        legend(['Heart Rate = ' num2str(heart_rate) ' beats/min'])
    end
end

%question 8
% figure(3)
% periodogram(ecg_data_filtered,rectwin(length(ecg_data_filtered)),length(ecg_data_filtered),1000);
% xlim([0.003 .4]);
% 
% tp_lims = (ecg_time >= 0.003) & (ecg_time <= 0.4);
% Integral = trapz(ecg_time(tp_lims),ecg_data_filtered(tp_lims));
% tp_average = abs((1/(.4-.003))*Integral);
% 
% lf_lims = (ecg_time >= 0.04) & (ecg_time <= 0.15);
% Integral = trapz(ecg_time(lf_lims),ecg_data_filtered(lf_lims));
% Low_average = abs((1/(.15-.04))*Integral);
% Low_average_relative = Low_average/tp_average;
% 
% hf_lims = (ecg_time >= 0.15) & (ecg_time <= 0.4);
% Integral = trapz(ecg_time(hf_lims),ecg_data_filtered(hf_lims));
% High_average = abs((1/(.15-.4))*Integral);
% High_average_relative = High_average/tp_average;
% 
% lf_hf_ratio = Low_average/High_average;


end


function data_filtered = lowpass_filter(data, sampl_rate, n_order,f_c);
[b_low,a_low] = butter(n_order,f_c/sampl_rate,'low');
data_filtered = filtfilt(b_low,a_low,data);
end

function [data_pks,data_pks_loc] = find_peaks(data, time, sampl_rate,max_pulse);
[pks,pks_loc] = findpeaks(data,'MINPEAKDISTANCE',sampl_rate);
data_pks = pks;
data_pks_loc = time(pks_loc);
end

