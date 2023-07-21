set -e
set -u
set -x

docker build -t builder .
mkdir dist
docker run --rm -e CPPFLAGS='-Wno-error=deprecated-declarations -Wno-error=unused-result -Wno-error=register' -v $PWD/dist:/opt -v $PWD/ice:/build builder /bin/bash -c "cd /build/cpp ; make install"
