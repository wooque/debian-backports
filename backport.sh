#!/usr/bin/bash
set -e

release=${3:-"testing"}
package=$1
binaries=$2
if [ -z $binaries ]; then
  binaries=$package
fi

build_dir=/build/$package
mkdir -p $build_dir
cd $build_dir

apt source $package/$release
cd $(ls -d */ | head -n 1)

export DEBIAN_FRONTEND=noninteractive
yes | mk-build-deps --install --remove
EMAIL=backport@debian.org dch --bpo "bookworm backport"
dpkg-buildpackage -b -us -uc
find .. -regextype posix-egrep -regex "../${binaries}.*\.deb" | xargs apt install --no-install-recommends -y
mv $build_dir/*.deb /build/deb
