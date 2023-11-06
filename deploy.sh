#!/bin/zsh
# Based on https://github.com/iesplin/ansible-playbook-kali/blob/master/deploy.sh

# Ensure .local/bin is in the PATH for ansible executables
PATH=$PATH:$HOME/.local/bin

# Get start time for runtime calculation
start=$SECONDS

# Check if Ansible is installed.  If not, install it.  
# May want to change installation method to "python3 -m pip install ansible"
if ! command -v ansible >/dev/null; then
    printf "[-] Installing Ansible\n"
    sudo apt-get update -y && sudo apt-get install -y ansible
    if [ $? -gt 0 ]; then
        printf "[!] Error occurred when attempting to install ansible package.\n"
        exit 1
    fi
fi

#printf "[-] Downloading required Ansible collections\n"
#ansible-galaxy collection install --upgrade -r requirements.yml
#if [ $? -gt 0 ]; then
#    printf "[!] Error occurred when attempting to install Ansible collections.\n"
#    exit 1
#fi

#printf "[-] Downloading required roles\n"
#ansible-galaxy role install --force -r requirements.yml
#if [ $? -gt 0 ]; then
#    printf "[!] Error occurred when attempting to download Ansible roles.\n"
#    exit 1    
#fi

printf "[-] Running customization playbooks\n"

ansible-playbook -i inventory --ask-become-pass -e "username=$USER" kali-setup.yml
if [ $? -gt 0 ]; then
    printf "[!] Error occurred during playbook run.\n"
    exit 1    
fi

# Calculate runtime
end=$SECONDS
runtime=$(( "$end - $start" ))
mins=$(( "$runtime / 60" ))
secs=$(( "$runtime % 60" ))
printf "[+] Deployment finished in $mins mins and $secs seconds.\n"
