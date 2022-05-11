# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### Selecting the CPU scheduler
# ATTENTION - one of seven predefined values should be selected!
# 'bmq' - select 'BitMap Queue CPU scheduler'
# 'pds' - select 'Priority and Deadline based Skip list multiple queue CPU scheduler'
# 'cacule' - select 'CacULE scheduler'
# 'cacule-rdb' - select 'CacULE-RDB scheduler'
# 'bore' - select 'Burst-Oriented Response Enhancer'
# 'tt' - select 'Task Type Scheduler by Hamad Marri'
# 'cfs' - select 'Completely Fair Scheduler'
_cpusched='cfs'

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

### Tweak kernel options prior to a build via nconfig
_makenconfig=

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y

## Enable Anbox
_anbox=

# Compile ONLY used modules to VASTLYreduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### Enable KBUILD_CFLAGS -O3
_cc_harder=y

### Set performance governor as default
_per_gov=y

### Enable TCP_CONG_BBR2
_tcp_bbr2=y

### Running with a 1000HZ, 750Hz, 600 Hz or 500Hz tick rate
_HZ_ticks=750

## Choose between perodic, tickless idle or full tickless
### Full tickless can give higher performances in various cases but, depending on hardware, lower consistency.
_tickrate=full

## Choose between full(low-latency), voluntary or server
_preempt=voluntary

### Disable MQ-Deadline I/O scheduler
_mq_deadline_disable=y

### Disable Kyber I/O scheduler
_kyber_disable=y

### Enable multigenerational LRU
_lru_enable=y

## Enable DAMON
_damon=

## enable SPECULATIVE_PAGE_FAULT
_spf_enable=y

## Enable Linux Random Number Generator
_lrng_enable=y

## Apply Kernel automatic Optimization
_use_auto_optimization=y

## Apply Kernel Optimization selecting
_use_optimization_select=

## Enable zram/zswap ZSTD compression
_zstd_compression=y

_nf_cone=y

# Clang LTO mode, only available with the "llvm" compiler - options are "no", "full" or "thin".
# "full: uses 1 thread for Linking, slow and uses more memory, theoretically with the highest performance gains."
# "thin: uses multiple threads, faster and uses less memory, may have a lower runtime performance than Full."
_use_llvm_lto=

## Change the thin lto cachedir for fixing building several dkms modules including zfs
_thin_lto_cachedir=

## Enable it for using the LLVM CFI PATCH for a better security
_use_cfi=

if [ -n "$_use_llvm_lto" ]; then
    pkgbase=linux-cachyos-${_cpusched}-lto
else
    pkgbase=linux-cachyos-${_cpusched}
fi
_major=5.17
_minor=6
#_minorc=$((_minor+1))
#_rcver=rc8
pkgver=${_major}.${_minor}
_stable=${_major}.${_minor}
#_stable=${_major}
#_stablerc=${_major}-${_rcver}
_srcname=linux-${_stable}
#_srcname=linux-${_major}
arch=(x86_64 x86_64_v3)
pkgdesc='Linux CFS scheduler Kernel by CachyOS with other patches and improvements'
pkgrel=4
arch=('x86_64' 'x86_64_v3')
url="https://github.com/CachyOS/linux-cachyos"
license=('GPL2')
options=('!strip')
makedepends=('bc' 'texlive-latexextra' 'libelf' 'pahole' 'cpio' 'perl' 'tar' 'xz' 'zstd' 'xmlto' 'git' 'gcc' 'gcc-libs' 'glibc' 'binutils' 'make' 'patch')
if [ -n "$_use_llvm_lto" ]; then
    makedepends+=(clang llvm lld python)
fi
_patchsource="https://raw.githubusercontent.com/ptr1337/kernel-patches/master/${_major}"
source=(
    "https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.xz"
    "config"
)
if [ "$_cpusched" = "bmq" ]; then
    source+=("${_patchsource}/sched/0001-prjc.patch")
fi
if [ "$_cpusched" = "pds" ]; then
    source+=("${_patchsource}/sched/0001-prjc.patch")
