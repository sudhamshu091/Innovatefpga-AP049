from matplotlib.pyplot import plt
fig = plt.figure(figsize=(10,5))
# for sensor data from a dictionary
plt.plot(sensor_dict['t_max'], label='t_max')
plt.plot(sensor_dict['t_mean'], label='t_mean')
plt.legend(loc='upper right')
fig.savefig("temp.png")
plt.show()
# for wesad data
#plt.plot(manager.STRESS_FEATURES['t_max'], label='t_max')
#plt.plot(manager.STRESS_FEATURES['t_mean'], label='t_mean')
#plt.legend(loc='upper right')
#fig.savefig("temp.png")
#plt.show()
