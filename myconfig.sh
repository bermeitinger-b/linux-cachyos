# Compress modules (_compress_modules=y)
scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD

## Custom options
# Disable framebuffer
scripts/config --disable CONFIG_FB

# Disable INTEL
scripts/config --disable CONFIG_CPU_SUP_CENTAUR
scripts/config --disable CONFIG_CPU_SUP_HYGON
scripts/config --disable CONFIG_CPU_SUP_INTEL
scripts/config --disable CONFIG_DRM_I915
scripts/config --disable CONFIG_INTEL_IDLE
scripts/config --disable CONFIG_X86_INTEL_MCE
scripts/config --disable CONFIG_X86_INTEL_PSTATE

# Disable NVIDIA
scripts/config --disable CONFIG_DRM_NOUVEAU
scripts/config --disable CONFIG_DRM_NOUVEAU_BACKLIGHT
scripts/config --disable CONFIG_FB_NVIDIA
scripts/config --disable CONFIG_FB_NVIDIA_BACKLIGHT

# Disable filesystems
scripts/config --disable CONFIG_BCACHEFS_FS
scripts/config --disable CONFIG_JFS_FS
scripts/config --disable CONFIG_NFS_FS
scripts/config --disable CONFIG_NTFS3_FS
scripts/config --disable CONFIG_NTFS_FS
scripts/config --disable CONFIG_REISERFS_FS
scripts/config --disable CONFIG_SCSI
scripts/config --disable CONFIG_XFS_FS

# Disable various drivers
scripts/config --disable CONFIG_ACCESSIBILITY
scripts/config --disable CONFIG_AGP
scripts/config --disable CONFIG_FB_RIVA
scripts/config --disable CONFIG_FPGA
scripts/config --disable CONFIG_GNSS
scripts/config --disable CONFIG_GPIO
scripts/config --disable CONFIG_HAMRADIO
scripts/config --disable CONFIG_IIO
scripts/config --disable CONFIG_INPUT_JOYSTICK
scripts/config --disable CONFIG_ISDN
scripts/config --disable CONFIG_MEDIA_ANALOG_TV_SUPPORT
scripts/config --disable CONFIG_MEDIA_DIGITAL_TV_SUPPORT
scripts/config --disable CONFIG_MEDIA_RADIO_SUPPORT
scripts/config --disable CONFIG_NET_VENDOR_MELLANOX
scripts/config --disable CONFIG_NFC
scripts/config --disable CONFIG_PCCARD
scripts/config --disable CONFIG_SUNRPC
scripts/config --disable CONFIG_TAP
scripts/config --disable CONFIG_USB_SERIAL
scripts/config --disable CONFIG_X86_NUMACHIP
scripts/config --disable CONFIG_X86_UV
