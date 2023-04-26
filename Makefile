TORRSERVER_VERSION="MatriX.123"
PKG_VERSION="1.2.123"

.PHONY: torrserver-% clean

all: torrserver-amd64 torrserver-arm64 #torrserver-386 torrserver-arm7

torrserver-%:
	@./build-package.sh ${TORRSERVER_VERSION} $* ${PKG_VERSION}

clean:
	rm -rf torrserver apk
