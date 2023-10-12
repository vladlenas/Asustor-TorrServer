#!/bin/sh

if [[ -z $APKG_PKG_DIR ]]; then
	PKG_DIR=/usr/local/AppCentral/torrserver
else
	PKG_DIR="${APKG_PKG_DIR}"
fi

CONFIG_DIR=$PKG_DIR/config

case ${APKG_PKG_STATUS} in

    install)
	;;
    upgrade)   
	cp -fa $APKG_TEMP_DIR/* $CONFIG_DIR/
	;;
    *)
	;;
esac

exit 0
