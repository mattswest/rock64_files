#!/bin/python3
# -*- coding: utf-8 -*-

import sys

from RPLCD.i2c import CharLCD

lcd = CharLCD(i2c_expander='PCF8574', address=0x3f, port=1,
              cols=16, rows=2, dotsize=8,
              charmap='A02',
              auto_linebreaks=True,
              backlight_enabled=True)

lcd.write_string(sys.argv[1])
lcd.cursor_pos = (1,0)
lcd.write_string(sys.argv[2] + "m" + sys.argv[3] + "s left")

exit()

