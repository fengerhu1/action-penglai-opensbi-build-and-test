#!/bin/bash -l

echo "Start Build Opensbi-based Penglai Monitor"
echo "Entering github work directory"
# download rootfs.bin from storage server.
wget -c https://ipads.se.sjtu.edu.cn:1313/f/eba7b5d7941848f0a993/?dl=1 -O /rootfs.bin --no-check-certificate

# download Image from storage server.
wget -c https://ipads.se.sjtu.edu.cn:1313/f/bc1d7c7e958642cfb1db/?dl=1 -O /Image --no-check-certificate

# download qemu-riscv from storage server.
wget -c https://ipads.se.sjtu.edu.cn:1313/f/764f9526ba1242f68927/?dl=1 -O /qemu-system-riscv64 --no-check-certificate

chmod +x /qemu-system-riscv64

cd /github/workspace
mkdir build
CROSS_COMPILE=riscv64-unknown-linux-gnu- make O=build PLATFORM=generic FW_PAYLOAD_PATH=/Image
sleep 10
echo "Build Succeed"
expect /run_test.exp
