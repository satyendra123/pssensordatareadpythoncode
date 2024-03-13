import re

# Input string
data = 'F4 01 01 DE 00 01 02 AA 00 01 05 01 01 01 00 00 02 03 02 00 55 AA 01 01 04 00 00 00 00 04 00 00 00 55 AA 01 01 02 00 00 04 00 00 00 55 00 09 00 06 00 03 00 00 00 E9 00 02 00 03 00 00 00 00 00 D1'

# Regular expression pattern to extract sensor data between 'AA' and '55'
pattern = r'AA(.*?)55'

# Find all matches
matches = re.findall(pattern, data, re.DOTALL)

# Process each match
for match in matches:
    sensor_data = match.strip().split(' ')
    total_sensors = int(sensor_data[2], 16)  # Convert the 3rd byte to an integer
    sensor_status_data = sensor_data[3:3 + total_sensors]  # Extract sensor status data based on total sensors
    print('Total Sensors:', total_sensors)
    print('Sensor Status Data:', ' '.join(sensor_status_data))

