.PHONY: k-create-namespaces k-set-namespace-staging k-set-namespace-prod
k-create-namespaces:
	@echo ""; \
	echo "----- Creating namespaces namespace -----"; \
	kubectl create -f ./kubernetes/namespaces.yml
k-set-namespace-staging:
	@echo ""; \
	echo "----- Setting up staging namespace -----"; \
	kubectl config set-context --current --namespace=snip-staging
k-set-namespace-prod:
	@echo ""; \
	echo "----- Setting up prod namespace -----"; \
	kubectl config set-context --current --namespace=snip-prod

.PHONY: k-apply-ghcr-secret
k-apply-ghcr-secret:
	@echo ""; \
	echo "----- Deleting existing secrets -----"; \
	kubectl delete secret ghcr-secret; \
	kubectl delete secret app-secret; \
	echo ""; \
	echo "----- Login - GitHub Docker Registery -----"; \
	read -p "Enter your Github username(default is emenec-finance): " gUsername; \
	read -p "Enter your Github personal access token: " gPass; \
	read -p "Enter your email(default is emfi.tech@gmail.com): " gEmail; \
	kubectl create secret docker-registry ghcr-secret --docker-server=https://ghcr.io --docker-username=$${gUsername:-"emenec-finance"} --docker-password=$$gPass --docker-email=$${gEmail:-"emfi.tech@gmail.com"}

.PHONY: k-apply-volume-staging k-apply-volume-prod k-delete-volumes
k-apply-volume-staging:
	@kubectl apply -f ./kubernetes/volumes/staging/redis.yml
	@kubectl apply -f ./kubernetes/volumes/staging/postgres.yml
k-apply-volume-prod:
	@kubectl apply -f ./kubernetes/volumes/prod/redis.yml
	@kubectl apply -f ./kubernetes/volumes/prod/postgres.yml
k-delete-volumes:
	@kubectl delete pvc --all; \
	kubectl delete pv --all

.PHONY: k-apply-deploy-redis-staging k-apply-deploy-redis-prod
k-apply-deploy-redis-staging:
	@kubectl apply -f ./kubernetes/deployments/staging/redis.yml
k-apply-deploy-redis-prod:
	@kubectl apply -f ./kubernetes/deployments/prod/redis.yml

.PHONY: k-apply-deploy-postgres-staging k-apply-deploy-postgres-prod
k-apply-deploy-postgres-staging:
	@kubectl apply -f ./kubernetes/deployments/staging/postgres.yml
k-apply-deploy-postgres-prod:
	@kubectl apply -f ./kubernetes/deployments/prod/postgres.yml

.PHONY: k-apply-deploy-api-staging k-apply-deploy-api-prod
k-apply-deploy-api-staging:
	@kubectl apply -f ./kubernetes/deployments/staging/api.yml
k-apply-deploy-api-prod:
	@kubectl apply -f ./kubernetes/deployments/prod/api.yml

.PHONY: k-apply-deploy-client-staging k-apply-deploy-client-prod
k-apply-deploy-client-staging:
	@kubectl apply -f ./kubernetes/deployments/staging/client.yml
k-apply-deploy-client-prod:
	@kubectl apply -f ./kubernetes/deployments/prod/client.yml

.PHONY: k-apply-deploy-admin-staging k-apply-deploy-admin-prod
k-apply-deploy-admin-staging:
	@kubectl apply -f ./kubernetes/deployments/staging/admin.yml
k-apply-deploy-admin-prod:
	@kubectl apply -f ./kubernetes/deployments/prod/admin.yml

.PHONY: k-delete-deploy
k-delete-deploy:
	@kubectl delete deployment --all

.PHONY: k-apply-services k-delete-services
k-apply-services:
	@kubectl apply -f ./kubernetes/services/redis.yml
	@kubectl apply -f ./kubernetes/services/postgres.yml
	@kubectl apply -f ./kubernetes/services/api.yml
	@kubectl apply -f ./kubernetes/services/admin.yml
k-delete-services:
	@kubectl delete service --all

.PHONY: k-apply-ingress-staging k-apply-ingress-prod
k-apply-ingress-staging:
	@echo ""; \
	echo "----- Applying ingress -----"; \
	kubectl apply -f ./kubernetes/ingress/staging.ingress.yml
k-apply-ingress-prod:
	@echo ""; \
	echo "----- Applying ingress -----"; \
	kubectl apply -f ./kubernetes/ingress/prod.ingress.yml

.PHONY: k-logs-redis k-logs-postgres k-logs-api k-logs-admin
k-logs-redis:
	@kubectl logs -f -l app=redis
k-logs-postgres:
	@kubectl logs -f -l app=postgres
k-logs-api:
	@kubectl logs -f -l app=api
k-logs-admin:
	@kubectl logs -f -l app=admin


# -------------------- Minikube only used for local development --------------------

# Start minikube cluster
.PHONY: mini-start mini-setup-staging mini-setup-prod
mini-start:
	@minikube start --cpus 2 --memory 2048
	@minikube addons enable ingress

# Setup environment
mini-setup-staging:
	@make k-create-namespaces; \
	make k-set-namespace-staging; \
	make k-apply-ghcr-secret; \
	make k-apply-app-secret-staging; \
	make k-apply-volume-staging; \
	make k-apply-services; \
	make k-apply-ingress-staging
mini-setup-prod:
	@make k-create-namespaces; \
	make k-set-namespace-prod; \
	make k-apply-ghcr-secret; \
	make k-apply-app-secret-prod; \
	make k-apply-volume-prod; \
	make k-apply-services; \
	make k-apply-ingress-prod

# Expose vault
.PHONY: mini-expose-vault-staging mini-expose-vault-prod
mini-expose-vault-staging:
	@minikube service vault --url --namespace=vault-prod
mini-expose-vault-prod:
	@minikube service vault --url --namespace=vault-prod