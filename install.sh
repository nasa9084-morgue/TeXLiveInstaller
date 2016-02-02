#!/usr/bin/sh

function vecho() {
    if [ $verbose_flg -eq 0 ]
    then
        echo $1
    fi
}
verbose_flg=0
while getopts v OPT
do
    case $OPT in
        v) verbose_flg=1
    esac
done

if [ -e /etc/debian_version ] || [ -e /etc/debian_release ]
then
    vecho "TeXLive Installation for Debian Linux or Ubuntu."
    vecho "Install TeXLive..."
    apt -y install texlive
    vecho "TeXLive is installed."
    vecho "Install Japanese Language Pack..."
    apt -y install texlive-lang-cjk
    vecho "Japanese Language Pack is installed."
    vecho "Install xdvik for japanese..."
    apt -y install xdvik-ja
    vecho "xdvik is installed."
    vecho "Install dvipsk for japanese..."
    apt -y install dvipsk-ja
    vecho "dvipsk is installed."
    vecho "Install gv(Ghostscript)..."
    apt -y install gv
    vecho "gv is installed."
    vecho "Install Japanese Fonts pack..."
    apt -y install texlive-fonts-recommended texlive-fonts-extra
    vecho "japanese fonts pack is installed."
    vecho "Install Successfully!"
fi
if [ -e /etc/arch-release ]
then
    vecho "TeXLive Installation for Arch Linux."
    vecho "Install TeXLive and Applications..."
    pacman -Sy texlive-most
    vecho "TeXLive is installed."
    vecho "Install TeXLive japanese Langpack..."
    pacman -Sy texlive-langjapanese
    vecho "Japanese Langpack is installed."
    vecho "Install ghostscript..."
    pacman -Sy ghostscript
    vecho "ghostscript is installed."
    vecho "Install poppler-data for japanese pdf generated from TeX..."
    pacman -Sy poppler-data
    vecho "poppler-data is installed."
fi
