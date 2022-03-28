# Innovatefpga-AP049
[Project proposal](http://www.innovatefpga.com/cgi-bin/innovate/teams.pl?Id=AP049)

<h1>Hardware Part</h1>
<h2>1) Sensor Integration</h2>
<h3>Plot Sensor Values</h3>

![Temperature Sensor](outputs/temp_variation.png)
![EDA Sensor](outputs/eda_variation.png)

<h1>Software Part</h1>
<h2>2) Video Emotion Recognition</h2>
<h3>Preprocessing</h3>

<h3>Tree</h3>

>Data<br>

>>haarcascade_frontalface_default.xml<br>
>>model.h5<br>
>>preprocessing_video.ipynb<br>
>>video.ipynb<br>
>>train<br>

>>>anxiety<br>
>>>bipolar<br>
>>>dementia<br>
>>>happy<br>
>>>neutral<br>
>>>sad<br>
>>>schizophrenia<br>

>>test<br>

>>>anxiety<br>
>>>bipolar<br>
>>>dementia<br>
>>>happy<br>
>>>neutral<br>
>>>sad<br>
>>>schizophrenia<br>

- Sample the videos that belong to 7 classes (anxiety, bipolar, dementia, happy, neutral, sad, schizophrenia) are converted to gray scale images of 48X48X1 size.
- Split data into train and test images.
- Run machine learning model.

<h3>Real Time Emotion Recognition</h3>

[Results](outputs)

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

<h1>Correlation, Mental Health Disorder Diagnosis and Recommendation</h1>


