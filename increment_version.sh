#!/bin/sh

LATEST_TAG=$(git describe --abbrev=0 --tags 2>/dev/null || echo "0.0.0")

change_ver() { 
    # $1 is PUBSPEC_VER
    MAJOR=$(echo $LATEST_TAG | awk -F"." '{ print $1 }')
    MAJOR=$(echo $MAJOR | sed "s/v//")
    MINOR=$(echo $LATEST_TAG | awk -F"." '{ print $2 }')
    PATCHES=$(echo $LATEST_TAG | awk -F"." '{ print $3 }')

    PATCHES=$(($PATCHES + 1))
    if [[ $PATCHES -ge 10 ]]; then
        PATCHES=0
        MINOR=$(($MINOR + 1))
    fi

    if [[ $MINOR -ge 10 ]]; then
        MINOR=0
        MAJOR=$(($MAJOR + 1))
    fi

    echo ${MAJOR}.${MINOR}.${PATCHES}
}

echo "v$(change_ver)"
