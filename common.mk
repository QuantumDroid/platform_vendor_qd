PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.alarm_alert=Hassium.ogg

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/qd/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/qd/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/qd/prebuilt/common/bin/blacklist:system/addon.d/blacklist \
    vendor/qd/prebuilt/common/bin/whitelist:system/addon.d/whitelist \

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/qd/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/qd/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip

# init.d support
PRODUCT_COPY_FILES += \
    vendor/qd/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/qd/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/qd/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init file
PRODUCT_COPY_FILES += \
    vendor/qd/prebuilt/common/etc/init.local.rc:root/init.qd.rc

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Misc packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    Browser \
    Development \
    MusicFX \
    libemoji \
    libsepol \
    mke2fs \
    tune2fs \
    bash \
    nano \
    htop \
    powertop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    Terminal

# Snapdragon Music Player
PRODUCT_PACKAGES += \
    SnapdragonMusic

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif

# File Manager
PRODUCT_PACKAGES += \
    CMFileManager

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    libphonenumbergoogle \
    messaging \
    Stk \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# World APN list
PRODUCT_COPY_FILES += \
    vendor/qd/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/qd/overlay/common

# LatinIME...

# Build LatineIME
PRODUCT_PACKAGES += \
    LatinIME

# Include LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/qd/overlay/dictionaries

# Proprietary LatinIME libs needed for keyboard swyping
ifneq ($(filter arm64,$(TARGET_ARCH)),)
PRODUCT_COPY_FILES += \
    vendor/qd/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/qd/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

# QuantumDroid Version
QD_VERSION := QuantumDroid-V1.0

PRODUCT_PROPERTY_OVERRIDES += \
	ro.mod.version=$(QD_VERSION) \
	ro.qd.version=$(QD_VERSION)

# By default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

$(call inherit-product-if-exists, vendor/extra/product.mk)
