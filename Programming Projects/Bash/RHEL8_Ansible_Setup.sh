## Setting up an ansible server with localhost added to hosts file
## Also set up for use with Windows Server configuration
## You can run this script from root and it'll set you up automatically w/o restart
## This is for Red Hat Linux 8

SSHD_CONFIG="/etc/ssh/sshd_config"
KEY_PATH="/home/ansible/.ssh/id_rsa"
PUBLIC_KEY="/home/ansible/.ssh/id_rsa.pub"
AUTHORIZED_KEYS="/home/ansible/.ssh/authorized_keys"
PASSWORD=("Add your own password")
IP_Address=$(ip addr | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1)

## Error checking for finding IP Address and ensuring you are root when running script

if [[ -z "$IP_Address" ]]
    then
    echo "Error: Could not determine IP address."
    exit 1
fi

if [[ ${UID} -ne 0 ]]
    then
    echo "Please sudo this script in order for it to work properly."
    exit 1
fi

## Installing full ansible software, setting up ansible user account, and configuring host file with both localhost and Windows Server variable

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
yum install ansible -y
python3 -m ensurepip --upgrade
python3 -m pip install pywinrm
echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
useradd -c "Ansible Admin" -m ansible
echo ${PASSWORD} | passwd --stdin ansible &> /dev/null
usermod -aG wheel ansible
mkdir -p /etc/ansible/playbook
echo -e "[linux]\n$IP_Address   ansible_connection=local\n\n[windows]\n("IP Address for Windows Server")\n\n[windows:vars]\nansible_user=Administrator\nansible_password=("Place your login password")\nansible_connection=winrm\nansible_port=5986\nansible_winrm_transport=ntlm\nansible_winrm_server_cert_validation=ignore" >> /etc/ansible/hosts

## Configuring SSHD_Config file for security hardening

if grep -q "^PasswordAuthentication yes" "$SSHD_CONFIG"
then 
    sed -i "s/^PasswordAuthentication yes/PasswordAuthentication no/" "$SSHD_CONFIG"
fi

if grep -q "^PermitRootLogin yes" "$SSHD_CONFIG"
then 
    sed -i "s/^PermitRootLogin yes/PermitRootLogin no/" "$SSHD_CONFIG"
fi

systemctl reload sshd

## Creating private and public ssh keys
## Default is RSA, but can be changed for higher encryption
## Export private key to chosen directory
## Install ansible.windows collection as ansible user

mkdir -p /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
ssh-keygen -t rsa -b 3072 -f "$KEY_PATH" -N ""
cp $PUBLIC_KEY $AUTHORIZED_KEYS
chmod 600 $AUTHORIZED_KEYS
chown -R ansible:ansible /home/ansible/.ssh
cp $KEY_PATH ("choose or mount a share drive environment for a copy of the private ssh key")
su - ansible -c "ansible-galaxy collection install ansible.windows"