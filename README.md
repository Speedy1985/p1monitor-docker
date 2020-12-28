## P1Monitor - Docker version

Note:  P1 Monitor image can be download from https://www.ztatz.nl/p1-monitor/

### Pre tasks before you can use the p1monitor-docker
- Download last image from https://www.ztatz.nl/p1-monitor/
- Rename the image to p1monitor.img
- Run: ./extract_image.sh

#### Build the image
- docker-compose build

### Start the monitor (-d detach to background)
- docker-compose up -d

### Stop the monitor
- docker-compose down

### Install start/stop service to make sure the mointor is started after reboot
- place the service file in /etc/systemd/system
- run systemctl enable p1monitor
- after this you can start/stop with sytemctl start p1monitor
