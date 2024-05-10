'''
import mysql.connector
from datetime import datetime
import serial

# Establish a connection to the MySQL database
db_connection = mysql.connector.connect(host="localhost", user="root", password="", database="pgs_sensor")
cursor = db_connection.cursor()

# Open the serial port for RS485 communication
ser = serial.Serial('COM3', baudrate=9600, timeout=1)  # Replace 'COM1' with your actual port
#ser=1
# Function to update sensor data in the sensor table
def update_sensor_data(floor_id, zone_id, sensor_id, status):
    try:
        query_upsert_sensor = """
            INSERT INTO sensor (floor_id, zone_id, sensor_id, status, count, last_updated)
            VALUES (%s, %s, %s, %s, 1, %s)
            ON DUPLICATE KEY UPDATE status = %s, count = count + 1, last_updated = %s
        """
        cursor.execute(query_upsert_sensor, (floor_id, zone_id, sensor_id, status, datetime.now(), status, datetime.now()))
        db_connection.commit()
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Function to insert an entry into the activity_logs table

def insert_activity_log(floor_id, zone_id, sensor_id, issue):
    try:
        query_insert_activity_log = """
            INSERT INTO activity_logs (floor_id, zone_id, sensor_id, issue, created_at)
            VALUES (%s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE issue = VALUES(issue), created_at = VALUES(created_at)
        """
        cursor.execute(query_insert_activity_log, (floor_id, zone_id, sensor_id, issue, datetime.now()))
        db_connection.commit()
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Function to insert data into the line_chart table
def insert_line_chart_data(floor_id, zone_id, total_available, total_vacant, total_faulty):
    try:
        query_insert_line_chart = """
            INSERT INTO line_chart (floor_id, zone_id, total_available, total_vacant, total_faulty)
            VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(query_insert_line_chart, (floor_id, zone_id, total_available, total_vacant, total_faulty))
        db_connection.commit()
    except mysql.connector.Error as err:
        print(f"Error: {err}")


# Function to extract sensor data for a given zone
def extract_sensor_data(zone_start_index, floor_id, zone_id):
    end_index = byte_data.find(b'\x55', zone_start_index)
    
    if end_index - zone_start_index < 8:
        return None
        
    zone_address = byte_data[zone_start_index + 1]
    zone_status = byte_data[zone_start_index + 2]
    
    if zone_status == 3:
        return None
        
    total_sensors = byte_data[zone_start_index + 3]

    expected_length = 4 + total_sensors  # 4 bytes for zone address, zone status, total sensors, and 1 byte per sensor status
    actual_length = end_index - zone_start_index

    if actual_length <= expected_length:
        return None
    sensor_data = []
  
    for i in range(total_sensors):
        sensor_status = byte_data[zone_start_index + 4 + i]
        sensor_data.append(sensor_status)

    total_vacant = sensor_data.count(0)  # Count the number of disengaged sensors (status 0)
    total_engaged = sensor_data.count(1)  # Count the number of engaged sensors (status 1)
    total_notworking_sensors = sensor_data.count(2) # total number of faulty sensor
    total_working_sensors = total_vacant + total_engaged   # Count the number of working sensors (status 2)
    total_nocom_sensors = sensor_data.count(3)  # Total number of no communication sensors
    total_faulty_sensors = total_notworking_sensors + total_nocom_sensors

    return {
        'floor_id': floor_id,
        'zone_id': zone_id,
        'zone_address': zone_address,
        'zone_status': zone_status,
        'total_sensors': total_sensors,
        'sensor_data': sensor_data,
        'total_vacant': total_vacant,
        'total_engaged': total_engaged,
        'total_working_sensors': total_working_sensors,
        'total_faulty_sensors': total_faulty_sensors,
        'total_nocom_sensors': total_nocom_sensors
    }

all_sensor_data = []
previous_status = {}

#static_data = b'\xf4\x01\x01\x01\x05\xaa\x00\x01\x1b\x01\x01\x00\x00\x00\x00\x01\x00\x01\x01\x00\x00\x00\x00\x00\x01\x00\x00\x00\x01\x00\x01\x00\x01\x03\x03\x03\x0f\t\x12\x03U\xaa\x01\x01\x17\x01\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x01\x13\x03\x15\x01U\xaa\x02\x01\x1b\x01\x01\x01\x01\x00\x01\x00\x03\x00\x00\x01\x01\x01\x01\x01\x00\x01\x01\x03\x03\x01\x01\x01\x00\x00\x00\x00\t\x0f\x0c\x03U\xaa\x03\x01(\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00(\x00\x00\x00U\xaa\x04\x01\x16\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x14\x01\x15\x01U\x00\x8b\x00h\x00\x1b\x00\x08\x00\xe9\xe9\x00\x8b\x00h\x00\x1b\x00\x08\x00\xd1'
while True:
    floor_data = ser.readline()
    #floor_data = static_data
    print("data read")
    print(floor_data)
    byte_data = floor_data

    if not (floor_data.startswith(b'\xF4') and floor_data.endswith(b'\xD1')):
        continue
        
    

    floor_id = floor_data[3]
    print(floor_id)

    zone_start_index = floor_data.find(b'\xAA')

    while zone_start_index != -1:
        zone_id = floor_data[zone_start_index + 1]
        zone_data = extract_sensor_data(zone_start_index, floor_id, zone_id)
        if zone_data is not None:
            print(f"Floor {floor_id}, Zone {zone_id} Data:", zone_data)

            total_available_zone = len(zone_data['sensor_data'])
            total_vacant_zone = zone_data['total_vacant']
            total_faulty_zone = zone_data['total_faulty_sensors']

            insert_line_chart_data(floor_id, zone_id, total_available_zone, total_vacant_zone, total_faulty_zone)

            for sensor_id, status in enumerate(zone_data['sensor_data'], start=1):
                print(f"Sensor ID: {sensor_id}, Status: {status}")

                sensor_entry = ( zone_data['floor_id'], zone_data['zone_id'], sensor_id, status, datetime.now(), zone_data['total_engaged'])
                all_sensor_data.append(sensor_entry)

                if previous_status.get((floor_id, zone_id, sensor_id)) != status:
                    update_sensor_data(floor_id, zone_id, sensor_id, status)

                    previous_status[(floor_id, zone_id, sensor_id)] = status

                if (status == 3):
                    insert_activity_log(floor_id, zone_id, sensor_id, "Faulty")

        zone_start_index = floor_data.find(b'\xAA', zone_start_index + 1)


# Close the serial port, cursor, and the database connection when needed
#ser.close()
cursor.close()
db_connection.close()
'''

