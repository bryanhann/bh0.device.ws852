export __HERE__MAGIC_678908125ffkuj=$(dirname $0)
ws852._macpath   () { echo '/Volumes/WS-852'         ; }
ws852._path      () { echo $(ws852._macpath)          ; }
ws852._renamed   () { echo $(ws852._path)/__RENAMED__ ; }
ws852._raw       () { echo ${__BH0_RAW__}/ws852.raw  ; }


ws852._rename () {
    # In the device, move natively recorded files of the form
    # [./RECORDER/FOLDER_/*.] to the folder [./__RENAMED__],
    # renaming them in the process.
    SCRIPT=${__HERE__MAGIC_678908125ffkuj}/rename.py
    PATTERN='/RECORDER/FOLDER_[A-F]/[0-9]*_[0-9]*.[Mm][Pp][3]'
    DST=$(ws852._path)/__RENAMED__
    [[ -d $(ws852._path) ]] || { echo device disconected; return; }
    mkdir -p $(ws852._renamed)
    for oldpath in $(find $(ws852._path) | grep ${PATTERN}); do
        newpath=$(ws852._renamed)/$(python ${SCRIPT} $oldpath)
        echo $oldpath '-->' $newpath
        mv $oldpath $newpath
    done
}

ws852._upload () {
    [[ -d $(ws852._path) ]] || { echo device disconected; return; }
    mkdir -p $(ws852._raw)
    for file in $(ls $(ws852._renamed)); do
        src=$(ws852._renamed)/$file
        dst=$(ws852._raw)/$file
        echo "$src -> $dst"
        mv $src $dst
    done
}

define ws852.fetch () {
    ws852._rename
    ws852._upload
}
