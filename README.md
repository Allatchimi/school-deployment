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
  - Add CDN environment variables: `CDN_ENV_PROD`, `CDN_ENV_STAGING`, `CDN_ENV_DEV`.
  - Add admin environment variables: `ADMIN_ENV_PROD`, `ADMIN_ENV_STAGING`, `ADMIN_ENV_DEV`.
    Each value is stored as the `cdn-env-secret`, must configure the CDN on port
    `3100`, point `MINIO_ENDPOINT` to the external MinIO DNS name, and contain the
    CDN `API_KEY` and `CDN_KEY` values used by the frontend proxy.
- For the current OrbStack MinIO instance, use the S3 endpoint
    `MINIO_ENDPOINT=192.168.0.199:9000`. Port `60292` is the MinIO web console
    and must not be used by the CDN. Store `MINIO_ACCESS_KEY_ID` and
    `MINIO_ACCESS_KEY_SECRET` in `CDN_ENV_*`, not in this repository.
- The development CDN Deployment already pins this endpoint; update
    `kubernetes/deployments/dev/cdn.yml` if the host IP changes.
-     For OrbStack local Kubernetes, the dev deployment uses the CI/CD image
    `ghcr.io/allatchimi/cdn/cdn:latest`. The CDN repository workflow publishes
    this image to GHCR after a push to its `main` branch. Apply the deployment
    after the workflow succeeds:

    ```bash
    make k-apply-deploy-cdn-dev
    kubectl rollout status deployment/cdn -n school-dev
    ```

    The development deployment now uses the same GHCR CDN image as staging and production.
    The cluster must therefore have `ghcr-secret` in `school-dev`; the old local `cdn:dev`
    image is no longer referenced by Kubernetes.

    If the Docker build reports Alpine `DNS: transient error` or `no such
    package`, retry the build after checking Docker/OrbStack network access.
    The CDN Dockerfile uses tags available in the existing build and retries
    Alpine package installation automatically.
    If it fails at `go mod download` with `unexpected EOF`, the Dockerfile now
    retries Go module downloads five times. A persistent failure indicates an
    unstable Docker network or access problem to `proxy.golang.org`.
  - Ensure the API environment values use the in-cluster URLs:
    `SCHOOL_CDN_URL=http://cdn.<namespace>:3100/api/v1`.

## Selective development deployments

From this directory, after namespaces and required Secrets exist:

```bash
make k-deploy-cdn-dev
make k-deploy-api-dev
make k-deploy-admin-dev
make k-deploy-stack-dev
make cdn-restore FILE=cdn_backup_20260908_150522.tar.gz
make db-restore FILE=backup_local_20260908_143522.sql

```

`k-deploy-api-dev` also applies Redis and Postgres services/deployments. The complete target
applies volumes, CDN, API, admin, and the development ingress in dependency order.

## OrbStack local access

The `school-dev` ingress is HTTP-only for local OrbStack use. Let’s Encrypt cannot validate
private OrbStack addresses. Get the Traefik address and add it to `/etc/hosts`:

```bash
kubectl get svc traefik -n kube-system \
  -o jsonpath='{.status.loadBalancer.ingress[0].ip}{"\n"}'
sudo sh -c 'echo "<TRAEFIK_IP> dev.digitcore.cm dev.api.digitcore.cm dev.cdn.digitcore.cm" >> /etc/hosts'
kubectl apply -f kubernetes/ingress/dev.ingress.yml
```

Use `http://` locally:

```text
http://dev.digitcore.cm
http://dev.api.digitcore.cm/api/v1/healthz/live
http://dev.cdn.digitcore.cm
```
