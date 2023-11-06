# Unix Ops-machine tools

Check out this script for example of how to make this work all at once:

* https://github.com/jolick/Hacking-Tools-Installer/blob/main/offensive-tools.sh

Also, check out Ippsec's video series and GitHub for how to automate all of this with Ansible!

* https://www.youtube.com/playlist?list=PLidcsTyj9JXJVIFqyHBHzrRYKPpZYFjM8
* https://github.com/ippsec/parrot-build

To just set up and run Ippsec's ansible playbook, download Parrot HTB edition (https://parrotsec.org/download/)), then:

```
python3 -m pip install ansible
git clone https://github.com/ippsec/parrot-build
cd parrot-build
ansible-galaxy install -r requirements.yml
sudo whoami # to get root auth token
ansible-playbook main.yml

```

## Other Ansible Setup examples

Take the best of these and make your own!

* https://iptracej.github.io/posts/my-kali-ansible-automation/
* https://github.com/dennis6400/kali-setup
* https://github.com/iesplin/ansible-playbook-kali
* https://github.com/Aegrah/kali_ansible_setup
* https://github.com/hackedbyagirl/offensive-kali-ansible
* https://github.com/cisagov/ansible-role-kali

## Git Clone From Github and build:

### Proxychains

https://github.com/rofl0r/proxychains-ng

```bash
git clone https://github.com/rofl0r/proxychains-ng.git
cd proxychains-ng
# needs a working C compiler, preferably gcc
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
sudo make install-config (installs proxychains.conf)
```

### enum4linux-ng

https://github.com/cddmp/enum4linux-ng

The tool uses the samba clients tools, namely:

* nmblookup
* net
* rpcclient
* smbclient

```bash
sudo apt install smbclient
python3 -m pip install pyyaml ldap3 impacket
git clone https://github.com/cddmp/enum4linux-ng.git
```

### Smbmap

https://github.com/ShawnDEvans/smbmap

```bash
#install before seclists! (will downgrade)
git clone https://github.com/ShawnDEvans/smbmap.git
sudo apt install samba-common
python3 -m pip install -r requirements.txt
```

### JtR

https://github.com/openwall/john/tree/bleeding-jumbo/doc

```bash
# Instructions for Ubuntu
cd ~/git
sudo apt install yasm pkg-config libgmp-dev libpcap-dev libbz2-dev libssl-dev
git clone https://github.com/openwall/john -b bleeding-jumbo john
cd john/src
./configure && make -s clean && make -sj4
sudo make install
# test
./john --test=0
```

### vim

https://www.vim.org/git.php

```bash
cd ~/git
git clone https://github.com/vim/vim.git
cd vim/src
sudo apt install libncurses-dev
make
sudo make install
```

### tmux

https://github.com/tmux/tmux

https://github.com/tmux-plugins/tpm

```bash
cd ~/git
sudo apt install libevent-dev ncurses-dev build-essential bison pkg-config autoconf automake
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo make install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# copy .tmux.conf to ~/
tmux
# [ctrl+b I] to load plugins
```

## pip

Update pip `python3 -m pip install --upgrade pip`

* bs4
* colorama
* impacket
* cryptography
* PyYAML
* ldap3
* setuptools
* setuptools_rust
* pwntools

## rust

```
curl https://sh.rustup.rs -sSf | sh
```

## Pull releases with wget

* https://github.com/carlospolop/PEASS-ng/releases
* https://github.com/hashcat/hashcat/releases
* https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
* https://github.com/Porchetta-Industries/CrackMapExec
* https://github.com/OJ/gobuster/releases
* https://github.com/DominicBreuker/pspy
* https://github.com/danielmiessler/SecLists

```bash
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O ~/wordlists/SecList.zip \
  && unzip ~/wordlists/SecList.zip \
  && rm -f ~/wordlists/SecList.zip
```

## apt

```bash
sudo apt install exiftool bless hydra hashcat socat sqlmap smbclient zsh zsh-autosuggestions zsh-syntax-highlighting gcc-multilib dnsmap chntpw ffuf wfuzz binwalk swaks smbmap rlwrap sshuttle xsltproc tshark whois fping
```

### Parrot Security Repo

The APT package manager uses `/etc/apt/sources.list` and any *.list* file found in the `/etc/apt/sources.list.d/` directory.

```bash
deb https://deb.parrot.sh/parrot/ parrot main contrib non-free
#deb-src https://deb.parrot.sh/parrot/ parrot main contrib non-free
deb https://deb.parrot.sh/parrot/ parrot-security main contrib non-free
#deb-src https://deb.parrot.sh/parrot/ parrot-security main contrib non-free
deb https://deb.parrot.sh/parrot parrot-backports main contrib non-free
#deb-src https://deb.parrot.sh/parrot parrot-backports main contrib non-free
```

Parrot default APT configuration is located at **/etc/apt/sources.list.d/parrot.list**

https://www.parrotsec.org/docs/mirrors/mirrors-list/

```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key
```

#### Downgrade install priority

This must be done. If you upgrade without doing this, your system will break.

An example of the file `/etc/apt/preferences.d/parrot-pinning` will be:
Where Parrot has a pin-priority lower than Debian and Ubuntu.

```shell
Package: *
Pin: release o=Parrot
Pin-Priority: 500

Package: *
Pin: release o=Debian
Pin-Priority: 700

Package: *
Pin: release o=Kali
Pin-Priority: 50

Package: *
Pin: release o=Ubuntu
Pin-Priority: 1001
```

#### Tools

Full list available: https://github.com/ParrotSec/parrot-tools/blob/master/debian/control

## snap

* code
* powershell
* impacket
  * add /snap/impacket/current/bin to $PATH to use tools

## To install

ghidra

chisel (windows & linux) - https://github.com/jpillora/chisel

nc (static)
nmap (static) - https://github.com/opsec-infosec/nmap-static-binaries
ncat (from nmap) - https://secwiki.org/w/Nmap/Ncat_Portable
plink.exe (from putty)

https://download.sysinternals.com/files/SysinternalsSuite.zip

https://github.com/ropnop/impacket_static_binaries

https://github.com/andrew-d/static-binaries

https://github.com/calebstewart/pwncat

https://github.com/gentilkiwi/mimikatz

https://github.com/ropnop/windapsearch

https://github.com/ropnop/kerbrute

https://github.com/g0tmi1k/msfpc
burp suite
bloodhound
neo4j
sharphound
