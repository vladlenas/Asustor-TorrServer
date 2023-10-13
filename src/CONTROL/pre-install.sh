#!/bin/sh

PKG_PATH=$APKG_PKG_DIR/bin

case "${APKG_PKG_STATUS}" in

	install)
		;;
	upgrade)
	          cp -af $PKG_PATH/config.db $APKG_TEMP_DIR/.
		;;
	*)
		;;
esac

exit 0
