qemu-system-i386 -kernel aqeous.bin -smp 4 -m 1500M -monitor stdio -drive file=hdd.hdd,if=none,id=hdd0 -device ich9-ahci,id=ahci -device ide-drive,drive=hdd0,bus=ahci.1 