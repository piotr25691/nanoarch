#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="nanoarch"
iso_label="NARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Arch Linux <https://archlinux.org> and <https://github.com/piotr25691>"
iso_application="NanoArch"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"

# this is faster but not as optimized
# airootfs_image_type="squashfs"
# airootfs_image_tool_options=('-comp xz' '-Xbcj x86' '-b 1M' '-Xdict-size 1M')

# this is SLOW but saves approx. 5 MB
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlzma,109' '-C1048576' '-Eztailpacking,all-fragments,dedupe')

file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/rc.local"]="0:0:755"
)
