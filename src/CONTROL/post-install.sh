#!/bin/sh

PKG_PATH=$APKG_PKG_DIR/bin

case "${APKG_PKG_STATUS}" in

	install)
		;;
	upgrade)
		  cp -fa $APKG_TEMP_DIR/config.db $PKG_PATH/.
		;;
	*)
		;;
esac

exit 0
