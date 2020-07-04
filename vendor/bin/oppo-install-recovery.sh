#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:7003ddd9905b3ebef31fbc86f073ad4d7c445a15; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:b64bf8ac8c4e0fbe85b56c56f0e32ce098cd30fd \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:7003ddd9905b3ebef31fbc86f073ad4d7c445a15 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
