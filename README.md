# Fatigue Detection in Office Work using Electrocardiography and Electrodermal Activity
### Our Northeastern University Healthcare Technologies Project (Completed on April 2022)
by Dave Pleteau, Eric Alvarez, Nicolo Mega


# The Premise
## Context
Mental fatigue, often caused by prolonged cognitive activity or stress and characterized by feeling of “tiredness” or exhaustion, can severely hinder one’s performance in their job and could lead to negative effects including, but not limited to: feelings of depression, increased irritability, feeling lethargic, and difficulty concentrating[1].

## Our proposed solution
Use BITalino’s electrocardiography (ECG) and electrodermal (EDA) sensors with OpenSignals and MATLAB to detect any correlation between ECG or EDA features and mental fatigue. We are particularly interested in Heart Rate (HR), Heart Rate Variability (HRV), Skin Conductance Level (SCR), and Skin Conductance Response (SCR). Leverage collected biometrics to develop a rough algorithm to detect and indicate fatigue in an individual. We hope this project can provide a new perspective on designing wearable devices to detect mental fatigue in individuals.

# Data Analysis

## Procedure

Three subjects participated in our project. Each participant was tasked with taking four unique SAT exams consisting of only the Writing (35 min) and Math No-Calculator sections (25 min). Subjects took only one test per day and were required to space each test by at least one day

### Testing Day 1: 
* The first test was taken at the point of the day when user felt most ready. 
* Score acted as the baseline performance to compare future test results.
* No ECG and EDA data were collected.

### Testing Day 2-4:
* 2 minutes of ECG and EDA signals were recorded in the morning (provided baseline biometrics for the 'refreshed' state of the participants).
* Participants continued their day until around 6 PM, at which point they were tasked with taking a test.
* During the test, signals were recorded for 30 seconds at time = 0, 10, 20, 30, 40, 50, 60 minutes.

