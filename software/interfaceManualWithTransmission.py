import serial
import struct
import re
import numpy
import csv
import time
import os


dirname = "../data/training_scans/" + time.strftime("%Y%m%d")
filename = "../data/training_scans/" + time.strftime("%Y%m%d")+ "/data"+ time.strftime("%Y%m%d-%H%M%S") + ".csv"
filename_corrected = "../data/training_scans/" + time.strftime("%Y%m%d")+ "/data_corrected"+ time.strftime("%Y%m%d-%H%M%S") + ".csv"

toprow = ["PlasticType", "Color", "MeasurementType", "white", "nm850", "nm940", "nm1200", "nm1300", "nm1450", "nm1550", "nm1650"]
toprow_corrected = ["PlasticType", "wavelength1", "wavelength2", "wavelength3", "wavelength4", "wavelength5", "wavelength6", "wavelength7", "wavelength8","wavelength9","wavelength10","wavelength11","wavelength12","wavelength13","wavelength14"]

wavelength_correction = [10887,	162684,	224906,	134547,	113060,	135121,	101445,	78442]

# Create target directory & all intermediate directories if don't exists
if not os.path.exists(dirname):
    os.makedirs(dirname)
# write top row #
with open(filename, 'w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(toprow)
csvFile.close()
# write top row #
with open(filename_corrected, 'w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerow(toprow_corrected)
csvFile.close()

ser = serial.Serial('/dev/tty.usbmodem205231794B411') 
print(ser.name)
transmission_started = False   

measurements = []
wavelengths = []
index = 1
cmd = 'n'
scan_again = 'n'
while 1:
    if ser.is_open == False:
        ser.open()
    ser.flushInput()
    ser.flush()

    if(scan_again == 'n'):
        plastic_type = input('Input plastic TYPE (PET, HDPE, PVC, LDPE, PP, PS, other): ')
        plastic_color = input('Input plastic COLOR (green, white, blue, clear, other): ')
        cmd = input('Do you want to measure ' + plastic_color + ' ' + plastic_type + ' (y/n)? ')
    elif(scan_again == 'y'):
        cmd = 'y'
    else:
        scan_again = 'n'
        cmd = 'n'

    if cmd == 'y':
        start = time.time()
        ser.write(b'CMD=1')

        #byte_array = ser.readline()
        string_array = str(ser.readline(), 'utf-8')

        if string_array.startswith("CMD=OK"):
            transmission_started  = True
            print('Measurement started...')

            for x in range(0, 3):
                string_array = str(ser.readline(), 'utf-8')
                if string_array.startswith("MEASURE=PRE"):
                    measurement_type = "PRE"
                if string_array.startswith("MEASURE=VALUE"):
                    measurement_type = "VALUE"
                if string_array.startswith("MEASURE=POST"):
                    measurement_type = "POST"
            
                num_array = re.findall('\d+', string_array) #find all integers
                measurements.append([plastic_type, plastic_color, measurement_type, num_array[0], num_array[1], num_array[2], num_array[3], num_array[4], num_array[5], num_array[6], num_array[7]]) #store an array to write to the csv file
                if len(measurements) > 3:
                    measurements = measurements[3:]
                    
            print(measurements)
            string_array = str(ser.readline(), 'utf-8')
            if string_array.startswith("MEASURE=FINISH"):
                end = time.time() 
                plastic_id = -1     
                if(plastic_type == 'PET'):
                    plastic_id = 1 
                if(plastic_type == 'HDPE'):
                    plastic_id = 2
                if(plastic_type == 'PVC'):
                    plastic_id = 3
                if(plastic_type == 'LDPE'):
                    plastic_id = 4
                if(plastic_type == 'PP'):
                    plastic_id = 5
                if(plastic_type == 'PS'):
                    plastic_id = 6
                if(plastic_type == 'OTHER'):
                    plastic_id = 7
                if(plastic_type == 'none'):
                    plastic_id = 0

                
                for y in range(0, 8):
                    j = y+3
                    wavelengths.insert(y, (int(round(int(measurements[1][j]) - (int(measurements[0][j]) + int(measurements[2][j]))/2))) - wavelength_correction[y])
                
                measurements_corrected = [
                    plastic_id, 
                    wavelengths[0],
                    wavelengths[1],
                    wavelengths[2],
                    wavelengths[3],
                    wavelengths[4],
                    wavelengths[5],
                    wavelengths[6],
                    wavelengths[7],
                    (wavelengths[2] - wavelengths[1])/(940-850),
                    (wavelengths[3] - wavelengths[2])/(1200-940),
                    (wavelengths[4] - wavelengths[3])/(1300-1200),
                    (wavelengths[5] - wavelengths[4])/(1450-1300),
                    (wavelengths[6] - wavelengths[5])/(1550-1450),
                    (wavelengths[7] - wavelengths[6])/(1650-1550)
                ]

                print(measurements_corrected)
                ##### write lines #####
                with open(filename_corrected, 'r') as readFile:
                    reader = csv.reader(readFile)
                    lines = list(reader)
                    lines.append(measurements_corrected)
                with open(filename_corrected, 'w') as writeFile:
                    writer = csv.writer(writeFile)
                    writer.writerows(lines)
                readFile.close()
                writeFile.close()
                ##### write lines #####
                with open(filename, 'r') as readFile:
                    reader = csv.reader(readFile)
                    lines = list(reader)
                    for x in range(0, 3):
                        lines.append(measurements[x])
                with open(filename, 'w') as writeFile:
                    writer = csv.writer(writeFile)
                    writer.writerows(lines)
                readFile.close()
                writeFile.close()
                time_ms = int(round((end - start)*1000)) 
                print(str(time_ms) + ' ms')
                print('Measurement successfully stored!')
                cmd = 'n'
                scan_again = input('Scan another sample (y/n)? ')
    ser.close()