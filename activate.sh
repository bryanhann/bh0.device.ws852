bh0-device-ws852.fetch () {
    mkdir -p $BH0__RAW__/bh0.device.ws852
    /Volumes/WS-852/device.ws852/process.sh
    cp /Volumes/WS-852/device.ws852/__RAW__/* $BH0__RAW__/bh0.device.ws852
}

