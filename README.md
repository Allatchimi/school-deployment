# Step 1: VPS security and best practices


1. Add new user account(GitHub for GitHub actions, and for your personal usage: prosper as example)
    ```
    adduser github
    adduser prosper
    usermod -aG sudo github
    usermod -aG sudo prosper
    ```

2. Add firewall rules: block all ports except 22(ssh), 80(http) and 443(https)
    ```
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow OpenSSH
    sudo ufw allow 80
    sudo ufw allow 443
    ```

    - Optional to show all rules
        ```
        sudo ufw show Added
        ```
    ```
    sudo ufw enable
    ```
    - Optional to show firewall status
        ```
        sudo ufw status
        ```

3. Disable ssh login with password

    - ------------- On your personal computer(the one who will be used to login to the server via ssh) -------------
      - Optional: to remove known host with same hostname
        ```
        ssh-keygen -R snip.cm
        ```
      ```
	  ssh-copy-id -i ~/.ssh/id_rsa.pub github@snip.cm
	  ssh-copy-id -i ~/.ssh/id_rsa.pub prosper@snip.cm
      ```
    
    ```
    sudo vim /etc/ssh/sshd_config
    ```
    - Change these values(on /etc/ssh/sshd_config file): `PubkeyAuthentication yes` `PasswordAuthentication no` `PermitRootLogin no` and save
    ```
    sudo systemctl restart ssh
    ```

4. Pointing a DNS record at a server(let's get a domain name)




# Step 2: Setup Packages, Kubernetes, SSH key for GitHub Action Secrets, HELM and Prometheus/grafana for monitoring


1. Update and install packages
    ```
    sudo apt update
    sudo apt upgrade
    sudo apt install curl wget git make tmux vim -y
    ```

2. Generate ssh keys(for every user including root)
    ```
    ssh-keygen -t rsa -b 4096
    ```

3. Install k3s
    ```
    curl -sfL https://get.k3s.io | sh -
    ```
    - Optional: start the service on boot
        ```
        sudo systemctl enable k3s
        ```

4. Create k3s group and add user to avoid using always sudo(for every user except root)
    ```
    sudo groupadd k3s
    sudo usermod -aG k3s github
    sudo usermod -aG k3s prosper
    sudo chown -R root:k3s /etc/rancher/k3s
    sudo chmod -R 644 /etc/rancher/k3s
    sudo chmod ug+x /etc/rancher/k3s
    ```
    ```
    echo K3S_KUBECONFIG_MODE=\"644\" >> /etc/systemd/system/k3s.service.env
    ```
    - Restart the server

5. Create persistent volume folders for kubernetes
    ```
    sudo mkdir -p /mnt/emfi/school/api/data
    sudo mkdir -p /mnt/emfi/school/admin/data
    sudo mkdir -p /mnt/emfi/school/redis/data
    sudo mkdir -p /mnt/emfi/school/postgres/data

    sudo chown -R root:k3s /mnt/emfi
    sudo chmod -R 775 /mnt/emfi
    ```


# Step 3: Update GitHub Action Secrets for continuous integration

Go to this link: [GitHub Action Secrets](https://github.com/EMENEC-FINANCE/school-deployment/settings/secrets/actions)

- ------------- On your GitHub Action Secrets page -------------
    - Ser Secret `SSH_HOST` with the value of your server domain name. E.g: `emfi.cm`
    - Set Secret `SSH_PRIVATE_KEY` with value from your personal computer `~/.ssh/id_rsa`. You'll need to remove the passphrase. You can use this command to show the file content: 
        ```
        cat ~/.ssh/id_rsa
        ```
    - Set Secret `SSH_USER` with value `github`
    - Set Secrets `PROD_API_TLS_CERT`, `PROD_API_TLS_KEY`, `STAGING_API_TLS_CERT`, `STAGING_API_TLS_KEY` with your certificates values for production(starts with PROD_) and staging(starts with STAGING_)
    - Set Secrets `PROD_ADMIN_TLS_CERT`, `PROD_ADMIN_TLS_KEY`, `STAGING_ADMIN_TLS_CERT`, `STAGING_ADMIN_TLS_KEY` with your certificates values for production(starts with PROD_) and staging(starts with STAGING_)
    - Set Secret `PROD_WORK_DIR` with value `~/emfi/school/deployment/api-admin/prod`
    - Set Secret `STAGING_WORK_DIR` with value `~/emfi/school/deployment/api-admin/staging`
    - Set Secrets `GHCR_EMAIL` `GHCR_PASSWORD` `GHCR_USERNAME` with value your GitHub credentials. `GHCR_PASSWORD` is your personal access token with `read package` permission enabled
    