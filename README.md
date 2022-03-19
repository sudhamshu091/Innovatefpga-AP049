# Innovatefpga-AP049
Project for Innovatefpga contest.<br>
[Project proposal](http://www.innovatefpga.com/cgi-bin/innovate/teams.pl?Id=AP049)
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

[Sad](outputs/real_time.jpg)
![](outputs/real_time.jpg)

[Schizophrenia](outputs/real_time_schizophrenia.jpg)
![](outputs/real_time_schizophrenia.jpg)

[Dementia](outputs/real_time_dementia.jpg)
![](outputs/real_time_dementia.jpg)

[Bipolar](outputs/real_time_bipolar.jpg)
![](outputs/real_time_bipolar.jpg)

[Happy](outputs/real_time_happy.jpg)
![](outputs/real_time_happy.jpg)

[Anxiety](outputs/real_time_anxiety.jpg)
![](outputs/real_time_anxiety.jpg)

<h2>Audio Emotion Recognition</h2>

<h2>Sensor Modelling</h2>

<h3>WESAD Dataset</h3>

[Link](https://archive.ics.uci.edu/ml/datasets/WESAD+%28Wearable+Stress+and+Affect+Detection%29)

