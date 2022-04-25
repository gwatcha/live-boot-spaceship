# Spaceship-Portable (Alma Preset) (Manjaro KDE) (Very Nice)

See [Alma](https://github.com/philmmanjaro/alma)

This repository shows you how to make a storage device (usb, ssd..) into persistent live-boot device with a beautiful productive kde suite customized with love and firey intelligent optimization. It's a next generation computer interface. It is an ancient piece in a museum of Unix environments. It is ten times productive then standard setups and 13 times more awesome.

## Install

### Option 1 - Direct Install
```sh
sudo ALMA_USER="username" ALMA_PASS="password" alma create --presets spaceship /dev/<your disk>
```

### Option2 - Create .img

Create `.img`
```sh
sudo ALMA_USER="username" ALMA_PASS="password" create --presets spaceship --image 14Gib spaceship.img
```

You will be able to see the progress. When it is done, you can test test it in a virtual environment:

```sh
sudo losetup -f ./spaceship.img
sudo alma qemu $(sudo losetup -j ./spaceship.img | sd '(^[^:]*).*' '$1')
```

## Manual Steps

1. To get a spaceship vim-like omni-bar firefox copy the `chrome` folder from the `Dotfiles` folder to `${ALMA_USER}/.mozilla/firefox/(user profile)/`
2. Set the background to the image in `Dotfiles`


Then, on tne parent machine, copy the working `spaceship.img` to a drive like an external usb or ssd using..

```sh
sudo dd if=spaceship.img of=/dev/<drive> bs=4M conv=noerror status=progress
```

And there you go! A portable, usable, pretty, and super-powerful manjaro plasma workstation that you can take anywhere! Join it with a drive which stores your `home` folder, and you are now able to run your computer on most computer hardware - just select to boot from your <device> in the start-up screen.
