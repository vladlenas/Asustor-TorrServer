# TorrServer packages for Asustor NAS
Asustor NAS packages based on precompiled TorrServer binaries https://github.com/YouROK/TorrServer/releases

# Sopported Architecture
* arm7
* arm64
* amd64
* 386

# Making packages
```
git clone https://github.com/vladlenas/Asustor-TorrServer.git
cd ASUSTOR-TorrServer/
make
```
TorrServer version change
```
nano Makefile
TORRSERVER_VERSION="MatriX.84"
PKG_VERSION="1.2.84"
```
clear working directory
```
make clean
```
# Credits and References
* YouRock https://github.com/YouROK
* Asustor Developer page http://developer.asustor.com/
