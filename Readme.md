# My ansible host setup 

## Requirements and genereal system setup before ansible
The `main` branch is for Fedora.

### Install nvidia drivers
```
sudo dnf update -y
```
(!) reboot if you are not on the latest kernel
```
sudo dnf install akmod-nvidia
sudo dnf install xorg-x11-drv-nvidia-cuda
```
(!) Please remember to wait after the RPM transaction ends, until the kmod get built. This can take up to 5 minutes on some systems.
You can check it using `modinfo -F version nvidia`. it should outputs the version of the driver such as 440.64
and not modinfo: ERROR: Module nvidia not found.


### Enable RPM Fusion Repo
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### `python` und `ansible` must be installed
 ```
 sudo dnf install python-pip
 python -m pip install --user ansible==2.9.27
 ```
-

### User
There must be a user `pdahse` having sudo without password privileges

## Manually Setups
### oh-my-zsh
You need to make zsh as the default shell by your own
```
chsh -s $(which zsh)
```
