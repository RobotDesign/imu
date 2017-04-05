# IMU
IMU code for arduino and matlab

# Arduino

Takes raw sensor data (10DOF IMU, but mainly 3-axis accelerometer, 3-axis gyroscope) and sends it via serial to Matlab

# Matlab

Takes the serial data stream and processes the raw IMU data to estimate roll and pitch.

1. Integrates angular velocities to calculate yaw, pitch and roll (3D attitude estimation)
2. Use accelerometer (gravity) to estimate pitch and roll --> print in degrees at rate of 5hz

Visualises the processed data.

# To Run

1. Open imu_run.ino in Arduino and load to mega
2. Open serial monitor of Arduino and check that values are being read
3.
