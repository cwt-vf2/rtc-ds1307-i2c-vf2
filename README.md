# VisionFive2 Clock on I2C RTC-DS1307
This is a package to read clock from an external RTC DS1307 via I2C bus.

There are two systemd units in the package
1. `rtc-ds1307-boot.service` this unit run at `sysinit.target` to make sure the system clock is loaded from the RTC earlier than other services.
2. `rtc-ds1307-shutdown.service` this unit run before shutdown or reboot to update the to most recent system clock before shutdown or reboot.

Both units execute a script `rtc-ds1307.sh` with **boot** or **shutdown** parameters.

With **boot** parameter, the script will load module `rtc_ds1307` first, and then try to instantiate ds1307 at the given I2C bus and address provided by `/etc/rtc-ds1307.conf`. If success, it will set system clock from the external RTC `/dev/rtc1`, and then set the internal RTC `/dev/rtc0` to match the system clock. So, if there is any program that hardcoded to use `/dev/rtc0`, it will be fine.

With **shutdown** parameter, the script will set the external RTC clock with the current system clock.

The provided udev-rules file will make `/dev/rtc` linked to `/dev/rtc1` instead of `/dev/rtc0`.

##  Building
```bash
makepkg -s
```

##  Installing
```bash
sudo pacman -U visionfive2-i2c-rtc-ds1307-[version-release]-any.pkg.tar.zst
sudo systemctl enable rtc-ds1307-boot.service
sudo systemctl enable rtc-ds1307-shutdown.service
```

##  License
This package is under [MIT License](LICENSE).
