# Innovatefpga-AP049
[Project proposal](http://www.innovatefpga.com/cgi-bin/innovate/teams.pl?Id=AP049)

[](outputs/bd.jpg)<br>
![](outputs/bd.jpg)<br>

<h1>Hardware Part</h1>
<h2>1) Sensor Integration</h2>
Qsys project for integrating sensors namely Temperature, EDA, Light, Gas Sensor. On board accelerometer integration.

![Wearable Device](outputs/model1.jpeg)
![Wearable Device](outputs/model2.jpeg)

<h3>Tree</h3>

>fpga<br>

>>DE10_NANO_QSYS<br>

>>>synthesis<br>

>>>>submodules<br>

>>>>>submodule files<br>

>>>>debuginfo,qip,regmap and Qsys verilog files<br>

>>>Qsys files<br>

>>RemoteSystemFiles<br>

>>db<br>

>>ip<br>

>>>ADC_LTC2308_FIFO<br>

>>>>greybox_tmp<br>
>>>>adc verilog files<br>

>>script<br>

>>>DE10_NANO_ADC.sof<br>
>>>test.bat<br>
>>>test.sh<br>
>>>DE10_NANO_ADC.elf<br>

>>software<br>

>>>Eclipse files<br>

>>ADC top module, sopcinfo, sof, qsf and other files<br>

![Sensor Integration](outputs/adc.jpg)

The values from the sensors are test inputs for the sensor modelling.
<h3>Plot Sensor Values</h3>

[Temperature Sensor](outputs/temp_val.png)
![Temperature Sensor](outputs/temp_val.png)
[EDA Sensor](outputs/eda.png)
![EDA Sensor](outputs/eda.png)

<h1>Software Part</h1>
<h2>2) Video Emotion Recognition</h2>
Videos that belong to 5 catgories namely, Angry, Anxiety, Happy, Neutral, Sad are collected from youtube, stock videos and online sites.

<h3>Tree</h3>

>Data<br>

>>haarcascade_frontalface_default.xml<br>
>>model.h5<br>
>>preprocessing_video.ipynb<br>
>>video.ipynb<br>
>>train<br>

>>>angry<br>
>>>anxiety<br>
>>>happy<br>
>>>neutral<br>
>>>sad<br>

>>test<br>

>>>angry<br>
>>>anxiety<br>
>>>happy<br>
>>>neutral<br>
>>>sad<br>

<h3>Preprocessing</h3>

- Sample the videos that belong to 5 classes (angry, anxiety, happy, neutral, sad) are converted to gray scale images of 48X48X1 size.
- Split data into train and test images.
- Run machine learning model.

<h3>Real Time Emotion Recognition</h3>

[Confidence](outputs/Confidence_video.png)<br>
![Confidence](outputs/Confidence_video.png)

[Sad](outputs/real_time_sad.jpg)<br>
![Sad](outputs/real_time_sad.jpg)<br>
[Happy](outputs/real_time_happy.jpg)<br>
![Happy](outputs/real_time_happy.jpg)<br>
[Anxiety](outputs/real_time_anxiety.jpg)<br>
![Anxiety](outputs/real_time_anxiety.jpg)<br>
[Angry](outputs/real_time_angr.png)<br>
![Angry](outputs/real_time_angr.png)<br>


<h2>3) Sensor Modelling</h2>

<h3>WESAD Dataset</h3>

[Link](https://archive.ics.uci.edu/ml/datasets/WESAD+%28Wearable+Stress+and+Affect+Detection%29)

<h3>Tree</h3>

>sensors<br>

>>LSTM_model.h5<br>
>>model.h5<br>
>>model.json<br>
>>sensors.ipynb<br>
>>dataset<br>

>>>WESAD<br>
>>>>S2 to S17 (contains .pkl, E4_Data.zip, quest.csv, readme and respiban.txt files in each folder)<br>

>>>WESAD.txt<br>

[Confidence](outputs/confidence.png)<br>

![](outputs/confidence.png)<br>

<br>

Stress Prediction for Test Data<br>

[Stress_Prediction_100_values_of_test_data](outputs/prediction_100_values.png)<br>
![](outputs/prediction_100_values.png)<br>
[Stress_Prediction_200_values_of_test_data](outputs/prediction_200_values.png)<br>
![](outputs/prediction_200_values.png)<br>

<h1>Correlation, Classification, Mental Health Disorder Diagnosis and Recommendation</h1>

[Temperature](outputs/temp.png)<br>
![](outputs/temp.png)<br>
[GSR](outputs/gsr.png)<br>
![](outputs/gsr.png)<br>
[ACC](outputs/acc.png)<br>
![](outputs/acc.png)<br>
[Correlation](outputs/corr.png)<br>
![](outputs/corr.png)<br>
[Real time Stress Prediction](outputs/real_time_stress_prediction.png)<br>
![](outputs/real_time_stress_prediction.png)<br>