### Sensor Placement
ELECTRODE PLACEMENT FOR EDA SENSOR |  ELECTRODE PLACEMENT FOR ECG SENSOR
:-------------------------:|:-------------------------:
![EDA](https://raw.githubusercontent.com/pleteaud/Fatigue-and-Stress-Detection/main/Code%20%2B%20Data/EDA%20Sensor%20Placement.jpg) | ![ECG](https://raw.githubusercontent.com/pleteaud/Fatigue-and-Stress-Detection/main/Code%20%2B%20Data/ECG%20Sensor%20Placement.jpg)


## Feature Extraction (Data Analysis)
The raw ECG and EDA data were filtered using a Butterworth low pass filter and analyzed in either/both the time and frequency domain for the following features: 

FEATURES TO BE EXTRACTED FROM ECG SIGNAL |  FEATURES TO BE EXTRACTED FROM EDA SIGNAL
:-------------------------:|:-------------------------:
![ECG Features](https://raw.githubusercontent.com/pleteaud/Fatigue-and-Stress-Detection/main/Code%20%2B%20Data/Time%20and%20Frequency%20Domain%20Features%20to%20Be%20Extracted%20(ECG).jpg) | ![EDA Features](https://raw.githubusercontent.com/pleteaud/Fatigue-and-Stress-Detection/main/Code%20%2B%20Data/Time%20and%20Frequency%20Domain%20Features%20to%20Be%20Extracted%20(EDA).jpg)

### ECG Time Domain Analysis
* Plot of the ECG data with the R and S wave labeled was created.
* Heart Rate was calculated as number of peaks per minutes.
* Heart Rate Variability was calculated as the difference in peak location.
* Results were averaged over each session of tests for Mean Heart Rate and Mean Heart Rate Variability.
### ECG Frequency Domain Analysis
* A bandpass filter was used to filter the ECG signal into the LF band (0.04-0.15Hz) and HF band (0.15–0.4 Hz) [10].
* The periodogram power spectral density estimate was calculated and plotted.
* The area under the curve for the LF, HF, and Total band was calculated using the power spectral density plot.

#### Example of ECG Analysis 
Subject A - Day One - ECG Raw |  Subject A - Day One - ECG Processed | Subject A - Day One - ECG Feature Trends | Subject A - Day One - Power Spectral Density
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![ECG_Raw](https://github.com/pleteaud/Fatigue-and-Stress-Detection/blob/main/Code%20+%20Data/ECG%20Analysis/Images/Subject%20A%20-%20Day%20One%20-%20ECG%20Raw.jpg?raw=true) | ![ECG Processed](https://github.com/pleteaud/Fatigue-and-Stress-Detection/blob/main/Code%20+%20Data/ECG%20Analysis/Images/Subject%20A%20-%20Day%20One%20-%20ECG.jpg?raw=true) | ![ECG FT Trend](https://github.com/pleteaud/Fatigue-and-Stress-Detection/blob/main/Code%20+%20Data/ECG%20Analysis/Images/Subject%20A%20-%20Day%20One%20-%20Heart%20Trends.jpg?raw=true) | ![ECG PSD](https://github.com/pleteaud/Fatigue-and-Stress-Detection/blob/main/Code%20+%20Data/ECG%20Analysis/Images/Subject%20A%20-%20Day%20One%20-%20PSD.jpg?raw=true)

### EDA Time Domain Analysis
* Mean SCL and SCR was extracted using Ledalab[6]
![EDA Extract](https://github.com/pleteaud/Fatigue-and-Stress-Detection/blob/main/Code%20+%20Data/LEDALAB%20example%20EDA%20extraction.jpg?raw=true)
* Results were averaged over each session of tests for Mean SCL and SCR.

# Classification Approach
Given that prolonged stress is the main contributor to mental fatigue, a possible classification algorithm could go as follows (using the subject's min and max mean EDA and ECG features as stress thresholds):

![Classification_Workflow](https://github.com/pleteaud/Fatigue-and-Stress-Detection/blob/main/Code%20+%20Data/Possible%20Classification%20Workflow.jpg?raw=true)

# Results and Conclusion
## Notable features for subject 2: 

Normalized HR and HRV vs Time (Subject 2) |  Normalized SCR and SCL vs Time (Subject 2)
:-------------------------:|:-------------------------:
![HR_HRV](https://github.com/pleteaud/Fatigue-and-Stress-Detection/blob/main/Code%20+%20Data/Normalized%20HR%20and%20HRV%20vs%20Time%20(Subject%202).jpg?raw=true) | ![SCR_SCL](https://github.com/pleteaud/Fatigue-and-Stress-Detection/blob/main/Code%20+%20Data/Normalized%20SCR%20and%20SCL%20vs%20Time%20(Subject%202).jpg?raw=true)

It is expected that HR increases, HRV decreases, SCR, and SCL increase as stress increases [8]. At 10 and 20 minutes, HR  and SCL decreased while HRV increased, indicating low stress. In contrast, HR and SCL increased while HRV is decreased during 40-60 minutes, implying an increase in stress. There was high variability in the SCR rendering it unusable for stress indication. Our experiment indicates HR, HRV, and SCR could make good indicators of prolong stress. 

## Next Steps-Refinement:
* Research additional biosignals that more accurately indicate stress
* Alter electrode placement to maximize signal clarity
* Introduce stimuli and event markers to better measure EDA values
* Lengthen time of test and measure ECG signals for a longer period
* Integrate Ledalab with our program to facilitate EDA interpretation
* Implement a formal questionnaire to indicate subjective level of fatigue correlated to trends in biosignals


# References
[1] “Fatigue,” Fatigue - Better Health Channel. [Online]. Available: https://www.betterhealth.vic.gov.au/health/conditionsandtreatments/fatigue. [Accessed: 11-Feb-2022]. <br> <br>
[2] A. Matuz, D. van der Linden, Z. Kisander, I. Hernádi, K. Kázmér, and Á. Csathó, “Enhanced cardiac vagal tone in mental fatigue: Analysis of heart rate variability in time-on-task, recovery, and reactivity,” PLOS ONE. [Online]. Available: https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0238670. [Accessed: 14-Apr-2022]. <br> <br>
[3] S. Mosher and K. A. Robbins, “Skin conductance as a measure of fatigue in different tasks,” Home, 01-Jan-1970. [Online]. Available: https://rrpress.utsa.edu/handle/20.500.12588/104. [Accessed: 14-Apr-2022]. <br> <br>
[4] L. M. Feehan, J. Geldman, E. C. Sayre, C. Park, A. M. Ezzat, J. Y. Yoo, C. B. Hamilton, and L. C. Li, “Accuracy of Fitbit devices: Systematic review and narrative syntheses of quantitative data,” JMIR mHealth and uHealth, 09-Aug-2018. [Online]. Available: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6107736/. [Accessed: 11-Feb-2022]. <br> <br>
[5] Sarah Ostadabbas (2022). Biosignal-Specific Processing (Bio-SP) Tool (https://www.mathworks.com/matlabcentral/fileexchange/64013-biosignal-specific-processing-bio-sp-tool), MATLAB Central File Exchange. Retrieved February 11, 2022. <br> <br>
[6] Benedek, M., & Kaernbach, C. (2010b). A continuous measure of phasic electrodermal activity. Journal of Neuroscience Methods, 190(1), 80–91. <br> <br>
[7] “Evaluation of an Integrated System of Wearable Physiological Sensors for Stress Monitoring in Working Environments by Using Biological Markers,” IEEE Trans. Biomed. Eng., vol. 65, no. 8, pp. 1748–1758, Aug. 2018, doi: 10.1109/TBME.2017.2764507. <br> <br>
[8] A. Nemcova et al., “Multimodal Features for Detection of Driver Stress and Fatigue: Review,” IEEE Trans. Intell. Transport. Syst., vol. 22, no. 6, pp. 3214–3233, Jun. 2021, doi: 10.1109/TITS.2020.2977762. [9] Citi, L., Brown, E. N., & Barbieri, R. (2012). A real-time automated point-process method for the detection and correction of erroneous and ectopic heartbeats. IEEE transactions on biomedical engineering, 59(10), 2828-2837. <br> <br>
[10] F. Shaffer and J. P. Ginsberg, “An overview of heart rate variability metrics and norms,” Frontiers in public health, 28-Sep-2017. [Online]. Available: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5624990/. [Accessed: 11-Mar-2022]. <br> <br>



