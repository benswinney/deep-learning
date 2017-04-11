#execute deployer
ACTIVATE_FILE=".activate"
PLAYBOOK_LOC="playbooks/master_playbook.yml"
SETUP_ENV_LOC="scripts/setup-env"
if [ ! -f $ACTIVATE_FILE ]; then
	echo "ERROR: CAN'T FIND ACTIVATE FILE.  DID YOU RUN install.sh FIRST?"
        exit
fi
if [ -z "$1" ]; then
	echo "ERROR: Please pass in config file"
        exit
fi
sudo echo "authenticate"
source ${ACTIVATE_FILE}
cp $1 ${GENESIS_FULL}/config.yml
cd ${GENESIS_FULL}

source ${SETUP_ENV_LOC}
cd playbooks
#export ANSIBLE_HOST_KEY_CHECKING=

ansible-playbook -i hosts lxc-create.yml -K && ansible-playbook -i hosts install.yml -K

#cd ../../
#ansible-playbook -i $DYNAMIC_INVENTORY playbooks/post_os_wait.yml
#cd ${GENESIS_FULL}/playbooks
echo "Wait 15 minutes"
sleep 15m
#Cluster Node Networking
ansible-playbook -i $DYNAMIC_INVENTORY ssh_keyscan.yml
ansible-playbook -i $DYNAMIC_INVENTORY gather_mac_addresses.yml
ansible-playbook -i $DYNAMIC_INVENTORY configure_operating_systems.yml

#exit cluster-genesis directory
cd ../../

ssh -i ~/.ssh/id_rsa_ansible-generated deployer@192.168.3.2 'sudo apt-get update && sudo apt-get install -y iptables'
ssh -i ~/.ssh/id_rsa_ansible-generated deployer@192.168.3.2 'sudo bash -s' < nat.sh

#call PowerAI playbook
ansible-playbook -i $DYNAMIC_INVENTORY $PLAYBOOK_LOC
#cp $1 playbooks/powerai-inventory.yml
#cd playbooks 
#ansible-playbook master_playbook.yml -i ../inventory.py
