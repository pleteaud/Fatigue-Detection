n = 120000; % number of samples in 2 minutes 
a = 0:n-1;
for c = 0:n-1
    a(1,c+1) = c*1/1000;
end

SheetNames = ["EDA_Morning", "Afternoon TEST"];
sheetName = "EDA_Morning"; % initialize to first sheet name
CellRange = "F4:F120003"; %initialize to 2 minute cell range
plotName = "Davo's baseline skin conductance (uS)"; %initialize to eda morning plot name
colorArr = ['g','b','r'];
subPlotRow = 1; %used to plot rows of EDA data
for k = 1:8
    if k >= 2
        plotName = "Davo's skin conductance (uS) at " + 10*(k-2) + "minutes";
        CellRange = 'G4:G30003';
        sheetName = "Afternoon Test " + "(" + minus(k,2) + ")";
        n = 30000; %30 seconds samples
    end
    %: Read the excel file using readtable function
    T = readtable('Dave_Day1_Data.xlsx','Sheet',sheetName,'Range',CellRange);
    %extract eda data
    edaData = T.(1)(1:n);
    subplot(2,4,k);
    plot(a(1:n)',edaData,colorArr(2));
    ylim([min(edaData)-5 max(edaData)+5])
    title(plotName);
    xlabel('Time(s)');
    ylabel('EDA value in microsiemens (uS)');
end
