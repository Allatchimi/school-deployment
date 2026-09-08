NAMESPACE ?= school-dev

# Chemins relatifs vers vos autres dépôts/dossiers d'applications
PATH_API   ?= ../school-api
PATH_FRONT ?= ../school-front
PATH_CDN   ?= ../cdn

.PHONY: k-create-namespaces
k-create-namespaces:
	@kubectl apply -f ./kubernetes/namespaces.yml

.PHONY: k-apply-letsencrypt
k-apply-letsencrypt:
	@if [ -d ./kubernetes/letsencrypt ]; then kubectl apply -f ./kubernetes/letsencrypt/; fi

# --- MIDDLEWARES (TRAEFIK) ---
.PHONY: k-apply-middlewares-dev
k-apply-middlewares-dev:
	@if [ -d ./kubernetes/middlewares ]; then kubectl apply -f ./kubernetes/middlewares/; fi

# --- VOLUMES ---
.PHONY: k-apply-volume-dev k-apply-volume-staging k-apply-volume-prod
k-apply-volume-dev:
	@kubectl apply -f ./kubernetes/volumes/dev/redis.yml
	@kubectl apply -f ./kubernetes/volumes/dev/postgres.yml

k-apply-volume-staging:
	@kubectl apply -f ./kubernetes/volumes/staging/redis.yml
	@kubectl apply -f ./kubernetes/volumes/staging/postgres.yml

k-apply-volume-prod:
	@kubectl apply -f ./kubernetes/volumes/prod/redis.yml
	@kubectl apply -f ./kubernetes/volumes/prod/postgres.yml

# --- SERVICES (COMMUNICATION INTERNE) ---
# --- SERVICES (COMMUNICATION INTERNE) ---
.PHONY: k-apply-services-dev
k-apply-services-dev:
	@if [ -d ./kubernetes/services ]; then \
		kubectl apply -f ./kubernetes/services/ -n $(NAMESPACE); \
	fi


# --- COMPOSANTS (DEPLOYMENTS) ---
.PHONY: k-apply-deploy-redis-dev k-apply-deploy-postgres-dev k-apply-deploy-cdn-dev k-apply-deploy-api-dev k-apply-deploy-admin-dev
k-apply-deploy-redis-dev:
	@kubectl apply -f ./kubernetes/deployments/dev/redis.yml
k-apply-deploy-postgres-dev:
	@kubectl apply -f ./kubernetes/deployments/dev/postgres.yml
k-apply-deploy-cdn-dev:
	@kubectl apply -f ./kubernetes/deployments/dev/cdn.yml
k-apply-deploy-api-dev:
	@kubectl apply -f ./kubernetes/deployments/dev/api.yml
k-apply-deploy-admin-dev:
	@kubectl apply -f ./kubernetes/deployments/dev/admin.yml

# --- INGRESS (ROUTAGE EXTERNE / TRAEFIK) ---
.PHONY: k-apply-ingress-dev
k-apply-ingress-dev:
	@if [ -d ./kubernetes/ingress ]; then kubectl apply -f ./kubernetes/ingress/; fi

# ==============================================================================
# COMMANDES DE GESTION MULTI-PROJETS (LOCAL, ENV, RESTART, STOP)
# ==============================================================================

