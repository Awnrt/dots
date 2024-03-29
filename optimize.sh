sudo echo "options hid_apple fnmode=0" > /etc/modprobe.d/hid_apple.conf 
sudo echo "options nvidia NVreg_RegistryDwords=\"PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3\"" > /etc/modprobe.d/nvidia.conf

sudo mkdir /etc/systemd/system/dhcpcd@eno1.service.d/
sudo echo "[Service]" >> /etc/systemd/system/dhcpcd@eno1.service.d/no-wait.conf
sudo echo "ExecStart=" >> /etc/systemd/system/dhcpcd@eno1.service.d/no-wait.conf
sudo echo "ExecStart=/usr/bin/dhcpcd -b -q %I" >> /etc/systemd/system/dhcpcd@eno1.service.d/no-wait.conf

sudo echo "noarp" >> /etc/dhcpcd.conf

sudo systemctl enable cpupower.service
sudo systemctl start cpupower.service

sudo echo "governor='performance'" >> /etc/default/cpupower

sudo echo "min_freq='4.3GHz'" >> /etc/default/cpupower

sudo echo "min_freq='4.8GHz'" >> /etc/default/cpupower

sudo mkinitcpio -P
