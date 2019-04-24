# MIT License
#
# Copyright (c) 2018, Pablo Ridolfi - Code 'n Load
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

include /etc/cnl.conf

PROGRAM = cnl_app

ARDUINO_PATH = /home/pi/arduino-1.8.5/
ARDUINO_PORT = /dev/ttyUSB0

all: $(PROGRAM)

$(PROGRAM):
	sudo cp src/program.py out/$(PROGRAM)	
	sudo chmod +x out/$(PROGRAM)

update: $(PROGRAM)
	sudo systemctl stop cnl_app.service
	sudo cp out/$(PROGRAM) /usr/bin
	sudo systemctl start cnl_app.service
	$(ARDUINO_PATH)arduino --upload --board arduino:avr:uno --port $(ARDUINO_PORT) ino/cnl_app.ino

clean:
	rm -f out/$(PROGRAM)
