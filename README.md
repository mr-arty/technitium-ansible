## Ansible Role to install Technitium DNS server

### Prerequisites: 
    * Ansible must be installed
    * community.general collection must be installed
    * `ansible-galaxy collection install community.general`

The root directory contains the `hosts` inventory file. There is an example `hosts` file in the repo. You need to edit it. You can change the `ansible_ssh_private_key_file` variable to set a different SSH key.

The `install-technitium.yml` file in the root directory contains the playbook to run this role. You need to edit it and specify the user for connections in case the user is not `root`.

The `ansible.cfg` file contains default variables.

The `roles/prepare/files` folder should contain the `authorized_keys` file which contains ssh keys to be copied to target host. You can edit it to add any SSH keys to be copied to the server. You must set `configure_ssh: "true"` in `roles/prepare/defaults/main.yml` in order for this to work. 

**Usage**: `ansible-playbook install-technitium.yml`