fi
if [ "$_cpusched" = "cacule" ]; then
    source+=("${_patchsource}/sched/0001-cacULE.patch")
fi
if [ "$_cpusched" = "cacule-rdb" ]; then
    source+=("${_patchsource}/sched/0001-cacULE.patch")
fi
if [ "$_cpusched" = "tt" ]; then
    source+=("${_patchsource}/sched/0001-tt.patch")
fi
if [ "$_cpusched" = "bore" ]; then
    source+=("${_patchsource}/sched/0001-bore-sched.patch")
fi
source+=(
    "${_patchsource}/0001-arch.patch"
    "${_patchsource}/0002-anbox.patch"
    "${_patchsource}/0003-bbr2.patch"
    "${_patchsource}/0004-cachy.patch"
    "${_patchsource}/0005-clearlinux.patch"
    "${_patchsource}/0006-cpu.patch"
    "${_patchsource}/0007-fixes-miscellaneous.patch"
    "${_patchsource}/0008-fs-patches.patch"
    "${_patchsource}/0009-hwmon.patch"
    "${_patchsource}/0010-lru-le9.patch"
    "${_patchsource}/0011-spf-lru.patch"
    "${_patchsource}/0012-xanmod.patch"
    "${_patchsource}/0013-lrng.patch"
    "${_patchsource}/0014-ck-hrtimer.patch"
    "${_patchsource}/0015-futex-winesync.patch"
    "auto-cpu-optimization.sh"
)

if [ -n "$_use_llvm_lto" ]; then
    BUILD_FLAGS=(
        LLVM=1
        LLVM_IAS=1
    )
