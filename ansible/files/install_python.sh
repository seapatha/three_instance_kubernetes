#!/bin/bash -e

PYPY_VERSION=5.10.1

wget -O - https://bitbucket.org/pypy/pypy/downloads/pypy3-v$PYPY_VERSION-linux64.tar.bz2 |tar -xjf -
mv -n pypy3-v$PYPY_VERSION-linux64 pypy

## library fixup
mkdir -p pypy/lib
if [[ -f /lib64/libncurses.so.5.9 ]]; then
        libncurses_version=5.9
else
        libncurses_version=6
fi

ln -snf /lib64/libncurses.so.$libncurses_version $HOME/pypy/lib/libtinfo.so.5

mkdir -p $HOME/bin

cat > $HOME/bin/python <<EOF
#!/bin/bash
LD_LIBRARY_PATH=$HOME/pypy/lib:$LD_LIBRARY_PATH exec $HOME/pypy/bin/pypy3 "\$@"
EOF

chmod +x $HOME/bin/python
$HOME/bin/python --version
