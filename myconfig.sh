## Options for PKGBUILD
scripts/config --enable CONFIG_MZEN4
scripts/config --undefine CONFIG_GENERIC_CPU
scripts/config --undefine CONFIG_GENERIC_CPU2
scripts/config --undefine CONFIG_GENERIC_CPU3
scripts/config --undefine CONFIG_GENERIC_CPU4

# No NUMA available (use_numa=n)
scripts/config --disable CONFIG_NUMA

# Compress modules (_compress_modules=y)
scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD

## Custom options
# Disable INTEL
scripts/config --disable CONFIG_INTEL_IDLE
scripts/config --disable CONFIG_X86_INTEL_MCE
scripts/config --disable CONFIG_X86_INTEL_PSTATE
scripts/config --disable CONFIG_CPU_SUP_INTEL
scripts/config --disable CONFIG_CPU_SUP_HYGON
scripts/config --disable CONFIG_CPU_SUP_CENTAUR
scripts/config --disable CONFIG_CPU_SUP_ZHAOXIN

# Disable NVIDIA
scripts/config --disable CONFIG_DRM_NOUVEAU
scripts/config --disable CONFIG_DRM_NOUVEAU_BACKLIGHT
scripts/config --disable CONFIG_FB_NVIDIA
scripts/config --disable CONFIG_FB_NVIDIA_BACKLIGHT

# Disable various drivers
scripts/config --disable CONFIG_AGP
scripts/config --disable CONFIG_PCCARD
scripts/config --disable CONFIG_X86_NUMACHIP
scripts/config --disable CONFIG_X86_UV
scripts/config --disable CONFIG_FB_RIVA
scripts/config --disable CONFIG_MEDIA_ANALOG_TV_SUPPORT
scripts/config --disable CONFIG_MEDIA_DIGITAL_TV_SUPPORT
scripts/config --disable CONFIG_MEDIA_RADIO_SUPPORT
scripts/config --disable CONFIG_HAMRADIO

