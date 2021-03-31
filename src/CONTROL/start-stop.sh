#!/bin/sh


PKG_PATH=$APKG_PKG_DIR/bin
PORT=8090

case $1 in

  start)
    /usr/bin/nohup $PKG_PATH/torrserver -p $PORT -d $PKG_PATH &
    sleep 1
    ;;

  stop)
    /usr/bin/killall torrserver
    /bin/sync
    sleep 1
    ;;

  *)
    echo "usage: $0 {start|stop}"
    exit 1
    ;;

esac

exit 0
