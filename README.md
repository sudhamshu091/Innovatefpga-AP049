# Innovatefpga-AP049
Project for Innovatefpga contest.<br>
[Project proposal](http://www.innovatefpga.com/cgi-bin/innovate/teams.pl?Id=AP049)
<h2>Sensor Modelling</h2>

<h3>WESAD Dataset</h3>

[Link](https://archive.ics.uci.edu/ml/datasets/WESAD+%28Wearable+Stress+and+Affect+Detection%29)

<h3>Tree</h3>

>sensors<br>

>>LSTM_model.h5<br>
>>sensors.ipynb<br>
>>dataset<br>

>>>WESAD<br>
>>>>S2 to S17 (contains .pkl, E4_Data.zip, quest.csv, readme and respiban.txt files in each folder)<br>

>>>WESAD.txt<br>


<h2>Video Emotion Recognition</h2>
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

<h2>Audio Emotion Recognition</h2>


