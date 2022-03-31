fig = plt.figure(figsize=(10,5))
plt.plot(y_pred[0:range], label='y_pred')
plt.plot(y_test[0:range], label = 'y_test')  # Use your dataset range
plt.legend(loc='upper right')
fig.savefig("prediction_test.png")
plt.show()
