# Fatigue Detection in Office Work using Electrocardiography and Electrodermal Activity
### Our Northeastern University Healthcare Technologies Project
by Dave Pleteau, Eric Alvarez, Nicolo Mega


# The Premise
## Context
Fatigue can create a range of different physical, mental, or emotional symptoms, such as nausea, depression, and a general reduction in mental or physical productivity [1]. Of particular interest is mental fatigue, often caused by prolonged cognitive activity or stress and characterized by feeling of “tiredness” or exhaustion. This sate of mind can severely hinder one’s performance at their job and could lead to range of different negative effects including, but not limited to: feelings of depression, increased irritability, feeling lethargic, and difficulty concentrating.

## Our proposed solution
Use BITalino’s electrocardiography (ECG) and electrodermal (EDA) sensors along with OpenSignals and MATLAB to detect any correlation between any ECG or EDA features (e.g HRV, SCL/SCR) and mental fatigue. Once a pattern is detected, possibly develope a rough algorithm to detect and indicate fatigue to an individual using real time physiological data. Our hope is that this project can a new perspective to the way wearable devices detect mental fatigue in idividuals.

# Data Analysis

## Procedure

Three participants were selected to take part of our project. Each subject were required to take a total of four unique practice SAT exams consisted of only the Writing (35 min.) and Math No Calculator sections (25 min.). Subjects took only one test per day and were required to give at least one day interval between consecutive tests (i.e 4 testing days). 

### Testing Day 1: 
* The first test was taken at the point of the day where user feels most ready. 
* Score acted as the baseline performance to compare. 
* No ECG and EDA data were collected.

### Testing Day 2-4:
* 2 minute of ECG and EDA signals were recorded in the morning (provided baseline 'alert/refreshed' for each participant).
* Participants continued their day until around 6PM, at which point they are tasked with taking a test.
* During the test, signals were recorded for 30 seconds at time = 0, 10, 20, 30, 40, 50, 60 minutes.

### Sensor Placement
%%%% images

## Feature Extraction (Data Analysis)
The collected ECG and EDA data were analyzed in both the time and frequency domain to extract the features listed in Table I and II. Many of these features have been used to detect stress in working environments [7] and mental fatigue in people, like drivers [8].

%% insert images of table

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
Given prolong stress is the main contributer of mental fatigue, our proposed algorithm to determining if an individual is going to be mentally exhausted is as follows:

* Create stress thresholds based on the lowest and max mean EDA and ECG features (e.g linearly map feature values).
* If the user is near or at the max feature value for an excessive amount of time (.75 hour), indicate to them to take a break or they'll start to to be feel mentally tired.
%%%% insert rough diagram of workflow

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







