from matplotlib.pyplot import 
fig = plt.figure(figsize=(10,5))
# for sensor data from a dictionary
plt.plotsensor_dict['e_max'], label='e_max')
plt.plot(sensor_dict['e_min'], label='e_min')
plt.plot(sensor_dict['e_mean'], label='e_mean')
plt.plot(sensor_dict['e_range'], label='e_range')
plt.plot(sensor_dict['e_std'], label='e_std')
plt.legend(loc='upper right')
fig.savefig("gsr.png")
plt.show()
# for wesad data
#plt.plot(manager.STRESS_FEATURES['e_max'], label='e_max')
#plt.plot(manager.STRESS_FEATURES['e_min'], label='e_min')
#plt.plot(manager.STRESS_FEATURES['e_mean'], label='e_mean')
#plt.plot(manager.STRESS_FEATURES['e_range'], label='e_range')
#plt.plot(manager.STRESS_FEATURES['e_std'], label='e_std')
#plt.legend(loc='upper right')
#fig.savefig("gsr.png")
#plt.show()
