#!/bin/bash

SUPPORT_TYPE_TAR="tar"
SUPPORT_TYPE_TAR_GZ="tar.gz"
SUPPORT_TYPE_TGZ="tgz"
SUPPORT_TYPE_ZIP="zip"
SUPPORT_TYPE_RAR="rar"
support_list="$SUPPORT_TYPE_TAR $SUPPORT_TYPE_TAR_GZ $SUPPORT_TYPE_TGZ $SUPPORT_TYPE_ZIP $SUPPORT_TYPE_RAR"

if_help=$1

if [ "$if_help" == "--help" ] || [ "$if_help" == "-h" ]; then
    echo "command list:"
    echo "  -f file"
    echo "  -d dir"
    echo "support type: $support_list"
    exit 0
fi

file=""
dir=""

while getopts ":f:d:" opt; do
    case $opt in
    f)
        file=$OPTARG
        echo "unzip file: $file"
        ;;
    d)
        dir=$OPTARG
        echo "unzip dir: $dir"
        ;;
    *)
        echo "unknow arg: $opt"
        echo "unknow arg value:$OPTARG"
        exit 0
        ;;
    ?)
        echo "unknow arg: $opt"
        echo "unknow arg value:$OPTARG"
        exit 0
        ;;
    esac
done

if [ -z "$file" ]; then
    echo "file is empty"
    exit 0
fi

if !([ -f "$file" ]); then
    echo "file is noexit"
    exit 0
fi

if [ -z "$dir" ]; then
    echo "dir is empty"
    exit 0
fi

file_type="${file#*.}"


if [[ "$support_list" =~ "$file_type" ]]; then
    if ([ -d "$dir" ]); then
        echo "dir exist: $dir"
    else
        echo "create dir: $dir"
        mkdir $dir
    fi
    echo "file type: ${file_type}"
else
    echo "unknow file type:${file_type}"
    exit 0
fi

# echo split line
str="-"
ScreenLen=$(stty size | awk '{print $2}')
yes ${str} | sed ''''${ScreenLen}'''q' | tr -d "\n" && echo

NOW_PATH=$(pwd)
case ${file_type} in
$SUPPORT_TYPE_TAR)
    tar -xvf $file -C $dir
    ;;
$SUPPORT_TYPE_TAR_GZ)
    tar -zxvf $file -C $dir
    ;;
$SUPPORT_TYPE_TGZ)
    tar -zxvf $file -C $dir
    ;;
$SUPPORT_TYPE_ZIP)
    unzip -d $dir $file
    ;;
$SUPPORT_TYPE_RAR)
    unrar x $file "$NOW_PATH/$dir/"
    ;;
*)
    echo "unknow file type:${file_type}"
    exit 0
    ;;
esac

# echo split line
str="-"
ScreenLen=$(stty size | awk '{print $2}')
yes ${str} | sed ''''${ScreenLen}'''q' | tr -d "\n" && echo

echo "$NOW_PATH/$dir/"
echo "unzip file: $file"
echo "unzip dir: $dir"
