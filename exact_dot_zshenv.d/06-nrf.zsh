#!/usr/bin/env zsh

EMB_VERSION=9-2019-q4-major
EMB_ROOT_PATH=${HOME}/ARM/gcc-arm-none-eabi-${EMB_VERSION}

if [ -d ${EMB_ROOT_PATH} ]; then
  export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
  export GNUARMEMB_TOOLCHAIN_PATH=${EMB_ROOT_PATH}
  PATH="${EMB_ROOT_PATH}/bin:${PATH}"
fi

. ${HOME}/ncs/zephyr/zephyr-env.sh
