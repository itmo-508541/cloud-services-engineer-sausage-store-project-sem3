# vault

Нужно зайти в задачу `apply` пайплайна и в конце найти IP-адреса VM.

## Настройка

Vault устанавливается через Ansible, после применения роли `vault`.

Например:

```
Outputs:
vm_dev_address = "158.160.228.2"
vm_dev_name = "vm-dev"
vm_prod_address = "158.160.129.37"
vm_prod_name = "vm-prod"
```

В консоли выполнить:

```sh
ssh runner@158.160.228.2
sudo docker logs vault 2>&1 | grep -E 'Unseal Key|Root Token' # записать Unseal ключ и Initial Root Token
sudo docker exec -it vault sh

vault operator unseal # вставить Unseal Key; dev-режим уже распечатан, команда покажет Sealed false
vault login
vault secrets list
vault secrets enable -path=kv kv-v2
```

Заполнить необходимые для работы приложения значения

```sh
vault kv put kv/sausage-store \
  spring.data.mongodb.host=mongodb \
  spring.data.mongodb.port=27017 \
  spring.data.mongodb.database=sausage-store \
  spring.data.mongodb.username=mngdbuser \
  spring.data.mongodb.password=mngdbpsw1 \
  mongodb.init.username=mngdbroot \
  mongodb.init.password=mngdbpsw2 \
  spring.datasource.url="jdbc:postgresql://postgresql:5432/store_default" \
  postgresql.init.database=store_default \
  spring.datasource.username=postgres \
  spring.datasource.password=postgres

vault kv get kv/sausage-store
vault kv get -mount=kv -field=spring.datasource.username sausage-store

vault policy write sausage-store-read - <<EOF
path "kv/data/sausage-store" {
  capabilities = ["read"]
}
EOF

vault token create -policy=sausage-store-read -ttl=768h
```

## Проверка

**Веб-интерфейс:**

- `ssh -N -L 8200:127.0.0.1:8200 runner@158.160.228.2`
- По адресу http://localhost:8200/ui/ будет UI
