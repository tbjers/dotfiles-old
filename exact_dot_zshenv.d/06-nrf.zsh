#!/usr/bin/env zsh

if [ -d "${HOME}/ARM/gcc-arm-none-eabi-10.3-2021.10" ]; then
  export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
  export GNUARMEMB_TOOLCHAIN_PATH="${HOME}/ARM/gcc-arm-none-eabi-10.3-2021.10"
  PATH="${HOME}/ARM/gcc-arm-none-eabi-10.3-2021.10/bin:$PATH"
fi

. ${HOME}/ncs/zephyr/zephyr-env.sh
