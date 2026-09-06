# Step 1: Create specific application data folder

1. Ceate persistent volumes directories data and set permissions

- Create persistent volumes directories data for redis

```
sudo mkdir -p /mnt/node/data/apps/school/redis/prod
sudo mkdir -p /mnt/node/data/apps/school/redis/staging
sudo mkdir -p /mnt/node/data/apps/school/redis/dev
```

- Create persistent volumes directories data for postgres

```
sudo mkdir -p /mnt/node/data/apps/school/postgres/prod
sudo mkdir -p /mnt/node/data/apps/school/postgres/staging
sudo mkdir -p /mnt/node/data/apps/school/postgres/dev
```

2. Set persistent volumes users and permissions

- Set permissions for redis user
  - prod: UID = 2101
  - staging: UID = 2102
  - dev: UID = 2103

```
sudo chown -R 2101:2101 /mnt/node/data/apps/school/redis/prod
sudo chmod -R 770 /mnt/node/data/apps/school/redis/prod
```

```
sudo chown -R 2102:2102 /mnt/node/data/apps/school/redis/staging
sudo chmod -R 770 /mnt/node/data/apps/school/redis/staging
```

```
sudo chown -R 2103:2103 /mnt/node/data/apps/school/redis/dev
sudo chmod -R 770 /mnt/node/data/apps/school/redis/dev
```

- Set permissions for postgres user

  - prod: UID = 2201
  - staging: UID = 2202
  - dev: UID = 2203

```
sudo chown -R 2201:2201 /mnt/node/data/apps/school/postgres/prod
sudo chmod -R 770 /mnt/node/data/apps/school/postgres/prod
```

```
sudo chown -R 2202:2202 /mnt/node/data/apps/school/postgres/staging
sudo chmod -R 770 /mnt/node/data/apps/school/postgres/staging
```

```
sudo chown -R 2203:2203 /mnt/node/data/apps/school/postgres/dev
sudo chmod -R 770 /mnt/node/data/apps/school/postgres/dev
```

# Step 2: Update GitHub Action Secrets for continuous integration

Go to this link: [GitHub Action Secrets](https://github.com/Allatchimi/school-deployment/settings/secrets/actions)

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

  - Set Secrets `GHCR_EMAIL` `GHCR_PASSWORD` `GHCR_USERNAME` with value your GitHub credentials. `GHCR_PASSWORD` is your GitHub personal access token with `read package` permission enabled

  - Set Secret `WORK_DIR_CI_PROD` with value `~/ci/school/app/prod`

  - Set Secret `WORK_DIR_CI_STAGING` with value `~/ci/school/app/staging`

  - Set Secret `WORK_DIR_CI_DEV` with value `~/ci/school/app/dev`

  - Add redis environment variables: `REDIS_ENV_PROD`, `REDIS_ENV_STAGING`, `REDIS_ENV_DEV`

  - Add postgres environment variables: `POSTGRES_ENV_PROD`, `POSTGRES_ENV_STAGING`, `POSTGRES_ENV_DEV`

  - Add api environment variables: `API_ENV_PROD`, `API_ENV_STAGING`, `API_ENV_DEV`
