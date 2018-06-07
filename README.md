# Arduino-IDE-Tweaks
Some Arduino IDE setup tweaks I find useful.

The current Arduino IDE allows for customizing ```boards.txt``` and ```platform.txt``` by adding files ```boards.local.txt``` and ```platform.local.txt```, respecfully, to the same directory. This can allow you to make changes w/o editing ```boards.txt``` and ```platform.txt```.

Examples of those files are in this repository.  These files add new menu items and board types. ESPurna is added as a board type with multiple board models. This offers a little more build control, under the Arduino IDE environment. These files should be edited to suit your build needs.

On your system these files are located somewhere close to 
  * ```...{Arduino15 | .arduino15}/packages/esp8266/hardware/esp8266/2.4.1``` or 
  * ```...{Arduino15 | .arduino15}/packages/esp8266/hardware/esp8266/2.3.0```
