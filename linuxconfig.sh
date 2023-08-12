! /usr/bin/bash

cat <<'EOF' > /etc/apt/sources.list
deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware

deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

# deb http://mirrors.cernet.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
# # deb-src https://mirrors.cernet.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
# deb-src https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
EOF

apt update
apt install --reinstall apt-transport-https ca-certificates -y

cat <<'EOF' > /etc/apt/sources.list
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

# deb https://mirrors.cernet.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
# # deb-src https://mirrors.cernet.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware

deb https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
# deb-src https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
EOF

apt update
apt install build-essential sudo vim cmake git locales -y

# vim /etc/locale-gen && locale-gen

passwd << EOF
zcc
zcc
EOF
useradd zcaic -m -G sudo -s /bin/bash
passwd zcaic << EOF
zcc
zcc
EOF

su zcaic
cd ~
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
cp ~/.bashrc ~/.bashrc.orig
cp ~/.oh-my-bash/templates/bashrc.osh-template ~/.bashrc

sudo git clone https://github.com/pyenv/pyenv.git /opt/pyenv

cat << EOF >> /etc/bash.bashrc
# -----------------pyenv--------------------
export PYENV_ROOT=/opt/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=1
export PYTHON_BUILD_MIRROR_URL="https://registry.npmmirror.com/-/binary/python/"
# ------------------------------------------
EOF

sudo apt install libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev wget


