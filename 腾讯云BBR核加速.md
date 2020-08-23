## 腾讯云轻量应用服务器开启BBR内核加速

特别提示:v2ray官方安装脚本更改，时间为：2020/8/17

```bash
# 之前v2ray安装脚本
bash <(curl -L -s https://install.direct/go.sh)

# 配置文件为/etc/v2ray/config.json

# 当前为：
curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
bash install-release.sh

# 具体请查看https://github.com/v2fly/fhs-install-v2ray/wiki/Migrate-from-the-old-script-to-this
```

如下部分有整理而来.

```
# 更新系统
yum update -y

# 查看系统版本
cat /etc/redhat-release
CentOS Linux release 7.6.1810 (Core)

# 安装内核
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml -y

# 查看可用内核
awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg

# 设置可用内核
grub2-set-default 0

# 必须执行.
grub2-mkconfig -o /boot/grub2/grub.cfg 

# 重启VPS
reboot

# 编辑文档，添加如下信息.
vi /etc/sysctl.conf

"""
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
"""

# 载入参数
sysctl -p 

# 查看是否成功.
sysctl net.ipv4.tcp_available_congestion_control

info：
net.ipv4.tcp_available_congestion_control = reno cubic bbr
```