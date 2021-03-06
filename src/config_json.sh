#!/bin/bash

APKG_VERSION=$1
ARCH=$2

case $ARCH in
amd64)
  PLATFORMS="x86-64"
  ;;
386)
  PLATFORMS="i386"
  ;;
arm64)
  PLATFORMS="arm64"
  ;;
arm7)
  PLATFORMS="armv7"
  ;;
*)
  echo "Unsupported architecture: ${ARCH}"
  exit 1
  ;;
esac

cat <<EOF
{
    "general":{
        "package":"torrserver",
        "name":"TorrServer",
        "version":"${APKG_VERSION}",
        "depends":[],
        "conflicts":[],
        "developer":"YouROK",
        "maintainer":"Vladlenas",
        "email":"voxel.firmware@gmail.com",
        "website":"https://github.com/vladlenas/Asustor-TorrServer",
        "architecture":"${PLATFORMS}",
        "firmware":"3.0.0"
     },
     "adm-desktop": {
        "app": {
            "type": "custom",
            "protocol": "http",
            "port": 8090,
            "url": "/"
        },
        "privilege": {
            "accessible": "administrators",
            "customizable": true
        }
    },
    "register": {
        "symbolic-link": {
            "/bin": [
                "torrserver"
            ]
      },
        "port": [
            "8090"
        ],
        "boot-priority": {
            "start-order": 90,
            "stop-order": 5
        }
    }   
}
EOF
