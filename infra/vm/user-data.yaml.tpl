#cloud-config
users:
  - default
  - name: runner
    type: RANDOM
    groups:
      - sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - ${key0}

ssh_pwauth: false
disable_root: true
