Place the file at: /etc/udev/rules.d/97-backlight.rule
If that doesn't work, add "amdgpu.backlight=0" to /etc/default/grub and then run sudo update-grub
example
#GRUB_CMDLINE_LINUX_DEFAULT="splash apparmor=1 security=apparmor udev.log_priority=3"
GRUB_CMDLINE_LINUX_DEFAULT="splash amdgpu.backlight=0"
