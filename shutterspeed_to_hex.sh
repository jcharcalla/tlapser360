#!/bin/bash
#
# Test script to convert a decimal theata s shutter speed to raw hex for usb
#

SSPEED=$1

ss_convert () {  
     if (( $(echo "${SSPEED} < 1" | bc -l) ))
     then
          # If the shutter speed is less than 1 we do it this way (looks something like 1/60)
          SSPEED_FRACTION=$(echo "1/${SSPEED}" | bc)
          SSPEED_HEX2=$(printf "%08x\n" ${SSPEED_FRACTION} | awk '{print substr ($0,7,2) substr ($0,5,2) substr ($0,3,2) substr ($0,1,2)}' | sed 's/.\{2\}/&\\x/g' | sed -e 's/^/\\x/' | awk '{print substr($0,1,length()-2)}')
          # The 1st hex intiger in this case is always a 1.
          SSPEED_HEX1="\x01\x00\x00\x00"
          # if its a decimal greater than 1 (1.3 or 1.6 looks something like 13/10)
     elif [ $(echo ${SSPEED} | grep "\.") ]
     then
	  echo "Decimal found, greater than 1"
          # If the shutter speed is less than 1 we do it this way (looks something like 1/60)
          # move the decimal
          SSPEED_SCALED=$(echo "scale=0; ${SSPEED}*10/1" | bc -l)
          SSPEED_HEX1=$(printf "%08x\n" ${SSPEED_SCALED} | awk '{print substr ($0,7,2) substr ($0,5,2) substr ($0,3,2) substr ($0,1,2)}' | sed 's/.\{2\}/&\\x/g' | sed -e 's/^/\\x/' | awk '{print substr($0,1,length()-2)}')
          # The 2nd hex intiger in this case is always a 10, or a
          SSPEED_HEX2="\x0a\x00\x00\x00"
     else
	  echo "Greater then 1"
          # If its greater than one but not a decimal or something like this 30/1
          #SSPEED_SCALED=$(echo "scale=0; ${SSPEED}*10/1" | bc -l)
          SSPEED_HEX1=$(printf "%08x\n" ${SSPEED} | awk '{print substr ($0,7,2) substr ($0,5,2) substr ($0,3,2) substr ($0,1,2)}' | sed 's/.\{2\}/&\\x/g' | sed -e 's/^/\\x/' | awk '{print substr($0,1,length()-2)}')
          # The 2nd hex intiger in this case is always a 1, or a
          SSPEED_HEX2="\x01\x00\x00\x00"
     fi
}

ss_convert

echo "HEX Shutter speed: ${SSPEED_HEX1}${SSPEED_HEX2}"
