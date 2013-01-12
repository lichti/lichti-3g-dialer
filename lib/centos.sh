#!/bin/bash

chmod u+w /etc/sudoers

VER=$(cat /etc/sudoers | grep "%dialout  ALL=(root) NOPASSWD: /usr/bin/wvdial, /usr/bin/killall -s TERM wvdial")

if [ -z "$VER" ];then
    echo "%dialout  ALL=(root) NOPASSWD: /usr/bin/wvdial, /usr/bin/killall -s TERM wvdial" >> /etc/sudoers
fi

chmod u-w /etc/sudoers

gpasswd -a `cat /tmp/user.tmp` dialout

echo "Configuração completa. Pressione qualquer tecla"
