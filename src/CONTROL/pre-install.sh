#!/bin/sh

if [[ -z $APKG_PKG_DIR ]]; then
	PKG_DIR=/usr/local/AppCentral/torrserver
else
	PKG_DIR="${APKG_PKG_DIR}"
fi

OLD_CONFIG=$PKG_DIR/bin/config.db
CONFIG_DIR=$PKG_DIR/config

case "${APKG_PKG_STATUS}" in

    install)
	;;
    upgrade)   
	if [[ -f $OLD_CONFIG ]]; then
	    cp -af $OLD_CONFIG $APKG_TEMP_DIR/
	else
	    cp -af $CONFIG_DIR/* $APKG_TEMP_DIR/
	fi	   
	;;
    *)
	;;
esac

exit 0