fi

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {

    cd $_srcname

    echo "Setting version..."
    scripts/setlocalversion --save-scmversion
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done

    echo "Setting config..."
    cp ../config .config

    if [ -n "$_use_auto_optimization" ]; then
        "${srcdir}"/auto-cpu-optimization.sh
    fi

    if [ -n "$_use_optimization_select" ]; then
        source "${startdir}"/configure
        cpu_arch
    fi

    ### Selecting the CPU scheduler
    if [ "$_cpusched" = "bmq" ]; then
        echo "Selecting BMQ CPU scheduler..."
        scripts/config --enable SCHED_ALT \
                       --enable SCHED_BMQ \
                       --disable SCHED_PDS
    elif [ "$_cpusched" = "pds" ]; then
        echo "Selecting PDS CPU scheduler..."
        scripts/config --enable SCHED_ALT \
                       --disable SCHED_BMQ \
                       --enable SCHED_PDS
    elif [ "$_cpusched" = "cacule" ]; then
        echo "Selecting CacULE scheduler..."
        scripts/config --enable CACULE_SCHED \
                       --disable CACULE_RDB
    elif [ "$_cpusched" = "cacule-rdb" ]; then
        echo "Selecting CacULE-RDB scheduler..."
        scripts/config --enable CACULE_SCHED \
                       --enable CACULE_RDB \
                       --set-val RDB_INTERVAL 19
    elif [ "$_cpusched" = "tt" ]; then
        echo "Enable TT CPU scheduler..."
        scripts/config --enable TT_SCHED \
                       --enable TT_ACCOUNTING_STATS
    elif [ "$_cpusched" = "bore" ]; then
        echo "Selecting BORE Scheduler..."
        scripts/config --enable SCHED_BORE
    elif [ "$_cpusched" = "cfs" ]; then
        echo "Selecting Completely Fair Scheduler..."
    else
        if [ -n "$_cpusched" ]; then
            error "The value $_cpusched is invalid. Choose the correct one again."
        else
            error "The value is empty. Choose the correct one again."
        fi
        error "Selecting the CPU scheduler failed!"
        exit
    fi

#    if [ -n "$_use_cfi" ] && [ -n "$_use_llvm_lto" ]; then
#        echo "Enabling CFI"
#        scripts/config --enable ARCH_SUPPORTS_CFI_CLANG \
#                       --enable CFI_CLANG
#    fi

    if [ "$_use_llvm_lto" = "thin" ]; then
        echo "Enabling LLVM THIN LTO..."
        scripts/config --disable LTO_NONE \
                       --enable LTO \
                       --enable LTO_CLANG \
                       --enable ARCH_SUPPORTS_LTO_CLANG \
                       --enable ARCH_SUPPORTS_LTO_CLANG_THIN \
                       --enable HAS_LTO_CLANG \
                       --enable LTO_CLANG_THIN \
                       --enable HAVE_GCC_PLUGINS
        elif [ "$_use_llvm_lto" = "full" ]; then
        echo "Enabling LLVM FULL LTO..."
        scripts/config --disable LTO_NONE \
                       --enable LTO \
                       --enable LTO_CLANG \
                       --enable ARCH_SUPPORTS_LTO_CLANG \
                       --enable ARCH_SUPPORTS_LTO_CLANG_THIN \
                       --enable HAS_LTO_CLANG \
                       --enable LTO_CLANG \
                       --enable LTO_CLANG_FULL \
                       --enable HAVE_GCC_PLUGINS
    else
        scripts/config --enable LTO_NONE
    fi

    if [ "$_HZ_ticks" = "1000" ]; then
        echo "Setting tick rate to 1k Hz..."
        scripts/config --disable HZ_300 \
                       --enable HZ_1000 \
                       --set-val HZ 1000
    elif [ "$_HZ_ticks" = "750" ]; then
        echo "Setting tick rate to 750Hz..."
        scripts/config --disable HZ_300 \
                       --enable HZ_750 \
                       --set-val HZ 750
    elif [ "$_HZ_ticks" = "600" ]; then
        echo "Setting tick rate to 600Hz..."
        scripts/config --disable HZ_300 \
                       --enable HZ_600 \
                       --set-val HZ 600
    elif [ "$_HZ_ticks" = "500" ]; then
        echo "Setting tick rate to 500Hz..."
        scripts/config --disable HZ_300 \
                       --enable HZ_500 \
                       --set-val HZ 500
    elif [ "$_HZ_ticks" = "300" ]; then
        echo "Setting tick rate to 300Hz..."
    fi

    if [ -n "$_NUMAdisable" ]; then
        echo "Disabling NUMA from kernel config..."
        scripts/config --disable NUMA \
                       --disable AMD_NUMA \
                       --disable X86_64_ACPI_NUMA \
                       --disable NODES_SPAN_OTHER_NODES \
                       --disable NUMA_EMU \
                       --disable NEED_MULTIPLE_NODES \
                       --disable USE_PERCPU_NUMA_NODE_ID \
                       --disable ACPI_NUMA \
                       --disable ARCH_SUPPORTS_NUMA_BALANCING \
                       --disable NODES_SHIFT \
                       --undefine NODES_SHIFT \
                       --disable NEED_MULTIPLE_NODES
    fi

    if [ -n "$_mq_deadline_disable" ]; then
        echo "Disabling MQ-Deadline I/O scheduler..."
        scripts/config --disable MQ_IOSCHED_DEADLINE
    fi

    if [ -n "$_kyber_disable" ]; then
        echo "Disabling Kyber I/O scheduler..."
        scripts/config --disable MQ_IOSCHED_KYBER
    fi

    if [ -n "$_per_gov" ]; then
        echo "Setting performance governor..."
        scripts/config --disable CPU_FREQ_DEFAULT_GOV_SCHEDUTIL \
                       --enable CPU_FREQ_DEFAULT_GOV_PERFORMANCE \
                       --enable PCIEASPM \
                       --enable PCIEASPM_PERFORMANCE \
                       --enable PCIE_BUS_PERFORMANCE
  fi

    if [ "$_tickrate" = "perodic" ]; then
        echo "Enabling periodic ticks..."
        scripts/config --disable NO_HZ_IDLE \
                      --disable NO_HZ_FULL \
                      --disable NO_HZ \
                      --disable NO_HZ_COMMON \
                      --enable HZ_PERIODIC
    elif [ "$_tickrate" = "idle" ]; then
        echo "Enabling tickless idle..."
        scripts/config --disable HZ_PERIODIC \
                       --disable NO_HZ_FULL \
                       --enable NO_HZ_IDLE \
                       --enable NO_HZ \
                       --enable NO_HZ_COMMON
    elif [ "$_tickrate" = "full" ]; then
        echo "Enabling tickless idle..."
        scripts/config --disable HZ_PERIODIC \
                       --disable NO_HZ_IDLE \
                       --disable CONTEXT_TRACKING_FORCE \
                       --enable NO_HZ_FULL_NODEF \
                       --enable NO_HZ_FULL \
                       --enable NO_HZ \
                       --enable NO_HZ_COMMON \
                       --enable CONTEXT_TRACKING
    fi

    if [ "$_preempt" = "full" ]; then
        echo "Enabling low latency preempt..."
        scripts/config --enable PREEMPT_BUILD \
                      --disable PREEMPT_NONE \
                      --disable PREEMPT_VOLUNTARY \
                      --enable PREEMPT \
                      --enable PREEMPT_COUNT \
                      --enable PREEMPTION \
                      --enable PREEMPT_DYNAMIC
    elif [ "$_preempt" = "voluntary" ]; then
        echo "Enabling tickless idle..."
        scripts/config --enable PREEMPT_BUILD \
                      --disable PREEMPT_NONE \
                      --enable PREEMPT_VOLUNTARY \
                      --disable PREEMPT \
                      --enable PREEMPT_COUNT \
                      --enable PREEMPTION \
                      --enable PREEMPT_DYNAMIC
    elif [ "$_tickrate" = "server" ]; then
        echo "Enabling tickless idle..."
        scripts/config --enable PREEMPT_NONE_BUILD \
                       --enable PREEMPT_NONE \
                       --disable PREEMPT_VOLUNTARY \
                       --disable PREEMPT \
                       --disable PREEMPT_COUNT \
                       --disable PREEMPTION \
                       --disable PREEMPT_DYNAMIC
    fi

    if [ -n "$_cc_harder" ]; then
        echo "Enabling KBUILD_CFLAGS -O3..."
        scripts/config --disable CC_OPTIMIZE_FOR_PERFORMANCE \
                       --enable CC_OPTIMIZE_FOR_PERFORMANCE_O3
    fi

    if [ -n "$_tcp_bbr2" ]; then
        echo "Disabling TCP_CONG_CUBIC..."
        scripts/config --module TCP_CONG_CUBIC \
                       --disable DEFAULT_CUBIC \
                       --enable TCP_CONG_BBR2 \
                       --enable DEFAULT_BBR2 \
                       --set-str DEFAULT_TCP_CONG bbr2
    fi

    if [ -n "$_nf_cone" ]; then
        echo "Enabling FULLCONENAT..."
        scripts/config --module IP_NF_TARGET_FULLCONENAT \
                       --module NETFILTER_XT_TARGET_FULLCONENAT
    fi

    if [ -n "$_spf_enable" ]; then
        echo "Enabling SPECULATIVE_PAGE_FAULT LRU..."
        scripts/config --enable SPECULATIVE_PAGE_FAULT
    fi

    if [ -n "$_lru_enable" ]; then
        echo "Enabling multigenerational LRU..."
        scripts/config --enable ARCH_HAS_NONLEAF_PMD_YOUNG \
                       --enable LRU_GEN \
                       --enable LRU_GEN_ENABLED \
                       --disable LRU_GEN_STATS
    fi

    if [ -n "$_damon" ]; then
        echo "Enabling DAMON..."
        scripts/config --enable DAMON \
                       --disable DAMON_VADDR \
                       --disable DAMON_DBGFS \
                       --enable DAMON_PADDR \
                       --enable DAMON_RECLAIM
    fi

    if [ -n "$_lrng_enable" ]; then
        echo "Enabling Linux Random Number Generator ..."
        scripts/config --disable RANDOM_DEFAULT_IMPL \
                        --enable LRNG \
                        --enable LRNG_OVERSAMPLE_ENTROPY_SOURCES \
                        --set-val LRNG_OVERSAMPLE_ES_BITS 64 \
                        --set-val LRNG_SEED_BUFFER_INIT_ADD_BITS 128 \
                        --enable LRNG_IRQ \
                        --enable LRNG_CONTINUOUS_COMPRESSION_ENABLED \
                        --disable LRNG_CONTINUOUS_COMPRESSION_DISABLED \
                        --enable LRNG_ENABLE_CONTINUOUS_COMPRESSION \
                        --enable LRNG_SWITCHABLE_CONTINUOUS_COMPRESSION \
                        --disable LRNG_COLLECTION_SIZE_512 \
                        --enable LRNG_COLLECTION_SIZE_1024 \
                        --disable LRNG_COLLECTION_SIZE_2048 \
                        --disable LRNG_COLLECTION_SIZE_4096 \
                        --disable LRNG_COLLECTION_SIZE_8192 \
                        --set-val LRNG_COLLECTION_SIZE 1024 \
                        --enable LRNG_HEALTH_TESTS \
                        --set-val LRNG_RCT_CUTOFF 31 \
                        --set-val LRNG_APT_CUTOFF 325 \
                        --set-val LRNG_IRQ_ENTROPY_RATE 256 \
                        --enable LRNG_JENT \
                        --set-val LRNG_JENT_ENTROPY_RATE 16 \
                        --enable LRNG_CPU \
                        --set-val LRNG_CPU_ENTROPY_RATE 8 \
                        --enable LRNG_DRNG_SWITCH \
                        --enable LRNG_KCAPI_HASH \
                        --module LRNG_DRBG \
                        --module LRNG_KCAPI \
                        --enable LRNG_TESTING_MENU \
                        --disable LRNG_RAW_HIRES_ENTROPY \
                        --disable LRNG_RAW_JIFFIES_ENTROPY \
                        --disable LRNG_RAW_IRQ_ENTROPY \
                        --disable LRNG_RAW_IRQFLAGS_ENTROPY \
                        --disable LRNG_RAW_RETIP_ENTROPY \
                        --disable LRNG_RAW_REGS_ENTROPY \
                        --disable LRNG_RAW_ARRAY \
                        --disable LRNG_IRQ_PERF \
                        --disable LRNG_ACVT_HASH \
                        --enable LRNG_RUNTIME_ES_CONFIG \
                        --disable LRNG_RUNTIME_MAX_WO_RESEED_CONFIG \
                        --disable LRNG_TEST_CPU_ES_COMPRESSION \
                        --enable LRNG_SELFTEST \
                        --disable LRNG_SELFTEST_PANIC
    fi

    if [ -n "$_zstd_swap_compression" ]; then
        echo "Enabling zram ZSTD compression..."
        scripts/config --disable ZRAM_DEF_COMP_LZORLE \
                       --enable ZRAM_DEF_COMP_ZSTD \
                       --set-str ZRAM_DEF_COMP zstd \
                       --disable ZSWAP_COMPRESSOR_DEFAULT_LZ4 \
                       --enable ZSWAP_COMPRESSOR_DEFAULT_ZSTD \
                       --set-str ZSWAP_COMPRESSOR_DEFAULT zstd
    fi

    if [ -n "$_anbox" ]; then
        echo "Enable Anbox..."
        scripts/config --enable ASHMEM \
                       --enable ANDROID \
                       --enable ANDROID_BINDER_IPC \
                       --enable ANDROID_BINDERFS \
                       --enable ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
    fi

    scripts/config --enable ACPI_REV_OVERRIDE_POSSIBLE \
                   --enable ACPI_TABLE_UPGRADE

    # General architecture-dependent options
    scripts/config --enable KPROBES

    # Enable loadable module support
    scripts/config --undefine MODULE_SIG_FORCE \
                    --enable MODULE_COMPRESS_ZSTD

    # Networking support
    scripts/config --enable NETFILTER_INGRESS

    # Device Drivers
    scripts/config --enable FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER \
                   --enable DELL_SMBIOS_SMM \
                   --module PATA_JMICRON \
                   --enable-after SOUND SOUND_OSS_CORE \
                   --enable SND_OSSEMUL \
                   --module-after SND_OSSEMUL SND_MIXER_OSS \
                   --module-after SND_MIXER_OSS SND_PCM_OSS \
                   --enable-after SND_PCM_OSS SND_PCM_OSS_PLUGINS \
                   --module AGP --module-after AGP AGP_INTEL --module-after AGP_INTEL AGP_VIA \
                   --enable FW_LOADER_COMPRESS

    # Kernel hacking -> Compile-time checks and compiler options -> Make section mismatch errors non-fatal
    scripts/config --enable SECTION_MISMATCH_WARN_ONLY

    # File systems
    scripts/config --module NTFS3_FS \
                   --enable NTFS3_LZX_XPRESS \
                   --enable NTFS3_FS_POSIX_ACL

    scripts/config --module SMB_SERVER \
                   --enable SMB_SERVER_SMBDIRECT \
                   --enable SMB_SERVER_CHECK_CAP_NET_ADMIN \
                   --enable SMB_SERVER_KERBEROS5

    # Security options
    scripts/config --enable SECURITY_SELINUX \
                   --enable SECURITY_SELINUX_BOOTPARAM \
                   --enable SECURITY_SMACK \
                   --enable SECURITY_SMACK_BRINGUP \
                   --enable SECURITY_SMACK_NETFILTER \
                   --enable SECURITY_SMACK_APPEND_SIGNALS \
                   --enable SECURITY_TOMOYO \
                   --enable SECURITY_APPARMOR \
                   --enable SECURITY_YAMA

    scripts/config --disable DEBUG_INFO \
                   --disable DEBUG_INFO_BTF \
                   --disable DEBUG_INFO_DWARF4 \
                   --disable PAHOLE_HAS_SPLIT_BTF \
                   --disable DEBUG_INFO_BTF_MODULES

    echo "Enable USER_NS_UNPRIVILEGED"
    scripts/config --enable USER_NS

    echo "Enable WINE FASTSYNC"
    scripts/config --enable WINESYNC

    ### Optionally use running kernel's config
    # code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
    if [ -n "$_use_current" ]; then
        if [[ -s /proc/config.gz ]]; then
            echo "Extracting config from /proc/config.gz..."
            # modprobe configs
            zcat /proc/config.gz > ./.config
        else
            warning "Your kernel was not compiled with IKPROC!"
            warning "You cannot read the current config!"
            warning "Aborting!"
            exit
        fi
    fi


    ### Optionally load needed modules for the make localmodconfig
    # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
        if [ -e $HOME/.config/modprobed.db ]; then
            echo "Running Steven Rostedt's make localmodconfig now"
            make ${BUILD_FLAGS[*]} LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            echo "No modprobed.db data found"
            exit
        fi
    fi



    echo "Applying default config..."
    make ${BUILD_FLAGS[*]}  olddefconfig
    make ${BUILD_FLAGS[*]} -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"

    ### Running make nconfig
    [[ -z "$_makenconfig" ]] || make ${BUILD_FLAGS[*]} nconfig

    ### Save configuration for later reuse
    cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"

}

