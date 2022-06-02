function avgfeatures = ecg_plot(pr,n,cf,file1, file2, file3, file4, file5, file6, file7, file8)
% file 1 (refreshed data)
    data1(:,2) = file1(1:120001,6);
    data1(:,1) = (1:length(data1(:,2)))/1000;
% file 2 (0 min)
    data2(:,2) = file2(1:30001,6);
    data2(:,1) = (1:length(data2(:,2)))/1000;
% file 3 (10 min)
    data3(:,2) = file3(1:30001,6);
    data3(:,1) = (1:length(data3(:,2)))/1000;
% file 4 (20 min)
    data4(:,2) = file4(1:30001,6);
    data4(:,1) = (1:length(data4(:,2)))/1000;
% file 5 (30 min)
    data5(:,2) = file5(1:30001,6);
    data5(:,1) = (1:length(data5(:,2)))/1000;
% file 6 (40 min)
    data6(:,2) = file6(1:30001,6);
    data6(:,1) = (1:length(data6(:,2)))/1000;
% file 7 (50 min)
    data7(:,2) = file7(1:30001,6);
    data7(:,1) = (1:length(data7(:,2)))/1000;
% file 8 (60 min)
    data8(:,2) = file8(1:30001,6);
    data8(:,1) = (1:length(data8(:,2)))/1000;
    
%graphing raw data
    figure
    subplot(4,2,1)
    hold on
    plot(data1(:,1),data1(:,2))
    title("ECG Signal - Refreshed State")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
    xlim([0 120])
    hold off
%0 min
    subplot(4,2,2)
    hold on
    plot(data2(:,1),data2(:,2))
    title("ECG Signal at 0min")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
    hold off
%10 min
    subplot(4,2,3)
    hold on
    plot(data3(:,1),data3(:,2))
    title("ECG Signal at 10min")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
    hold off
%20 min
    subplot(4,2,4)
    hold on
    plot(data4(:,1),data4(:,2))
    title("ECG Signal at 20min")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
    hold off
%30 min
    subplot(4,2,5)
    hold on
    plot(data5(:,1),data5(:,2))
    title("ECG Signal at 30min")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
    hold off
%40 min
    subplot(4,2,6)
    hold on
    plot(data6(:,1),data6(:,2))
    title("ECG Signal at 40min")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
    hold off
%50 min
    subplot(4,2,7)
    hold on
    plot(data7(:,1),data7(:,2))
    title("ECG Signal at 50min")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
    hold off
%60 min
    subplot(4,2,8)
    hold on
    plot(data8(:,1),data8(:,2))
    title("ECG Signal at 60min")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
    hold off
    
% Filter Raw Data
    [b,a] = butter(n,cf/1000,'low');
    data1 = filtfilt(b,a,data1);
    data2 = filtfilt(b,a,data2);
    data3 = filtfilt(b,a,data3);
    data4 = filtfilt(b,a,data4);
    data5 = filtfilt(b,a,data5);
    data6 = filtfilt(b,a,data6);
    data7 = filtfilt(b,a,data7);
    data8 = filtfilt(b,a,data8);
    
