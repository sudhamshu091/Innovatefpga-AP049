# Innovatefpga-AP049
[Project proposal](http://www.innovatefpga.com/cgi-bin/innovate/teams.pl?Id=AP049)

<h1>Hardware Part</h1>
<h2>1) Sensor Integration</h2>
Qsys project for integrating sensors namely Temperature, EDA, Light, Gas Sensor. On board accelerometer integration.
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

[Wearable Device](outputs/sensor_proto.jpg)
![Wearable Device](outputs/sensor_proto.jpg)

The values from the sensors are test inputs for the sensor modelling.
<h3>Plot Sensor Values</h3>

[Temperature Sensor](outputs/temp.png)
![Temperature Sensor](outputs/temp.png)
[EDA Sensor](outputs/eda.png)
![EDA Sensor](outputs/eda.png)
[Light Sensor](light.png)
![Light Sensor](light.png)
[Gas Sensor](gas.png)
![Gas Sensor](gas.png)


<h1>Software Part</h1>
<h2>2) Video Emotion Recognition</h2>
Videos that belong to 5 catgories namely, Anxiety, Bipolar, Dementia, Happy, Neutral, Sad, Schizophrenia are collected from youtube, stock videos and online sites.

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

<h3>Preprocessing</h3>

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


