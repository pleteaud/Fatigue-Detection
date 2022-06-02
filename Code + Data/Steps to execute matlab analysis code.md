# Final Project EECE4512
### README File
##### Written by Nicolo Mega, Eric Alvarez, and Dave Pleteau

### Instructions on Use (ECG)
- Download and open folder "Files for MATLAB"
- Open "VisualizationDriver"
- Ensure MATLAB directory is referencing "ECG analysis" 
- Run Script
- MATLAB Live Script will display results in line with code
- Done :)

### Features of Driver (ECG)
- Imports text files recorded by bitalino board into MATLAB
- Calls function for each set of data from separate test days (3 test days for each subject)
- Cut off frequency, order, and prominence of peaks, are specified in calling the function
- Returns subplots of raw ECG data, subplots of filtered data with peaks, plots of power spectral density, and tables of HR/HRV and the ratio of high and low frequencies for each set of tests

### Features of Function (ECG)
- Data is parsed based upon desired ECG values and associated with time values (in seconds)
- Raw data from each test is then subplotted
- Raw data is then filtered utilizing a butterworth filter of specified values
- FindPeaks function is used for each set of data, identifying peaks and plotted the results
- FindPeaks stores the location of each peak
- HR is calculated based upon peaks/min
- HRV is calculated based upon the RMS of the difference between each peak
- These raw values are stored in matrix, along with averages for each test day in a separate matrix ("ecgfeatures" and "avgfeatures")
- HRV and HR trends over the course of the tests are then plotted
- Frequency values are then calculated and stored in the same matrix (total, high, low, and ratio frequencies) by taking the integral of the power spectral density at the heart rate frequencies specified in report
- Power Spectral Density for each waveform is then returned as a subplot

### Instructions on Use (EDA)
- Download and open folder and day data (e.g Subject A Day 1 Data folder found in HT->Code + Data ->EDA Analysis-> Subject A Day 1 Data)
- Open "EDA_Visualization"
- Ensure MATLAB directory is referencing "EDA Analysis" 
- Run Script
- MATLAB Live Script will display results in line with code
- Done :)

### Features of Function (EDA)
- Data is parsed based upon desired EDA values and associated with time values (in seconds)
- Raw data from each test is then subplotted
- Raw data is then filtered utilizing a butterworth filter with cut of frequency of 5Hz and order 5
- To extract the mean tonic and phasic values the following must be done.
	1. install ledalab-349 using the website for instructions: http://www.ledalab.de/documentation.htm
	2. Run ledalab-349
	3. Under any folder (e.g Subject A Day 1), upload any file with name "test#" to ledalab-349
	4. Following the documentation (found at http://www.ledalab.de/documentation.htm) analyze the file. 
	5. Under the command window access the global leda variable
	6. Take the mean of the tonic and phasic values accessing the tonicData and phasicData members of ledaVariable



