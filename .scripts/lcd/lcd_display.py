#!/usr/bin/env python3

import subprocess
import time
import netifaces
import json


from RPLCD.i2c import CharLCD

lcd = CharLCD(i2c_expander='PCF8574', address=0x3f, port=1,
              cols=16, rows=2, dotsize=8,
              charmap='A02',
              auto_linebreaks=True,
              backlight_enabled=True)

# Get IP address
ip_address = netifaces.ifaddresses('eth0')[netifaces.AF_INET][0]['addr']

# Write IP address to LCD
lcd.write_string(ip_address)
lcd.cursor_pos = (1,0)

# Get time remaining from OctoPrint
octoprint_output = subprocess.run(["/home/matt/OctoPrint/bin/octoprint", "client", "get", "/api/job"], stdout=subprocess.PIPE).stdout.decode("utf-8")
data = json.loads(octoprint_output.split('\n')[1])

# parse the json output
octoprint_output_dict = json.loads(data)

# assign the value of printTimeLeft to time_remaining
time_remaining = data['progress']['printTimeLeft']

# check if the value is None
if time_remaining is None:
    lcd.write_string("Nothing printing")
    exit()

# Calculate minutes and seconds
minutes = time_remaining // 60
seconds = time_remaining % 60

# Write time remaining to LCD
lcd.write_string(f"{minutes}m {seconds}s left")

# Sleep for 10 seconds
time.sleep(10)
