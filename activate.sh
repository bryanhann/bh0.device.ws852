bh0-device-ws852.acc () {
    DEV=/Volumes/WS-852/device.ws852
    ${DEV}/process.sh
    echo ---copying from device to acc---
    for file in ${DEV}/__RAW__/*.mp3 ; do
        echo moving $file...
        mv $file ${__BH0_ACC__}/.
    done
   # cp ${DEV}/__RAW__/* ${__BH0_ACC__}/.
   # /Volumes/WS-852/device.ws852/process.sh
   # cp /Volumes/WS-852/device.ws852/__RAW__/* ${__BH0_RAW__}/bh0.device.ws852
}

