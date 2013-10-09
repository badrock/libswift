#!/bin/sh -x
#
# OpenSSL for Android cross compilation
#
# Based on:
# http://blog.jimjh.com/compiling-open-source-libraries-with-android-ndk-part-2.html
# http://wiki.openssl.org/index.php/FIPS_Build_Guidelines
#
#

export NDK_ROOT=/arno/build/android-ndk-r7
export INSTALL_DIR=/arno/pkgs/openssl-1.0.1e-android

export PATH="$NDK_ROOT/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86/bin/:$PATH"
export SYS_ROOT="$NDK_ROOT/platforms/android-8/arch-arm/"
# Arno: autoprefixed bu CROSS_COMPILE
export CC="gcc --sysroot=$SYS_ROOT"
export LD="arm-linux-androideabi-ld"
export AR="arm-linux-androideabi-ar"
export RANLIB="arm-linux-androideabi-ranlib"
export STRIP="arm-linux-androideabi-strip"

export MACHINE=armv7l
export RELEASE=2.6.37
export SYSTEM=android
export ARCH=arm
export CROSS_COMPILE="arm-linux-androideabi-"
export ANDROID_DEV="$ANDROID_NDK/platforms/android-8/arch-arm/usr"
export HOSTCC=gcc

./config enable-ec no-shared --prefix=$INSTALL_DIR
#LIBS="-lc -lgcc"
make
make install
