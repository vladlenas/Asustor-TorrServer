#!/bin/bash

set -e

TORRSERVER_VERSION=$1
ARCH=$2
PKG_VERSION=$3

download_torrserver() {
  local base_url="https://github.com/YouROK/TorrServer/releases/download/${TORRSERVER_VERSION}"
  local bin_name="TorrServer-linux-${ARCH}"
  local src_bin="${base_url}/${bin_name}"
  local dest_bin="dest_bin"
  
  if [[ -f ${dest_bin}/TorrServer-linux-${ARCH} ]]; then
    echo ">>> Binaries already exist: ${bin_name}"
    return
  fi

  echo ">> Downloading ................."
  mkdir -p dest_bin
  wget --no-verbose -P ${dest_bin} ${src_bin}
}

make_apk() {
  local tmp_dir="build"
  local apk_dir="apk"
  local torrserver_bin="dest_bin/TorrServer-linux-${ARCH}"

  echo ">>> Making ...................."
  mkdir -p ${tmp_dir}
  mkdir -p ${tmp_dir}/bin
  cp -r src/CONTROL ${tmp_dir}
  cp -a ${torrserver_bin} ${tmp_dir}/bin/torrserver
  chmod +x ${tmp_dir}/bin/torrserver

  ./src/config_json.sh ${PKG_VERSION} ${ARCH} >"${tmp_dir}"/CONTROL/config.json

  mkdir -p ${apk_dir}
  ./apkg-tools_py3.py create ${tmp_dir}/
  mv torrserver_* ${apk_dir}
  rm -rf ${tmp_dir}
  echo ">>>> Done"
}

main() {
  echo "> Building TorrServer package ${TORRSERVER_VERSION} ${ARCH}"
  download_torrserver
  make_apk
}

main
