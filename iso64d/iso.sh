#!/bin/sh
genisoimage -r -T -J -V "Slitaz_ISO" -b winly.bin -c boot.cat -no-emul-boot -boot-load-size 4 \
	-boot-info-table -eltorito-alt-boot -e efiboot.img -no-emul-boot -v -o ../slitaz5.0-rolling-core64-cn-docker.iso ./mkiso

