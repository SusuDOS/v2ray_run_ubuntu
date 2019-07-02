sudo vim /etc/rc.local

please add following cotant.

#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
nohup /home/gmxy/MyWorkStation/MyConfig/natapp/natapp -authtoken=**** >/home/gmxy/MyWorkStation/MyConfig/natapp/nohup.out 3>&1&

exit 0

# start with power on machine.
sudo chown root:root /etc/rc.local
sudo chmod 777 /etc/rc.local
sudo systemctl enable rc-local.service
