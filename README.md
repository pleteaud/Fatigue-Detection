# Fatigue Detection in Office Work using Electrocardiography and Electrodermal Activity
### Our Northeastern University Healthcare Technologies Project
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

### ECG
Raw data was filtered using a Butterworth low pass filter (N-Order and Cutoff frequency varied based on the quality of signal)
%%% image of raw data and filtered data
#### Time Domain Analysis
* Plot of the ECG data with the R and S wave labeled was created.
* Heart Rate was calculated as number of peaks per minutes.
* Heart Rate Variability was calculated as the difference in peak location.
* Results were averaged over each session of tests for Mean Heart Rate and Mean Heart Rate Variability.
#### Frequency Domain Analysis
* A bandpass filter was used to filter the ECG signal into the LF band (0.04-0.15Hz) and HF band (0.15–0.4 Hz) [10].
* The periodogram power spectral density estimate was calculated and plotted.
%%% image of power spectral density
* The area under the curve for the LF, HF, and Total band was calculated using the power spectral density plot.

### EDA
Raw data was filtered using a Butterworth low pass filter (N-Order = 5, Cut-off Frequency of 5Hz)

#### Time Domain Analysis
* Mean SCL and SCR was extracted using Ledalab[6]
* Results were averaged over each session of tests for Mean SCL and SCR.
%%%%% image of ledalab processing

## Classification Approach
Given prolonged stress is the main contributor to mental fatigue, a possible classification algorithm could go as follows (using the subject's min and max mean EDA and ECG features as stress thresholds):

![Classification_Workflow](https://github.com/pleteaud/Fatigue-and-Stress-Detection/blob/main/Code%20+%20Data/Possible%20Classification%20Workflow.jpg?raw=true)

## Results and Conclusion

It is expected that HR increases [8], HRV decreases [8], LF/HF increases [8] as user becomes more mentally fatigued. Additionally, SCR and SCL should increase as stress increases. 

%%%5Insert Image of results

From the tables summarizing Subject 2's data, some of the expected behavior can be spotted. For example between 10-20 minutes, HR is low, HRV is high, and SCL is low (relativly). And between 40-60 minute, HR is high, HRV is low, and the SCL is high. There was a lot variability in the SCR making it usuable for stress indication. On the contraritly, there were little to no variability in the LF/HF during the test, also making it unusable for stress indication. From our experiment, it seems the HR,HRV, and SCR feature are the best indicator to likely indicate stress. 

Next Steps-Refinement:
* Research additional biosignals that more accurately indicate stress
* Alter electrode placement to maximize signal clarity
* Introduce stimuli and event markers to better measure EDA values
* Lengthen time of test and measure ECG signals for a longer period
* Integrate Ledalab with our program to facilitate EDA interpretation
* Implement a formal questionnaire to indicate subjective level of fatigue correlated to trends in biosignals







