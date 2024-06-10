# Ansible-CheckPoint
Perform Check Point backups via Ansible. Utilises Keeper and Keeper Secrets Manager to store device credentials
Backups are offloaded to Backblaze

Required collections are in requirements/requirements.yml and can be installed with:
```
$ ansible-galaxy install -r requirements/requirements.yml
```

Keeper Secret Manager needs to be authenticated using an API auth token
```
$ sudo pip3 install keeper-secrets-manager-cli
$ keeper_ansible --token XX:XXXXXX
Config file create at location client-config.json
```

Ansible can use the client-config.json config file directly. It can be specified in the Ansible variables using the keeper_config_file variable key.
```
keeper_config_file: /path/to/client-config.json
```
