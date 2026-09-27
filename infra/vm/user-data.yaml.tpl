#cloud-config
users:
  - default
  - name: runner
    groups:
      - sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh_authorized_keys:
      - ${key0}
      - ${key1}

ssh_pwauth: false
disable_root: true