import mysql.connector
from datetime import datetime
import serial

# Establish a connection to the MySQL database
db_connection = mysql.connector.connect(host="localhost", user="root", password="", database="pgs_sensor")
cursor = db_connection.cursor()

# Open the serial port for RS485 communication
ser = serial.Serial('COM3', baudrate=9600, timeout=1)  # Replace 'COM1' with your actual port
#ser=1
# Function to update sensor data in the sensor table
def update_sensor_data(floor_id, zone_id, sensor_id, status):
    try:
        query_upsert_sensor = """
            INSERT INTO sensor (floor_id, zone_id, sensor_id, status, count, last_updated)
            VALUES (%s, %s, %s, %s, 1, %s)
            ON DUPLICATE KEY UPDATE status = %s, count = count + 1, last_updated = %s
        """
        cursor.execute(query_upsert_sensor, (floor_id, zone_id, sensor_id, status, datetime.now(), status, datetime.now()))
        db_connection.commit()
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Function to insert an entry into the activity_logs table

def insert_activity_log(floor_id, zone_id, sensor_id, issue):
    try:
        query_insert_activity_log = """
            INSERT INTO activity_logs (floor_id, zone_id, sensor_id, issue, created_at)
            VALUES (%s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE issue = VALUES(issue), created_at = VALUES(created_at)
        """
        cursor.execute(query_insert_activity_log, (floor_id, zone_id, sensor_id, issue, datetime.now()))
        db_connection.commit()
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Function to insert data into the line_chart table
def insert_line_chart_data(floor_id, zone_id, total_available, total_vacant, total_faulty):
    try:
        query_insert_line_chart = """
            INSERT INTO line_chart (floor_id, zone_id, total_available, total_vacant, total_faulty)
            VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(query_insert_line_chart, (floor_id, zone_id, total_available, total_vacant, total_faulty))
        db_connection.commit()
    except mysql.connector.Error as err:
        print(f"Error: {err}")


# Function to extract sensor data for a given zone
def extract_sensor_data(zone_start_index, floor_id, zone_id):
    end_index = byte_data.find(b'\x55', zone_start_index)
    
    if end_index - zone_start_index < 8:
        return None
        
    zone_address = byte_data[zone_start_index + 1]
    zone_status = byte_data[zone_start_index + 2]
    
    if zone_status == 3:
        return None
        
    total_sensors = byte_data[zone_start_index + 3]

    expected_length = 4 + total_sensors  # 4 bytes for zone address, zone status, total sensors, and 1 byte per sensor status
    actual_length = end_index - zone_start_index

    if actual_length <= expected_length:
        return None
    sensor_data = []
  
    for i in range(total_sensors):
        sensor_status = byte_data[zone_start_index + 4 + i]
        sensor_data.append(sensor_status)

    total_vacant = sensor_data.count(0)  # Count the number of disengaged sensors (status 0)
    total_engaged = sensor_data.count(1)  # Count the number of engaged sensors (status 1)
    total_notworking_sensors = sensor_data.count(2) # total number of faulty sensor
    total_working_sensors = total_vacant + total_engaged   # Count the number of working sensors (status 2)
    total_nocom_sensors = sensor_data.count(3)  # Total number of no communication sensors
    total_faulty_sensors = total_notworking_sensors + total_nocom_sensors

    return {
        'floor_id': floor_id,
        'zone_id': zone_id,
        'zone_address': zone_address,
        'zone_status': zone_status,
        'total_sensors': total_sensors,
        'sensor_data': sensor_data,
        'total_vacant': total_vacant,
        'total_engaged': total_engaged,
        'total_working_sensors': total_working_sensors,
        'total_faulty_sensors': total_faulty_sensors,
        'total_nocom_sensors': total_nocom_sensors
    }

all_sensor_data = []
previous_status = {}

#static_data = b'\xf4\x01\x01\x01\x05\xaa\x00\x01\x1b\x01\x01\x00\x00\x00\x00\x01\x00\x01\x01\x00\x00\x00\x00\x00\x01\x00\x00\x00\x01\x00\x01\x00\x01\x03\x03\x03\x0f\t\x12\x03U\xaa\x01\x01\x17\x01\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x01\x13\x03\x15\x01U\xaa\x02\x01\x1b\x01\x01\x01\x01\x00\x01\x00\x03\x00\x00\x01\x01\x01\x01\x01\x00\x01\x01\x03\x03\x01\x01\x01\x00\x00\x00\x00\t\x0f\x0c\x03U\xaa\x03\x01(\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00(\x00\x00\x00U\xaa\x04\x01\x16\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x14\x01\x15\x01U\x00\x8b\x00h\x00\x1b\x00\x08\x00\xe9\xe9\x00\x8b\x00h\x00\x1b\x00\x08\x00\xd1'
while True:
    floor_data = ser.readline()
    #floor_data = static_data
    print("data read")
    print(floor_data)
    byte_data = floor_data

    if not (floor_data.startswith(b'\xF4') and floor_data.endswith(b'\xD1')):
        continue
        
    

    floor_id = floor_data[3]
    print(floor_id)

    zone_start_index = floor_data.find(b'\xAA')

    while zone_start_index != -1:
        zone_id = floor_data[zone_start_index + 1]
        zone_data = extract_sensor_data(zone_start_index, floor_id, zone_id)
        if zone_data is not None:
            print(f"Floor {floor_id}, Zone {zone_id} Data:", zone_data)

            total_available_zone = len(zone_data['sensor_data'])
            total_vacant_zone = zone_data['total_vacant']
            total_faulty_zone = zone_data['total_faulty_sensors']

            insert_line_chart_data(floor_id, zone_id, total_available_zone, total_vacant_zone, total_faulty_zone)

            for sensor_id, status in enumerate(zone_data['sensor_data'], start=1):
                print(f"Sensor ID: {sensor_id}, Status: {status}")

                sensor_entry = ( zone_data['floor_id'], zone_data['zone_id'], sensor_id, status, datetime.now(), zone_data['total_engaged'])
                all_sensor_data.append(sensor_entry)

                if previous_status.get((floor_id, zone_id, sensor_id)) != status:
                    update_sensor_data(floor_id, zone_id, sensor_id, status)

                    previous_status[(floor_id, zone_id, sensor_id)] = status

                if (status == 3):
                    insert_activity_log(floor_id, zone_id, sensor_id, "Faulty")

        zone_start_index = floor_data.find(b'\xAA', zone_start_index + 1)


# Close the serial port, cursor, and the database connection when needed
#ser.close()
cursor.close()
db_connection.close()




# this is my data from the controller
#F4 01 02 01 05 AA 00 01 1B 01 00 00 01 01 00 01 00 01 00 00 00 00 00 00 00 00 00 00 00 00 01 00 01 03 03 03 10 07 14 04 55 AA 01 01 17 01 01 01 01 01 00 00 00 00 00 00 00 00 00 00 03 00 00 00 00 01 00 00 10 06 12 01 55 AA 02 01 1B 01 00 01 00 00 01 00 03 00 00 00 01 00 00 03 00 01 00 03 03 00 00 01 00 00 00 00 11 06 15 04 55 AA 03 01 28 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 27 01 27 00 55 AA 04 01 16 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 01 00 00 00 00 00 14 02 14 00 55 00 8B 00 6B 00 18 00 08 00 E9 E9 00 FE 00 C3 00 2F 00 0C 00 D1 F4 01 02 01 05 AA 00 01 22 00 00 01 01 01 00 00 00 00 00 00 00 01 01 01 00 01 01 01 00 00 01 00 00 01 00 00 03 00 00 01 01 03 03 12 0D 15 03 55 AA 01 01 13 00 01 00 00 00 00 00 00 00 00 00 01 00 00 00 00 03 00 00 10 02 11 01 55 AA 02 03 55 AA 03 01 27 00 00 00 00 00 00 00 00 00 01 00 00 00 00 03 01 00 00 00 00 00 01 00 01 00 00 00 00 01 00 01 00 00 00 00 00 00 00 00 21 06 21 00 55 AA 04 01 17 00 00 00 03 00 00 00 00 00 00 00 00 00 00 00 00 01 00 01 00 00 00 00 15 02 15 00 55 00 73 00 58 00 17 00 04 01 E9 E9 00 FE 00 C3 00 2F 00 0C 00 D1 

#F4 01 02 01 05 AA 00 01 22 00 00 00 00 01 00 00 00 00 00 00 00 01 01 01 00 01 01 01 00 00 01 00 00 01 00 00 03 00 00 01 01 03 03 14 0B 17 03 55 AA 01 01 13 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 11 01 12 01 55 AA 02 03 55 AA 03 01 27 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 01 00 00 00 AA 03 1A 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 1A 00 00 00 55 AA 04 01 17 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 17 00 00 00 55 00 73 00 55 00 0D 00 04 01 E9 E9 00 FE 00 C4 00 21 00 0C 00 D1 F4 01 02 01 05 AA 00 01 1B 01 00 00 01 01 00 01 00 01 00 00 00 00 00 00 00 00 00 00 00 00 01 00 01 03 03 03 11 07 14 03 55 AA 01 01 17 01 01 01 01 01 00 01 00 00 00 00 00 00 00 00 03 00 00 01 00 01 00 00 0E 08 11 01 55 AA 02 01 1B 00 00 00 00 00 01 00 03 00 00 00 01 00 00 03 00 01 00 03 03 00 00 01 00 00 00 00 13 04 17 04 55 AA 03 01 28 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 27 01 27 00 55 AA 04 01 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 16 00 00 00 55 00 8B 00 6F 00 14 00 08 00 E9 E9 00 FE 00 C4 00 21 00 0C 00 D1 
