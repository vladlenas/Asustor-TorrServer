#!/bin/sh


PKG_PATH=$APKG_PKG_DIR/bin
PID_FILE=/var/run/torrserver.pid
DAEMON=$APKG_PKG_DIR/bin/torrserver

service_start() {
  start-stop-daemon --start --quiet --background --make-pidfile --pidfile $PID_FILE --exec $DAEMON -d $PKG_PATH/
}

service_stop() {
  start-stop-daemon --stop --pidfile $PID_FILE --exec $DAEMON
  RETVAL=$?
  [ $RETVAL -eq 0 ] && [ -e "$PID_FILE" ] && rm -f $PID_FILE
}

service_status() {
  start-stop-daemon --status -q -p $PID_FILE
  if [ -e $PID_FILE ]; then
     echo TorrServer running
  else
     echo TorrServer stopped
  fi
}

service_restart() {
  service_stop
  service_start
}

case $1 in
  start)
    service_start
    ;;
  stop)
    service_stop
    ;;
  status|enabled)
    service_status
    ;;
  restart)
    service_restart
    ;;
  *)
    echo "Usage: $0 {start|stop|status|restart}"
    exit 1
    ;;
esac

exit 0
