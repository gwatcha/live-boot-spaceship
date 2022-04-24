# Spaceship-Portable (Alma Preset) (Manjaro KDE) (Very Nice)

See [Alma](https://github.com/philmmanjaro/alma)

## Usage

Create `.img`
```sh
sudo ALMA_USER="mini" ALMA_PASS="   " alma create --presets spaceship --image 14Gib spaceship.img
```

Then, in a console...

```sh
sudo losetup -f ./spaceship.img
sudo alma qemu ${sudo losetup -j ./spaceship.img}
```

To 'chroot' into the img.

Then, perform the manual setup by logging in and running

```sh
yay -S zplug xcp bulk-git 
```

And to get firefox pretty, to copy the `chrome` folder from the $ALMA_USER folder to `${ALMA_USER}/.mozilla/firefox/(user profile)/`

Your disk will then be a persistent live-boot device with a beautiful productive kde suite customized with love and firey intelligent optimization.

Then, on tne parent machine, copy the working `spaceship.img` to a drive like an external usb or ssd using..

```sh
sudo dd if=spaceship.img of=/dev/<drive> bs=4M conv=noerror status=progress
```

And there you go! A portable, usable, pretty, and super-powerful manjaro plasma workstation that you can take anywhere! Join it with a drive which stores your `home` folder, and you are now able to run your computer on most computer hardware - just select to boot from your <device> in the start-up screen.