build() {
    cd ${_srcname}
    make ${BUILD_FLAGS[*]} -j$(nproc) all
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('crda: to set the correct wireless channels of your country'
        'linux-firmware: firmware images needed for some devices'
    'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)

    cd $_srcname

    local kernver="$(<version)"
    local modulesdir="$pkgdir/usr/lib/modules/$kernver"

    echo "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

    # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

    echo "Installing modules..."
    make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
        DEPMOD=/doesnt/exist modules_install  # Suppress depmod

    # remove build and source links
    rm "$modulesdir"/{source,build}
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    depends=(pahole)

    cd ${_srcname}
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    echo "Installing build files..."
    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
        localversion.* version vmlinux
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts

    # required when STACK_VALIDATION is enabled
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

#    # required when DEBUG_INFO_BTF_MODULES is enabled
#    if [ -f tools/bpf/resolve_btfids/resolve_btfids ]; then
#        install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
#    fi

    echo "Installing headers..."
    cp -t "$builddir" -a include
    cp -t "$builddir/arch/x86" -a arch/x86/include
    install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

    install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
    install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

    # https://bugs.archlinux.org/task/13146
    install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

    # https://bugs.archlinux.org/task/20402
    install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
    install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
    install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

    # https://bugs.archlinux.org/task/71392
    install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

    echo "Installing KConfig files..."
    find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

    echo "Removing unneeded architectures..."
    local arch
    for arch in "$builddir"/arch/*/; do
        [[ $arch = */x86/ ]] && continue
        echo "Removing $(basename "$arch")"
        rm -r "$arch"
    done

    echo "Removing documentation..."
    rm -r "$builddir/Documentation"

    echo "Removing broken symlinks..."
    find -L "$builddir" -type l -printf 'Removing %P\n' -delete

    echo "Removing loose objects..."
    find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

    echo "Stripping build tools..."
    local file
    while read -rd '' file; do
        case "$(file -bi "$file")" in
            application/x-sharedlib\;*)      # Libraries (.so)
                strip -v $STRIP_SHARED "$file" ;;
            application/x-archive\;*)        # Libraries (.a)
                strip -v $STRIP_STATIC "$file" ;;
            application/x-executable\;*)     # Binaries
                strip -v $STRIP_BINARIES "$file" ;;
            application/x-pie-executable\;*) # Relocatable binaries
                strip -v $STRIP_SHARED "$file" ;;
        esac
    done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

    echo "Stripping vmlinux..."
    strip -v $STRIP_STATIC "$builddir/vmlinux"

    echo "Adding symlink..."
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
    eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
    }"
