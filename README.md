# v2ray_run_ubuntu
this is description how to cross GFW on the ubuntu with v2ray

# the first step, get script...
sudo apt install curl
wget https://install.direct/go.sh

# we can use this script,such as...
bash ./go.sh

# but, we more likely use this.
sudo bash go.sh --local ./v2ray-linux-64.zip 

# v2ray-linux-64.zip, you can get it from github,maybe you'd better to download it.
# files_https: https://github.com/v2ray/v2ray-core/releases

# if we ensure my file's path, config.json is the same of server config and /etc/v2ray/config.json, we can.
sudo cp config.json /etc/v2ray/config.json
sudo chmod 777 /etc/v2ray/config.json

# start v2ray.
service v2ray start 

# check v2ray status.
service v2ray status  

# stop v2ray. 
service v2ray stop



#### we can config my agent on the network, and also use proxychains.####
sudo apt install proxychains

sudo nano /etc/proxychains.conf
# please change the last line to follow line.
socks5 127.0.0.1 10808

# test my config.
proxychains wget http://www.google.com

# bash cmd on agent, bash=name.
proxychains bash

# stop v2ray
service v2ray stop
