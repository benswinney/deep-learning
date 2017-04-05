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

source ${ACTIVATE_FILE}
cp $1 ${GENESIS_FULL}/config.yml
cd ${GENESIS_FULL}

sed -i /sources.list/s/^/#/ os_images/config/ubuntu-16.04.1-server-ppc64el.seed

source ${SETUP_ENV_LOC}
cd playbooks
#export ANSIBLE_HOST_KEY_CHECKING=

ansible-playbook -i hosts lxc-create.yml -K && ansible-playbook -i hosts install.yml -K

# wait 20m minutes for install to complete.
echo "Wait 20 minutes for install to complete"
sleep 20m

#Cluster Node Networking
ansible-playbook -i $DYNAMIC_INVENTORY ssh_keyscan.yml
ansible-playbook -i $DYNAMIC_INVENTORY gather_mac_addresses.yml
ansible-playbook -i $DYNAMIC_INVENTORY configure_operating_systems.yml

#call PowerAI playbook
ansible-playbook -i $DYNAMIC_INVENTORY $PLAYBOOK_LOC
#cp $1 playbooks/powerai-inventory.yml
#cd playbooks 
#ansible-playbook master_playbook.yml -i ../inventory.py
