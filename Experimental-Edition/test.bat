qemu-system-i386 -m 1500M -monitor stdio -drive file=hdd.img,if=none,id=hdd0 -device ich9-ahci,id=ahci -device ide-drive,drive=hdd0,bus=ahci.1 