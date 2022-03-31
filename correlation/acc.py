from matplotlib.pyplot import plt
fig = plt.figure(figsize=(10,5))
# for sensor data from a dictionary
plt.plot(sensor_dict['a_mean'], label='a_mean')
plt.plot(sensor_dict['a_std'], label='a_std')
plt.plot(sensor_dict['a_maxx'], label='a_maxx')
plt.plot(sensor_dict['a_maxx'], label='a_maxy')
plt.plot(sensor_dict['a_maxx'], label='a_maxz')
plt.legend(loc='upper right')
fig.savefig("acc.png")
plt.show()

# for wesad data
#plt.plot(manager.STRESS_FEATURES['a_mean'], label='a_mean')
#plt.plot(manager.STRESS_FEATURES['a_std'], label='a_std')
#plt.plot(manager.STRESS_FEATURES['a_maxx'], label='a_maxx')
#plt.plot(manager.STRESS_FEATURES['a_maxx'], label='a_maxy')
#plt.plot(manager.STRESS_FEATURES['a_maxx'], label='a_maxz')
#plt.legend(loc='upper right')
#fig.savefig("acc.png")
#plt.show()
