#add_lunch_combo twrp_earth-eng
#add_lunch_combo twrp_earth-user
#add_lunch_combo twrp_earth-userdebug

FDEVICE="earth"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
        export TW_DEFAULT_LANGUAGE="en"
        export LC_ALL="C"
        export ALLOW_MISSING_DEPENDENCIES=true
        export OF_USE_GREEN_LED=0
        export OF_FBE_METADATA_MOUNT_IGNORE=1
        export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1

        export OF_USE_MAGISKBOOT=1
        export OF_USE_NEW_MAGISKBOOT=1
        export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
        export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
        export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
        export OF_NO_MIUI_PATCH_WARNING=1
        export FOX_USE_BASH_SHELL=1
        export FOX_ASH_IS_BASH=1
        export FOX_USE_TAR_BINARY=1
        export FOX_USE_SED_BINARY=1
        export FOX_USE_XZ_UTILS=1
        export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
        export OF_QUICK_BACKUP_LIST="/boot;/dtbo;"
        export OF_PATCH_AVB20=1

        # OTA
        export OF_KEEP_DM_VERITY=1
        export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
        export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1

        # Screen Settings
        export OF_SCREEN_H=2340
        export OF_STATUS_H=110
        export OF_STATUS_INDENT_LEFT=48
        export OF_STATUS_INDENT_RIGHT=48
        export OF_CLOCK_POS=0
        export OF_HIDE_NOTCH=1
        export OF_ALLOW_DISABLE_NAVBAR=0

        # R12.1 Settings
        export FOX_VERSION="R12.1"
        export OF_MAINTAINER="nanerbs25"
        export FOX_BUILD_TYPE="Beta"

        # Run a Process after Formatting Data to Work-Around MTP Issues
        export OF_RUN_POST_FORMAT_PROCESS=1

        # let's see what are our build VARs
        if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
             export | grep "FOX" >> $FOX_BUILD_LOG_FILE
             export | grep "OF_" >> $FOX_BUILD_LOG_FILE
              export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
             export | grep "TW_" >> $FOX_BUILD_LOG_FILE
         fi
fi
#
