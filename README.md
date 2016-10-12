# tlapser360
Used to shoot time lapse 360 photos with cameras that support the Open Spherical Camera API.

I use this script on a raspberry pi with a Ricoh Theta S camera. It supports geotaging
with gpsd and camera metering via an adafruit LUX meter. communication with the camera 
can be done with via wifi or usb

Early test fotage can be found here: https://www.youtube.com/watch?v=IugTnvYjy6A

Use at your own risk!


Prereqs: 

- GPS support relies on gpsd and gpsd-clients being installed and configured.

- The bc package is needed for maths.

- LUX meter support was tested with a adafruit TSL2561 and some tweaks to IainColledge's
  example script. See this variable "LUX_METER_SCRIPT"
  https://github.com/IainColledge/Adafruit-Raspberry-Pi-Python-Code

- Usb support with libptp, Thanks to codetricity for the howto 
  http://lists.theta360.guide/t/ricoh-theta-s-api-over-usb-cable/65/3



Usage:

-I <Interval seconds> 

-U Usb mode

-W Wifi mode

-C <Image count> 

-m <Exposure Program mode 1 2 4 9> 

-G <GPS support 0/1 - This may introduce added latency!> 

-T <GPS Track log path and file name> 

-r <image resolution size h/l> 

-i <iso> 

-s <shutter speed> 

-w <White Balance> 

-O <Output path /> 

-d <0/1 if images are downloaded delete them from the camera.> 

-F <Config file - NOT SUPPORTED> 

-M < 0/1 use a TSL2561 LUX sensor for metering. if used we will add time to your interval > 

-R <Ramp exposure speed up (longer shutter - Sunset) or down (shorter/faster shutter - Sunrise) based on external LUX meter.> 

-A <Sunrise time (24hr no : ex, 6:00AM=600)> -P <Sunset time (24hr no ":" ex, 7:00PM=1900)>



Copyright 2016 - Jason Charcalla