# --- CHARGEMENT DYNAMIQUE DES ENVIRONNEMENTS ---
.PHONY: k-load-env
k-load-env:
	@echo "⚙️  Vérification et chargement des fichiers d'environnement..."
	@if [ -f postgres.env ]; then \
		kubectl create secret generic postgres-env-secret --from-file=postgres.env -n $(NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -; \
	fi
	@if [ -f redis.env ]; then \
		kubectl create secret generic redis-env-secret --from-file=redis.env -n $(NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -; \
	fi
	@if [ -f ../school-front/.env ]; then \
		kubectl create secret generic admin-env-secret --from-file=.env=../school-front/.env -n $(NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -; \
	elif [ -f ../school-front/app.env ]; then \
		kubectl create secret generic admin-env-secret --from-file=.env=../school-front/app.env -n $(NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -; \
	fi

	@FILE=""; \
	 if [ -f $(PATH_API)/.env ]; then FILE=$(PATH_API)/.env; \
	 elif [ -f $(PATH_API)/app.env ]; then FILE=$(PATH_API)/app.env; fi; \
	 if [ ! -z "$$FILE" ]; then \
	     kubectl create secret generic api-env-secret --from-file=.env=$$FILE -n $(NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -; \
	 fi

	@FILE=""; \
	 if [ -f $(PATH_FRONT)/.env ]; then FILE=$(PATH_FRONT)/.env; \
	 elif [ -f $(PATH_FRONT)/app.env ]; then FILE=$(PATH_FRONT)/app.env; fi; \
	 if [ ! -z "$$FILE" ]; then \
	     kubectl create secret generic school-front-env --from-file=.env=$$FILE -n $(NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -; \
	 fi

	@FILE=""; \
	 if [ -f $(PATH_CDN)/.env ]; then FILE=$(PATH_CDN)/.env; \
	 elif [ -f $(PATH_CDN)/app.env ]; then FILE=$(PATH_CDN)/app.env; fi; \
	 if [ ! -z "$$FILE" ]; then \
	     kubectl create secret generic cdn-env-secret --from-file=.env=$$FILE -n $(NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -; \
	 fi

# --- DÉPLOIEMENT LOCAL COMPLET ---
.PHONY: deploy-local
deploy-local:
	@echo "🏗️  1. Préparation des espaces de noms et configurations de base..."
	@$(MAKE) k-create-namespaces
	@$(MAKE) k-apply-letsencrypt
	@$(MAKE) k-apply-middlewares-dev
	@$(MAKE) k-load-env
	
	@echo "📁 2. Configuration du stockage physique local (OrbStack)..."
	@kubectl debug node/orbstack -it --image=postgres:17-alpine --image-pull-policy=IfNotPresent -- \
	  chroot /host sh -c 'mkdir -p /mnt/node/data/apps/school/postgres/dev /mnt/node/data/apps/school/redis/dev'
	@kubectl debug node/orbstack -it --image=postgres:17-alpine --image-pull-policy=IfNotPresent -- \
	  chroot /host sh -c 'chown -R 2203:2203 /mnt/node/data/apps/school/postgres/dev && chown -R 2103:2103 /mnt/node/data/apps/school/redis/dev'

	@echo "📦 3. Montage des volumes Kubernetes..."
	@$(MAKE) k-apply-volume-dev
	@sleep 2
	
	@echo "🚀 4. Lancement des applications et bases de données..."
	@$(MAKE) k-apply-deploy-redis-dev
	@$(MAKE) k-apply-deploy-postgres-dev
	@$(MAKE) k-apply-deploy-cdn-dev 
	@$(MAKE) k-apply-deploy-api-dev
	@$(MAKE) k-apply-deploy-admin-dev

	@echo "🔌 5. Application des Services internes et du routage Ingress (Traefik)..."
	@$(MAKE) k-apply-services-dev
	@$(MAKE) k-apply-ingress-dev
	@echo "🎯 Déploiement local terminé avec succès !"

# --- ARRÊTER (STOP SERVICES) ---
.PHONY: k-stop-dev
k-stop-dev:
	@echo "🛑 Arrêt ordonné des services et du routage..."
	@if [ -d ./kubernetes/ingress ]; then kubectl delete -f ./kubernetes/ingress/ --ignore-not-found=true; fi
	@if [ -d ./kubernetes/services ]; then kubectl delete -f ./kubernetes/services/ --ignore-not-found=true; fi
	@kubectl delete -f ./kubernetes/deployments/dev/admin.yml --ignore-not-found=true
	@kubectl delete -f ./kubernetes/deployments/dev/api.yml --ignore-not-found=true
	@kubectl delete -f ./kubernetes/deployments/dev/cdn.yml --ignore-not-found=true
	@kubectl delete -f ./kubernetes/deployments/dev/postgres.yml --ignore-not-found=true
	@kubectl delete -f ./kubernetes/deployments/dev/redis.yml --ignore-not-found=true
	@if [ -d ./kubernetes/middlewares ]; then kubectl delete -f ./kubernetes/middlewares/ --ignore-not-found=true; fi

# --- NETTOYAGE COMPLET ---
.PHONY: k-clean-dev
k-clean-dev: k-stop-dev
	@echo "🧹 Suppression des volumes et suppression définitive des secrets..."
	@kubectl delete -f ./kubernetes/volumes/dev/redis.yml --ignore-not-found=true
	@kubectl delete -f ./kubernetes/volumes/dev/postgres.yml --ignore-not-found=true
	@kubectl delete secret postgres-env-secret redis-env-secret admin-env-secret api-env-secret school-front-env cdn-env-secret -n $(NAMESPACE) --ignore-not-found=true


# ==============================================================================
# SAUVEGARDE ET RESTAURATION DE LA BASE DE DONNÉES (POSTGRES)
# ==============================================================================

# --- SAUVEGARDE (BACKUP) ---
# Génère un fichier .sql daté à la racine de votre projet
.PHONY: db-backup
db-backup:
	@echo "💾 Création d'une sauvegarde de la base de données PostgreSQL..."
	@POD_NAME=$$(kubectl get pods -n $(NAMESPACE) -l app=postgres -o jsonpath="{.items[0].metadata.name}" 2>/dev/null); \
	if [ -z "$$POD_NAME" ]; then \
		echo "❌ Erreur : Aucun Pod PostgreSQL trouvé dans le namespace $(NAMESPACE)."; \
		exit 1; \
	fi; \
	echo "📦 Extraction depuis le pod $$POD_NAME..."; \
	kubectl exec -i $$POD_NAME -n $(NAMESPACE) -- pg_dumpall -U postgres > backup_local_$$(date +%Y%m%d_%H%M%S).sql
	@echo "✅ Sauvegarde terminée. Fichier SQL créé avec succès !"

# --- RESTAURATION (RESTORE) ---
# Utilisation obligatoire : make db-restore FILE=nom_du_fichier.sql
.PHONY: db-restore
db-restore:
	@if [ -z "$(FILE)" ]; then \
		echo "❌ Erreur : Vous devez spécifier un fichier. Exemple : make db-restore FILE=backup_local_20260908_143000.sql"; \
		exit 1; \
	fi
	@if [ ! -f $(FILE) ]; then \
		echo "❌ Erreur : Le fichier '$(FILE)' est introuvable à la racine."; \
		exit 1; \
	fi
	@POD_NAME=$$(kubectl get pods -n $(NAMESPACE) -l app=postgres -o jsonpath="{.items[0].metadata.name}" 2>/dev/null); \
	if [ -z "$$POD_NAME" ]; then \
		echo "❌ Erreur : Le conteneur PostgreSQL doit être démarré (Running) pour restaurer."; \
		exit 1; \
	fi; \
	echo "🔄 Restauration en cours dans le pod $$POD_NAME depuis $(FILE)..."; \
	kubectl exec -i $$POD_NAME -n $(NAMESPACE) -- psql -U postgres < $(FILE)
	@echo "✅ Restauration terminée avec succès !"


# ==============================================================================
# SAUVEGARDE ET RESTAURATION DU CDN (MINIO)
# ==============================================================================

# Chemin interne des données dans le conteneur MinIO (Ajustez '/data' si nécessaire)
MINIO_DATA_PATH ?= /data

# --- SAUVEGARDE CDN ---
.PHONY: cdn-backup
cdn-backup:
	@echo "📦 Création d'une sauvegarde des fichiers du CDN (MinIO)..."
	@POD_NAME=$$(kubectl get pods -n $(NAMESPACE) -l app=cdn -o jsonpath="{.items[0].metadata.name}" 2>/dev/null); \
	if [ -z "$$POD_NAME" ]; then \
		echo "❌ Erreur : Aucun Pod CDN trouvé dans le namespace $(NAMESPACE)."; \
		exit 1; \
	fi; \
	echo "📦 Compression des fichiers depuis le pod $$POD_NAME..."; \
	BACKUP_NAME=cdn_backup_$$(date +%Y%m%d_%H%M%S).tar.gz; \
	kubectl exec $$POD_NAME -n $(NAMESPACE) -- tar -czf - $(MINIO_DATA_PATH) > $$BACKUP_NAME 2>/dev/null; \
	echo "✅ Sauvegarde terminée. Archive '$$BACKUP_NAME' créée avec succès !"

# --- RESTAURATION CDN ---
# Utilisation : make cdn-restore FILE=cdn_backup_XXXXXXXX_XXXXXX.tar.gz
.PHONY: cdn-restore
cdn-restore:
	@if [ -z "$(FILE)" ]; then \
		echo "❌ Erreur : Spécifiez un fichier. Exemple : make cdn-restore FILE=cdn_backup_20260908_150000.tar.gz"; \
		exit 1; \
	fi
	@if [ ! -f $(FILE) ]; then \
		echo "❌ Erreur : Le fichier '$(FILE)' est introuvable."; \
		exit 1; \
	fi
	@POD_NAME=$$(kubectl get pods -n $(NAMESPACE) -l app=cdn -o jsonpath="{.items[0].metadata.name}" 2>/dev/null); \
	if [ -z "$$POD_NAME" ]; then \
		echo "❌ Erreur : Le conteneur CDN doit être Running pour restaurer."; \
		exit 1; \
	fi; \
	echo "🔄 Restauration des fichiers dans le pod $$POD_NAME..."; \
	kubectl exec -i $$POD_NAME -n $(NAMESPACE) -- tar -xzf - -C / < $(FILE); \
	echo "✅ Restauration du CDN terminée avec succès !"


# ==============================================================================
# SAUVEGARDE GLOBALE (POSTGRES + CDN)
# ==============================================================================

# --- SAUVEGARDER TOUT ---
# Lance la sauvegarde de la base de données ET du CDN en même temps
.PHONY: backup-all
backup-all:
	@echo "🚨 Début de la sauvegarde complète du projet (Dev)..."
	@$(MAKE) db-backup
	@$(MAKE) cdn-backup
	@echo "✨ Tout a été sauvegardé avec succès ! Vos fichiers .sql et .tar.gz sont prêts."
