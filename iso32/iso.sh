#!/bin/sh
sudo dd if=/dev/zero of=efiboot.img bs=1M count=3
sudo mkfs.fat efiboot.img
sudo mount -o loop efiboot.img /mnt
sudo cp -rf mkiso/efi /mnt
sudo umount /mnt
sudo cp efiboot.img mkiso/
genisoimage -r -T -J -V "Slitaz_ISO" -b winly.bin -c boot.cat -no-emul-boot -boot-load-size 4 \
	-boot-info-table -eltorito-alt-boot -e efiboot.img -no-emul-boot -v -o slitaz5.0-rolling-core32-cn.iso ./mkiso
rm -f efiboot.img mkiso/efiboot.img
