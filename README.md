# Spaceship

![](./spaceship.jpg)

Listen to me talk spaceship here: odysee.com/@kokopelli-interfaces:a/spaceship:6

>    This repository shows you how to make a storage device (usb, ssd..) into persistent live-boot device with a beautiful blazing all-in-one plasma 'Spaceship' desktop environment iterated with love and firey intelligent human interface optimization over the past few years. It's a next generation computer interface. It is a sacred relic in a museum of beautiful Unix environments. It is ten times productive then standard setups and infinitely more awesome. It's as easy as Mac or Windows yet it's virtuosity cap is through the roof (*though not necessarily familiar*).
>    

## Install

The installation guide has been made for pacman unix systems.

### Option 1 - Direct Install

Using preset `more-gui-apps`...
```sh
sudo ALMA_USER="your username" ALMA_PASS="your password" alma create --presets presets/more-gui-apps /dev/<your disk>
```

And now using preset `minimal-gui-apps`... 
> *I use this one, and it may not be for you depending on how muchh you want to invest into a powerful, human-emergent computer interface. It pushes one to use the console interface rather than relying on gui apps, which sets one on a path towards a star field of computer virtuosity - rather than a dead-end of point-and-click programs.* 
```sh
sudo ALMA_USER="your username" ALMA_PASS="your password" alma create --presets presets/minimal-gui-apps /dev/<your disk>
```

### Option2 - Create .img, test, and burn

Create `.img`. It is recommended the device size be above 10 Gib.
```sh
sudo ALMA_USER="username" ALMA_PASS="password" create --presets presets/more-gui-apps --image <desired device size> spaceship.img
```

You will be able to see the progress. When it is done, you can 'burn' it to a virtual device and test it with qemu:

```sh
# 'Burn' spaceship to a virtual loop device
sudo losetup -f ./spaceship.img
# Check which loop device it is mounted on
sudo losetup -j ./spaceship.img
# Test it out with qemu
sudo alma qemu /dev/<loop device>
```

Then, burn it to a real device
```sh
# Find your device
sudo lsblk
# Burn it
sudo popsicle spaceship.img /dev/<your space device>
```

And there you go! A portable, usable, pretty, and super-powerful plasma workstation that you can take anywhere! If your using a small drive, join it with a drive which stores the your user `home` folder, and you are now able to run your computer on most computer hardware - just select to boot from your <device> in the start-up screen.

### Credits

See [Alma](https://github.com/philmmanjaro/alma)
