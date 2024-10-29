.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo "Available targets:"
	@echo "  ocis \t\t\t Starts oCIS"
	@echo "  ocis-down \t\t Stops oCIS"
	@echo "  traefik \t\t Starts oCIS with traefik"
	@echo "  traefik-down \t\t Stops oCIS-traefik"
	@echo "  ldap \t\t\t Starts oCIS with ldap"
	@echo "  ldap-down \t\t Stops oCIS-ldap"
	@echo "  wopi \t\t\t Starts oCIS with wopi"
	@echo "  wopi-down \t\t Stops oCIS-wopi"
	@echo "  nfs \t\t\t Starts oCIS with nfs storage. Set mount path using 'NFS_MOUNT_PATH' env"
	@echo "  nfs-down \t\t Stops oCIS-nfs"
	@echo "  s3 \t\t\t Starts oCIS with s3 storage"
	@echo "  s3-down \t\t Stops oCIS-s3"
	@echo "  keycloak \t\t Starts oCIS with keycloak idp"
	@echo "  keycloak-down \t Stops oCIS-keycloak"

COMPOSE_FILES = -f ocis.yaml

ifneq ("$(wildcard local.yaml)","")
	COMPOSE_FILES += -f local.yaml
endif

.PHONY: pull
pull:
	$(eval COMPOSE_FILES += -f keycloak.yaml -f ldap.yaml -f nfs.yaml -f s3.yaml -f traefik.yaml -f wopi.yaml)
	@docker compose $(COMPOSE_FILES) pull

# start oCIS (full text search is enabled)
.PHONY: ocis
ocis:
	@docker compose $(COMPOSE_FILES) up

.PHONY: ocis-down
ocis-down:
	@docker compose -f ocis.yaml down -v --remove-orphans

# start oCIS with ldap
.PHONY: ldap
ldap:
	$(eval COMPOSE_FILES += -f ldap.yaml)
	@docker compose $(COMPOSE_FILES) up

.PHONY: ldap-down
ldap-down:
	$(eval COMPOSE_FILES += -f ldap.yaml)
	@docker compose $(COMPOSE_FILES) down -v --remove-orphans

# start oCIS with wopi
.PHONY: wopi
wopi:
	$(eval COMPOSE_FILES += -f wopi.yaml)
	@docker compose $(COMPOSE_FILES) up

.PHONY: wopi-down
wopi-down:
	$(eval COMPOSE_FILES += -f wopi.yaml)
	@docker compose $(COMPOSE_FILES) down -v --remove-orphans

# start oCIS with nfs storage
.PHONY: nfs
nfs:
	$(eval COMPOSE_FILES += -f nfs.yaml)
	@docker compose $(COMPOSE_FILES) up

.PHONY: nfs-down
nfs-down:
	$(eval COMPOSE_FILES += -f nfs.yaml)
	@docker compose $(COMPOSE_FILES) down -v --remove-orphans

# start oCIS with s3 storage
.PHONY: s3
s3:
	$(eval COMPOSE_FILES += -f s3.yaml)
	@docker compose $(COMPOSE_FILES) up

.PHONY: s3-down
s3-down:
	$(eval COMPOSE_FILES += -f s3.yaml)
	@docker compose $(COMPOSE_FILES) down -v --remove-orphans

# start oCIS with traefik
.PHONY: traefik
traefik:
	$(eval COMPOSE_FILES += -f traefik.yaml)
	@docker compose $(COMPOSE_FILES) up

.PHONY: traefik-down
traefik-down:
	$(eval COMPOSE_FILES += -f traefik.yaml)
	@docker compose $(COMPOSE_FILES) down -v --remove-orphans

# start oCIS with keycloak
.PHONY: keycloak
keycloak:
	$(eval COMPOSE_FILES += -f keycloak.yaml)
	@docker compose $(COMPOSE_FILES) up

.PHONY: keycloak-down
keycloak-down:
	$(eval COMPOSE_FILES += -f keycloak.yaml)
	@docker compose $(COMPOSE_FILES) down -v --remove-orphans
