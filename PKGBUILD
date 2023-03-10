# Maintainer: Chaiwat Suttipongsakul <cwt@bashell.com>
pkgname=visionfive2-i2c-rtc-ds1307
pkgver=0.1
pkgrel=3
pkgdesc="VisionFive2 Clock on I2C RTC-DS1307"
arch=('any')
url="https://github.com/cwt/visionfive2-i2c-rtc-ds1307"
license=('MIT')
depends=('i2c-tools' 'util-linux')
source=('rtc-ds1307-boot.service'
	'rtc-ds1307-shutdown.service'
	'rtc-ds1307.sh'
	'rtc-ds1307.conf'
	'rtc-ds1307.rules')
sha256sums=('bf1135f198daf87470a69d348ff8489575d742405610b87bc82fad4a14405dd3'
            '54142f693c0382f41bea096f5e3694438c5f912797a29530346e8e4c9f6f61df'
            '980da77ede2488fd897ba59bd8a3812827ef7a5bf307cec22d856a3d8101a54d'
            '90d172c32fe3202b0669bf59a1e3ad48e9dfac19e85f37e8fe7df94fb1fce45e'
            '2cd5958837b82d32a88aab07114c2c28c5cf32a2838b0327bf7ae4cb7428260b')

package() {
	install -Dm644 rtc-ds1307-boot.service "${pkgdir}/usr/local/lib/systemd/system/rtc-ds1307-boot.service"
	install -Dm644 rtc-ds1307-shutdown.service "${pkgdir}/usr/local/lib/systemd/system/rtc-ds1307-shutdown.service"
	install -Dm755 rtc-ds1307.sh "${pkgdir}/usr/local/sbin/rtc-ds1307.sh"
	install -Dm644 rtc-ds1307.conf "${pkgdir}/etc/rtc-ds1307.conf"
	install -Dm644 rtc-ds1307.rules "${pkgdir}/etc/udev/rules.d/99-rtc-ds1307.rules"
}

