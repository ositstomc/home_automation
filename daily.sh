#!/bin/bash
w3m "https://www.timeanddate.com/sun/ireland/dublin" | grep "Sunrise Today" | awk '{print $3}' | sed 's/.$//' > /home/pi/sunrise.txt
w3m "https://www.timeanddate.com/sun/ireland/dublin" | grep "Sunset Today" | awk '{print $3}' | sed 's/.$//' > /home/pi/sunset.txt
echo "python /home/pi/pyenergenie/src/front_light_on.py" | at `cat /home/pi/sunset.txt`
echo "python /home/pi/pyenergenie/src/front_light_off.py" | at `cat /home/pi/sunrise.txt`
sudo find /tmp -iname *.avi -mtime +5 -exec rm -f {} \;
  
  
  
 
