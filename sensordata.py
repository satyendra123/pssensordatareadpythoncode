'''
import serial
import re

ser = serial.Serial('COM17', baudrate=9600, timeout=1)

while true:
    floor_data = ser.readline()
    print(floor_data)

    if not (floor_data.startswith(b'\xF4') and floor_data.endswith(b'\xD1')):
        continue

'''
'''
import re
import binascii

def extract_sensor_data(floor_id, data):
    pattern = r'(AA.*?55)'
    matches = re.findall(pattern, data, re.DOTALL)
    sensor_data_list = []
    for match in matches:
        sensor_data = match
        print(sensor_data)
        #if len(sensor_data) < 9:
            #continue
        
        zone_id = int(sensor_data[2:4], 16)
        print('zone_id:',zone_id)
        total_sensors = int(sensor_data[5:6], 16)
        sensor_status_data = sensor_data[3:3 + total_sensors]
        total_vacant = sensor_status_data.count('00')
        total_engaged = sensor_status_data.count('01')
        total_faulty_sensors = sensor_status_data.count('03')
        print('total faulty sensor',total_faulty_sensors)
        total_nocom_sensors = sensor_status_data.count('02')
        print('total_nocom_sensors',total_nocom_sensors)
        total_working_sensors = sensor_status_data.count('00') + sensor_status_data.count('01')
        print('total_working_sensors',total_working_sensors)
        

        print('total_sensors:', total_sensors)



byte_data = b"\xf4\x00\x01\xde\x00\x01\x05\xaa\x00\x03U\xaa\x01\x03U\xaa\x02\x01\x1b\x00\x00\x00\x00\x00\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x05\x00\x00\x16U\xaa\x03\x03U\xaa\x04\x01'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00&\x01&\x00U\x00B\x00+\x00\x01\x00\x16\x03U\x00\x05\x00\x01\x00\x00\x00\x03\x00\xd1"
hexadecimal_data = binascii.hexlify(byte_data).decode('utf-8').upper()

# Extract floor_id correctly from bytes 4 and 5
floor_id = int(hexadecimal_data[8:10], 16)
print(floor_id)

zone_data = extract_sensor_data(floor_id, hexadecimal_data)

'''

import binascii

byte_data = b'\xf4\x00\x01\xde\x00\x01\x05\xaa\x00\x01\x1b\x01\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x03\x03\x16\x02\x19\x03U\xaa\x01\x01\x17\x00\x00\x00\x00\x00\x00\x01\x03\x00\x01\x00\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x08\x02\x15\rU\xaa\x02\x01\x1b\x03\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x03\x00\x00\x00\x03\x03\x03\x03\x03\x03\x00\x01\x01\x00\x03\x00\x10\x02\x19\tU\xaa\x03\x01(\x00\x00\x00\x00\x00\x00\x00\x00\x00U\x00\x00\x00\x00\x00\x00\x00\x00\x01\xd1'
hexadecimal_data = binascii.hexlify(byte_data).decode('utf-8').upper()

# Insert a space after each byte
spaced_hexadecimal_data = ' '.join(hexadecimal_data[i:i+2] for i in range(0, len(hexadecimal_data), 2))
print(spaced_hexadecimal_data)









