# Step 1: Create specific application data folder

1. Ceate persistent volumes directories data and set permissions

- Create persistent volumes directories data for redis

```
sudo mkdir -p /mnt/node/data/apps/emfi/school/redis/prod
sudo mkdir -p /mnt/node/data/apps/emfi/school/redis/staging
sudo mkdir -p /mnt/node/data/apps/emfi/school/redis/dev
```

- Create persistent volumes directories data for postgres

```
sudo mkdir -p /mnt/node/data/apps/emfi/school/postgres/prod
sudo mkdir -p /mnt/node/data/apps/emfi/school/postgres/staging
sudo mkdir -p /mnt/node/data/apps/emfi/school/postgres/dev
```

2. Set persistent volumes users and permissions

- Set permissions for redis user
  - prod: UID = 1001
  - staging: UID = 1002
  - dev: UID = 1003

```
sudo chown -R 1001:1001 /mnt/node/data/apps/emfi/school/redis/prod
sudo chmod -R 770 /mnt/node/data/apps/emfi/school/redis/prod
```

```
sudo chown -R 1002:1002 /mnt/node/data/apps/emfi/school/redis/staging
sudo chmod -R 770 /mnt/node/data/apps/emfi/school/redis/staging
```

```
sudo chown -R 1003:1003 /mnt/node/data/apps/emfi/school/redis/dev
sudo chmod -R 770 /mnt/node/data/apps/emfi/school/redis/dev
```

- Set permissions for postgres user

  - prod: UID = 1101
  - staging: UID = 1102
  - dev: UID = 1103

```
sudo chown -R 1001:1001 /mnt/node/data/apps/emfi/school/postgres/prod
sudo chmod -R 770 /mnt/node/data/apps/emfi/school/postgres/prod
```

```
sudo chown -R 1002:1002 /mnt/node/data/apps/emfi/school/postgres/staging
sudo chmod -R 770 /mnt/node/data/apps/emfi/school/postgres/staging
```

```
sudo chown -R 1003:1003 /mnt/node/data/apps/emfi/school/postgres/dev
sudo chmod -R 770 /mnt/node/data/apps/emfi/school/postgres/dev
```

# Step 2: Update GitHub Action Secrets for continuous integration

Go to this link: [GitHub Action Secrets](https://github.com/EMENEC-FINANCE/school-deployment/settings/secrets/actions)

- ------------- On your GitHub Action Secrets page -------------

  - Set Secret `SSH_KEY`. SSH_KEY is the private key without the passphrase used to login into the server. You can use this command to show the file content:

    ```
    cat ~/.ssh/id_ed25519
    ```

    or

    ```
    cat ~/.ssh/id_rsa
    ```

  - Set Secret `SSH_USER` on the server. The default value is `ci`

  - Set Secret `SSH_KEY_GITHUB`. SSH_KEY_GITHUB is the private key without the passphrase used to clone the template repository.

  - Set Secrets `GHCR_EMAIL` `GHCR_PASSWORD` `GHCR_USERNAME` with value your GitHub credentials. `GHCR_PASSWORD` is your GitHub personal access token with `read package` permission enabled

  - Set Secret `WORK_DIR_CI_PROD` with value `/mnt/node/data/ci/emfi/school/app/prod`

  - Set Secret `WORK_DIR_CI_STAGING` with value `/mnt/node/data/ci/emfi/school/app/staging`

  - Set Secret `WORK_DIR_CI_DEV` with value `/mnt/node/data/ci/emfi/school/app/dev`

  - For others secrets, update values