%Filtered Results - Rest Day
    figure
    % Find local maxima
    [pks1,locs1] = findpeaks(data1(:,2),data1(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    subplot(4,2,1)
    findpeaks(data1(:,2),data1(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    title("ECG Signal - Refreshed State")
    legend("Voltage","R-Wave")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
    xlim([0 120])
%Filtered Results - 0min
    % Find local maxima
    [pks2,locs2] = findpeaks(data2(:,2),data2(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    subplot(4,2,2)
    findpeaks(data2(:,2),data2(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    title("ECG Signal at 0min")
    legend("Voltage","R-Wave")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
%Filtered Results - 10 min
    % Find local maxima
    [pks3,locs3] = findpeaks(data3(:,2),data3(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    subplot(4,2,3)
    findpeaks(data3(:,2),data3(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    title("ECG Signal at 10min")
    legend("Voltage","R-Wave")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
%Filtered Results - 20 min
    % Find local maxima
    [pks4,locs4] = findpeaks(data4(:,2),data4(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    subplot(4,2,4)
    findpeaks(data4(:,2),data4(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    title("ECG Signal at 20min")
    legend("Voltage","R-Wave")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
%Filtered Results - 30 min
    % Find local maxima
    [pks5,locs5] = findpeaks(data5(:,2),data5(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    subplot(4,2,5)
    findpeaks(data5(:,2),data5(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    title("ECG Signal at 30min")
    legend("Voltage","R-Wave")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
%Filtered Results - 40 min
    % Find local maxima
    [pks6,locs6] = findpeaks(data6(:,2),data6(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    subplot(4,2,6)
    findpeaks(data6(:,2),data6(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    title("ECG Signal at 40min")
    legend("Voltage","R-Wave")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
%Filtered Results - 50 min
    % Find local maxima
    [pks7,locs7] = findpeaks(data7(:,2),data7(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    subplot(4,2,7)
    findpeaks(data7(:,2),data7(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    title("ECG Signal at 50min")
    legend("Voltage","R-Wave")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")
%Filtered Results - 60 min
    % Find local maxima
    [pks8,locs8] = findpeaks(data8(:,2),data8(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    subplot(4,2,8)
    findpeaks(data8(:,2),data8(:,1),'MinPeakProminence',pr,'MinPeakDistance',.75);
    title("ECG Signal at 60min")
    legend("Voltage","R-Wave")
    xlabel("Time (s)")
    ylabel("Voltage (mV)")

% HR with R wave time locations
    HR1 = (length(locs1))/2;
    HR2 = length(locs2)*2;
    HR3 = length(locs3)*2;
    HR4 = length(locs4)*2;
    HR5 = length(locs5)*2;
    HR6 = length(locs6)*2;
    HR7 = length(locs7)*2;
    HR8 = length(locs8)*2;
    ecgfeatures(1,:) = [HR1, HR2, HR3, HR4, HR5, HR6, HR7, HR8];

% HRV wth R wave time locations
    HRV1 = diff(locs1);
    HRV1 = rms(HRV1);
    HRV2 = diff(locs2);
    HRV2 = rms(HRV2);
    HRV3 = diff(locs3);
    HRV3 = rms(HRV3);
    HRV4 = diff(locs4);
    HRV4 = rms(HRV4);
    HRV5 = diff(locs5);
    HRV5 = rms(HRV5);
    HRV6 = diff(locs6);
    HRV6 = rms(HRV6);
    HRV7 = diff(locs7);
    HRV7 = rms(HRV7);
    HRV8 = diff(locs8);
    HRV8 = rms(HRV8);
    ecgfeatures(2,:) = [HRV1, HRV2, HRV3, HRV4, HRV5, HRV6, HRV7, HRV8];

%Plot Trends of heart rate features
    figure
    subplot(2,1,1)
    plot(1:8,ecgfeatures(2,:))
    xlabel('Test Number')
    ylabel('HRV Value (ms)')
    title('Heart Rate Variability Trend')
    subplot(2,1,2)
    plot(1:8,ecgfeatures(1,:))
    xlabel('Test Number')
    ylabel('HR Value (BPM)')
    title('Heart Rate Trend')
    
% Frequency Things
    ecg_data_filtered = data1(:,2);
    ecg_time = data1(:,1);

    figure
    subplot(4,2,1)
    periodogram(ecg_data_filtered,rectwin(length(ecg_data_filtered)),length(ecg_data_filtered),1000);
    xlim([0.003 .4]);
    tp_lims = (ecg_time >= 0.003) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(tp_lims),ecg_data_filtered(tp_lims));
    tp_average = abs((1/(.4-.003))*Integral);
    lf_lims = (ecg_time >= 0.04) & (ecg_time <= 0.15);
    Integral = trapz(ecg_time(lf_lims),ecg_data_filtered(lf_lims));
    Low_average = abs((1/(.15-.04))*Integral);
    Low_average_relative = Low_average/tp_average;
    hf_lims = (ecg_time >= 0.15) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(hf_lims),ecg_data_filtered(hf_lims));
    High_average = abs((1/(.15-.4))*Integral);
    High_average_relative = High_average/tp_average;
    lf_hf_ratio = Low_average/High_average;
    ecgfeatures(3,1) = tp_average;
    ecgfeatures(4,1) = Low_average;
    ecgfeatures(5,1) = Low_average_relative;
    ecgfeatures(6,1) = High_average;
    ecgfeatures(7,1) = High_average_relative;
    ecgfeatures(8,1) = lf_hf_ratio;
    hold off

    ecg_data_filtered = data2(:,2);
    ecg_time = data2(:,1);
    subplot(4,2,2)
    periodogram(ecg_data_filtered,rectwin(length(ecg_data_filtered)),length(ecg_data_filtered),1000);
    xlim([0.003 .4]);
    tp_lims = (ecg_time >= 0.003) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(tp_lims),ecg_data_filtered(tp_lims));
    tp_average = abs((1/(.4-.003))*Integral);
    lf_lims = (ecg_time >= 0.04) & (ecg_time <= 0.15);
    Integral = trapz(ecg_time(lf_lims),ecg_data_filtered(lf_lims));
    Low_average = abs((1/(.15-.04))*Integral);
    Low_average_relative = Low_average/tp_average;
    hf_lims = (ecg_time >= 0.15) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(hf_lims),ecg_data_filtered(hf_lims));
    High_average = abs((1/(.15-.4))*Integral);
    High_average_relative = High_average/tp_average;
    lf_hf_ratio = Low_average/High_average;
    ecgfeatures(3,2) = tp_average;
    ecgfeatures(4,2) = Low_average;
    ecgfeatures(5,2) = Low_average_relative;
    ecgfeatures(6,2) = High_average;
    ecgfeatures(7,2) = High_average_relative;
    ecgfeatures(8,2) = lf_hf_ratio;
    hold off

    ecg_data_filtered = data3(:,2);
    ecg_time = data3(:,1);
    subplot(4,2,3)
    periodogram(ecg_data_filtered,rectwin(length(ecg_data_filtered)),length(ecg_data_filtered),1000);
    xlim([0.003 .4]);
    tp_lims = (ecg_time >= 0.003) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(tp_lims),ecg_data_filtered(tp_lims));
    tp_average = abs((1/(.4-.003))*Integral);
    lf_lims = (ecg_time >= 0.04) & (ecg_time <= 0.15);
    Integral = trapz(ecg_time(lf_lims),ecg_data_filtered(lf_lims));
    Low_average = abs((1/(.15-.04))*Integral);
    Low_average_relative = Low_average/tp_average;
    hf_lims = (ecg_time >= 0.15) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(hf_lims),ecg_data_filtered(hf_lims));
    High_average = abs((1/(.15-.4))*Integral);
    High_average_relative = High_average/tp_average;
    lf_hf_ratio = Low_average/High_average;
    ecgfeatures(3,3) = tp_average;
    ecgfeatures(4,3) = Low_average;
    ecgfeatures(5,3) = Low_average_relative;
    ecgfeatures(6,3) = High_average;
    ecgfeatures(7,3) = High_average_relative;
    ecgfeatures(8,3) = lf_hf_ratio;
    hold off

    ecg_data_filtered = data4(:,2);
    ecg_time = data4(:,1);
    subplot(4,2,4)
    periodogram(ecg_data_filtered,rectwin(length(ecg_data_filtered)),length(ecg_data_filtered),1000);
    xlim([0.003 .4]);
    tp_lims = (ecg_time >= 0.003) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(tp_lims),ecg_data_filtered(tp_lims));
    tp_average = abs((1/(.4-.003))*Integral);
    lf_lims = (ecg_time >= 0.04) & (ecg_time <= 0.15);
    Integral = trapz(ecg_time(lf_lims),ecg_data_filtered(lf_lims));
    Low_average = abs((1/(.15-.04))*Integral);
    Low_average_relative = Low_average/tp_average;
    hf_lims = (ecg_time >= 0.15) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(hf_lims),ecg_data_filtered(hf_lims));
    High_average = abs((1/(.15-.4))*Integral);
    High_average_relative = High_average/tp_average;
    lf_hf_ratio = Low_average/High_average;
    ecgfeatures(3,4) = tp_average;
    ecgfeatures(4,4) = Low_average;
    ecgfeatures(5,4) = Low_average_relative;
    ecgfeatures(6,4) = High_average;
    ecgfeatures(7,4) = High_average_relative;
    ecgfeatures(8,4) = lf_hf_ratio;
    hold off

    ecg_data_filtered = data5(:,2);
    ecg_time = data5(:,1);
    subplot(4,2,5)
    periodogram(ecg_data_filtered,rectwin(length(ecg_data_filtered)),length(ecg_data_filtered),1000);
    xlim([0.003 .4]);
    tp_lims = (ecg_time >= 0.003) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(tp_lims),ecg_data_filtered(tp_lims));
    tp_average = abs((1/(.4-.003))*Integral);
    lf_lims = (ecg_time >= 0.04) & (ecg_time <= 0.15);
    Integral = trapz(ecg_time(lf_lims),ecg_data_filtered(lf_lims));
    Low_average = abs((1/(.15-.04))*Integral);
    Low_average_relative = Low_average/tp_average;
    hf_lims = (ecg_time >= 0.15) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(hf_lims),ecg_data_filtered(hf_lims));
    High_average = abs((1/(.15-.4))*Integral);
    High_average_relative = High_average/tp_average;
    lf_hf_ratio = Low_average/High_average;
    ecgfeatures(3,5) = tp_average;
    ecgfeatures(4,5) = Low_average;
    ecgfeatures(5,5) = Low_average_relative;
    ecgfeatures(6,5) = High_average;
    ecgfeatures(7,5) = High_average_relative;
    ecgfeatures(8,5) = lf_hf_ratio;
    hold off

    ecg_data_filtered = data6(:,2);
    ecg_time = data6(:,1);
    subplot(4,2,6)
    periodogram(ecg_data_filtered,rectwin(length(ecg_data_filtered)),length(ecg_data_filtered),1000);
    xlim([0.003 .4]);
    tp_lims = (ecg_time >= 0.003) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(tp_lims),ecg_data_filtered(tp_lims));
    tp_average = abs((1/(.4-.003))*Integral);
    lf_lims = (ecg_time >= 0.04) & (ecg_time <= 0.15);
    Integral = trapz(ecg_time(lf_lims),ecg_data_filtered(lf_lims));
    Low_average = abs((1/(.15-.04))*Integral);
    Low_average_relative = Low_average/tp_average;
    hf_lims = (ecg_time >= 0.15) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(hf_lims),ecg_data_filtered(hf_lims));
    High_average = abs((1/(.15-.4))*Integral);
    High_average_relative = High_average/tp_average;
    lf_hf_ratio = Low_average/High_average;
    ecgfeatures(3,6) = tp_average;
    ecgfeatures(4,6) = Low_average;
    ecgfeatures(5,6) = Low_average_relative;
    ecgfeatures(6,6) = High_average;
    ecgfeatures(7,6) = High_average_relative;
    ecgfeatures(8,6) = lf_hf_ratio;
    hold off

    ecg_data_filtered = data7(:,2);
    ecg_time = data7(:,1);
    subplot(4,2,7)
    periodogram(ecg_data_filtered,rectwin(length(ecg_data_filtered)),length(ecg_data_filtered),1000);
    xlim([0.003 .4]);
    tp_lims = (ecg_time >= 0.003) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(tp_lims),ecg_data_filtered(tp_lims));
    tp_average = abs((1/(.4-.003))*Integral);
    lf_lims = (ecg_time >= 0.04) & (ecg_time <= 0.15);
    Integral = trapz(ecg_time(lf_lims),ecg_data_filtered(lf_lims));
    Low_average = abs((1/(.15-.04))*Integral);
    Low_average_relative = Low_average/tp_average;
    hf_lims = (ecg_time >= 0.15) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(hf_lims),ecg_data_filtered(hf_lims));
    High_average = abs((1/(.15-.4))*Integral);
    High_average_relative = High_average/tp_average;
    lf_hf_ratio = Low_average/High_average;
    ecgfeatures(3,7) = tp_average;
    ecgfeatures(4,7) = Low_average;
    ecgfeatures(5,7) = Low_average_relative;
    ecgfeatures(6,7) = High_average;
    ecgfeatures(7,7) = High_average_relative;
    ecgfeatures(8,7) = lf_hf_ratio;
    hold off

    ecg_data_filtered = data8(:,2);
    ecg_time = data8(:,1);
    subplot(4,2,8)
    periodogram(ecg_data_filtered,rectwin(length(ecg_data_filtered)),length(ecg_data_filtered),1000);
    xlim([0.003 .4]);
    tp_lims = (ecg_time >= 0.003) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(tp_lims),ecg_data_filtered(tp_lims));
    tp_average = abs((1/(.4-.003))*Integral);
    lf_lims = (ecg_time >= 0.04) & (ecg_time <= 0.15);
    Integral = trapz(ecg_time(lf_lims),ecg_data_filtered(lf_lims));
    Low_average = abs((1/(.15-.04))*Integral);
    Low_average_relative = Low_average/tp_average;
    hf_lims = (ecg_time >= 0.15) & (ecg_time <= 0.4);
    Integral = trapz(ecg_time(hf_lims),ecg_data_filtered(hf_lims));
    High_average = abs((1/(.15-.4))*Integral);
    High_average_relative = High_average/tp_average;
    lf_hf_ratio = Low_average/High_average;
    ecgfeatures(3,8) = tp_average;
    ecgfeatures(4,8) = Low_average;
    ecgfeatures(5,8) = Low_average_relative;
    ecgfeatures(6,8) = High_average;
    ecgfeatures(7,8) = High_average_relative;
    ecgfeatures(8,8) = lf_hf_ratio;
    hold off

    %put everything together
    avgfeatures(1,1) = HR1;
    avgfeatures(1,2) = HRV1;
    avgfeatures(1,3) = ecgfeatures(8,1);
    avgfeatures(1,4) = mean(ecgfeatures(1,:));
    avgfeatures(1,5) = mean(ecgfeatures(2,:));
    avgfeatures(1,6) = mean(ecgfeatures(8,:));
    avgfeatures = array2table(avgfeatures,"VariableNames",["Morning HR (bpm)", "Morning HRV (s)","Morning Freq Ratio (Hz)","Test HR (bpm)","Test HRV(s)","Freq Ratio (Hz)"]);
