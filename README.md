andrewrothstein.azure_pipelines_agent
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-azure_pipelines_agent.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-azure_pipelines_agent)

Installs the [Azure Pipelines Agent](https://github.com/microsoft/azure-pipelines-agent).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.azure_pipelines_agent
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
