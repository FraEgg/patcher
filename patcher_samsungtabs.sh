#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
PATCHER_PATH=$ROM_TREE/patcher
SULTAN=$PATCHER_PATH/sultan
ZX2C4=$PATCHER_PATH/zx2c4
CUSTOM=$PATCHER_PATH/custom

# Clean up first
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/native
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/LockClock
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard

cd $ROM_TREE

### zx2c4's patches
#$ZX2C4/wireguard-fetch.sh || rm -f $ZX2C4/wireguard-src.patch
#patch -d kernel/samsung/exynos5420		-p1 -s -N --no-backup-if-mismatch < $ZX2C4/wireguard-src.patch

### Custom
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $SULTAN/system-core0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $SULTAN/system-core1.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $SULTAN/system-core2.patch
patch -d vendor/cm				-p1 -s -N --no-backup-if-mismatch < $SULTAN/vendor-cm0.patch
#patch -d vendor/cm				-p1 -s -N --no-backup-if-mismatch < $SULTAN/vendor-cm1.patch

### microG patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/microG_android_frameworks_base-N.patch
