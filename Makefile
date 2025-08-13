TORRSERVER_VERSION="MatriX.136"
PKG_VERSION="1.2.136"

.PHONY: torrserver-% clean

all: torrserver-amd64 torrserver-arm64 #torrserver-386 torrserver-arm7

torrserver-%:
	@./build-package.sh ${TORRSERVER_VERSION} $* ${PKG_VERSION}

clean:
	rm -rf torrserver apk
