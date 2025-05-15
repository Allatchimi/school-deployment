.PHONY: k-create-namespaces k-set-namespace-staging k-set-namespace-prod
k-create-namespaces:
	@echo ""; \
	echo "----- Creating namespaces namespace -----"; \
	kubectl create -f ./kubernetes/namespaces.yml

.PHONY: k-apply-volume-staging k-apply-volume-prod k-delete-volumes
k-apply-volume-staging:
	@kubectl apply -f ./kubernetes/volumes/staging/redis.yml
	@kubectl apply -f ./kubernetes/volumes/staging/postgres.yml
k-apply-volume-prod:
	@kubectl apply -f ./kubernetes/volumes/prod/redis.yml
	@kubectl apply -f ./kubernetes/volumes/prod/postgres.yml

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

.PHONY: k-apply-deploy-admin-staging k-apply-deploy-admin-prod
k-apply-deploy-admin-staging:
	@kubectl apply -f ./kubernetes/deployments/staging/admin.yml
k-apply-deploy-admin-prod:
	@kubectl apply -f ./kubernetes/deployments/prod/admin.yml

.PHONY: k-apply-services
k-apply-services:
	@kubectl apply -f ./kubernetes/services/redis.yml
	@kubectl apply -f ./kubernetes/services/postgres.yml
	@kubectl apply -f ./kubernetes/services/api.yml
	@kubectl apply -f ./kubernetes/services/admin.yml

.PHONY: k-apply-ingress-staging k-apply-ingress-prod
k-apply-ingress-staging:
	@echo ""; \
	echo "----- Applying ingress -----"; \
	kubectl apply -f ./kubernetes/ingress/staging.ingress.yml
k-apply-ingress-prod:
	@echo ""; \
	echo "----- Applying ingress -----"; \
	kubectl apply -f ./kubernetes/ingress/prod.ingress.yml
