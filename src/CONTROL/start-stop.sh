#!/bin/sh

if [[ -z $APKG_PKG_DIR ]]; then
	PKG_DIR=/usr/local/AppCentral/torrserver
else
	PKG_DIR="${APKG_PKG_DIR}"
fi

SERVICE_COMAND=$PKG_DIR/bin/torrserver
CONFIG_DIR=$PKG_DIR/config
LOG_FILE=$PKG_DIR/torrserver.log
PORT=8090

case $1 in

    start)
      if [[ -r $CONFIG_DIR/accs.db ]]; then   
          /usr/bin/nohup $SERVICE_COMAND -p $PORT -d $CONFIG_DIR -a -l $LOG_FILE &
          sleep 1
      else
          /usr/bin/nohup $SERVICE_COMAND -p $PORT -d $CONFIG_DIR -l $LOG_FILE &
          sleep 1
      fi
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
