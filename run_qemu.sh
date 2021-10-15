#!/bin/bash


/qemu-system-riscv64 -nographic -M virt -m 4096M -smp 1 -kernel build/platform/generic/firmware/fw_payload.elf \
-drive file=/rootfs.bin,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 \
-netdev user,id=net0,hostfwd=tcp::12138-:22 -device virtio-net-device,netdev=net0 \
-append "root=/dev/vda rw console=ttyS0 earlyprintk=ttyS0"