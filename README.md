# crowtail-diy-kit

Hey Baby!  I wrote up a bit of code to make getting started on the Crowtail IOT stuff easier.

This repo includes a copy of Luatool.  It was written in Python 2 (yuck) so I spent 10 minutes translating it to Python 3.

It also added some basic type information when I was debugging things.

## setup

I (mostly) followed instructions from here: http://www.robertprice.co.uk/robblog/nodemcu-lua-setup-using-mac/

I never actually used coolterm or esptool, and jumped straight to running the Lua code w/ luatool.

Installing prerequisites:

```shell script
brew install coolterm
```

The guide uses `esptool` for flashing firmware, but that shouldn't be necessary here.  That can be installed with

```shell script
brew install esptool
``` 

## usage

There is a file called 'blink.lua' in the 'lua' directory.  That will make the LED on the ESP blink purple and red.

All lua files must be in the 'lua' directory.

To run a lua file, use the script `./bin/run-script.sh` like so:

```shell script
./bin/run-script.sh blink.lua
```

If everything is set up correctly the LED should begin blinking in 5-10 seconds, and we're ready for the rest of the tutorials!
