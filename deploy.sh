#execute deployer
ACTIVATE_FILE=".activate"
PLAYBOOK_LOC="playbooks/nvidia_driver.yml"
SETUP_ENV_LOC="scripts/setup-env"
if [ ! -f $ACTIVATE_FILE ];
then
	echo "ERROR: CAN'T FIND ACTIVATE FILE.  DID YOU RUN install.sh FIRST?"
else
if [ -z "$1" ]; then
	echo "ERROR: Please pass in config file"
else
source ${ACTIVATE_FILE}
cp $1 playbooks/powerai-inventory.yml
cd playbooks 
#ansible-playbook -i $DYNAMIC_INVENTORY $PLAYBOOK_LOC -u root --private=~/.ssh/id_rsa_ansible-generated
ansible-playbook master_playbook.yml -i ../inventory.py -u root --private=~/.ssh/id_rsa_ansible-generated
 
fi
fi