done

sha256sums=('64ccf18380be5b5491322a3fd54904538b544e523e4bf86289dd8df7404cb10c'
            'bce05218cb52e8f70fd0e652483d0413cf3d3f8bcbe0302bfb2d2f195ea6ef7c'
            '09aa0e17190ee113a352573b2d2386cc04b522641fd277306e8ace9fd7af0037'
            'ddaf45cc72ed743f70c8754505357e94d6dd4133bfde6e9c6afc59f4cc12ee69'
            '6b31e4655e5ff9dbe95fb7db665426dad2bf3e33b5102d040a256f707cc99a23'
            '7936c3cc3c7be010539414b392f942664f95d9659a44c614a2e57c5c72cdacbf'
            'ef7d6253dc8a149ffea1293f65ef43fe9277ba6a629bc54d656f594429813b5e'
            'ab87b51fcacd9c7c5bf5d363ac45dab994c2c53d0e80e552390c7cbf752d7dca'
            '748d5b112d10870ce214c5fab1cc793492416faab73637e95c0a1b877b2574b7'
            '9625dd5a95a07ea94ea903a1bd7100ff2037c31d72c68ec43b9b6435a8f6dbf6'
            'b834d558c412add87fec0fc0ce117674216c1b8717f48eaf8134ac64249ba8b3'
            '9c2c0ccee49c17663f27dcdf43cfa02cd45ee15d53ff1a05da7e683098abdde1'
            '1b2dd9147b7443a42ec49e9d1bf01d1209bfcbe625e686e90f0276abb3ed52ec'
            '0e5177f086ddcac9b0e6596d29588c0730cce5c827e4c51e57f835a32f25ee85'
            '761abc5bd65c194b6b810af1022df5888ce0ecbe70ffe4cd67e6e0c748fb78a2'
            '07e34ca2f03d96837166ff4764503a76ff6f499107716455073e5e081b40a146'
            '179b540f8848b03ccb1a0d12e24feab63fd0576b5e9eed8f214d6e9cb790f151'
            '65ec9ac5b8b28d5b61df1c72498059be2e7cb1f9b965bac0e4ffed3c05520b2b')
