#!/usr/bin/env python3

import subprocess
import time
import socket
import json


from RPLCD.i2c import CharLCD

lcd = CharLCD(i2c_expander='PCF8574', address=0x3f, port=1,
              cols=16, rows=2, dotsize=8,
              charmap='A02',
              auto_linebreaks=True,
              backlight_enabled=True)

# Get IP address
host_name = socket.gethostname()
host_ip = socket.gethostbyname(host_name)

# Write IP address to LCD
lcd.write_string(host_ip)
lcd.cursor_pos = (1,0)

# Get time remaining from OctoPrint
octoprint_output = subprocess.run(["/home/matt/OctoPrint/bin/octoprint", "client", "get", "/api/job"], stdout=subprocess.PIPE).stdout.decode("utf-8")

# parse the json output
octoprint_output_dict = json.loads(octoprint_output)

# assign the value of printTimeLeft to time_remaining
time_remaining = octoprint_output_dict['progress']['printTimeLeft']

# Calculate minutes and seconds
minutes = time_remaining // 60
seconds = time_remaining % 60

# Write time remaining to LCD
lcd.write_string("{minutes}m {seconds}s left")

# Sleep for 10 seconds
time.sleep(10)
