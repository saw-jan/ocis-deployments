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


# start oCIS (full text search is enabled)
.PHONY: ocis
ocis:
	@docker compose -f ocis.yml up

.PHONY: ocis-down
ocis-down:
	@docker compose -f ocis.yml down -v --remove-orphans

# start oCIS with ldap
.PHONY: ldap
ldap:
	@docker compose -f ocis.yml -f ldap.yml up

.PHONY: ldap-down
ldap-down:
	@docker compose -f ocis.yml -f ldap.yml down -v --remove-orphans

# start oCIS with wopi
.PHONY: wopi
wopi:
	@docker compose -f ocis.yml -f wopi.yml up

.PHONY: wopi-down
wopi-down:
	@docker compose -f ocis.yml -f wopi.yml down -v --remove-orphans

# start oCIS with nfs storage
.PHONY: nfs
nfs:
	@docker compose -f ocis.yml -f nfs.yml up

.PHONY: nfs-down
nfs-down:
	@docker compose -f ocis.yml -f nfs.yml down -v --remove-orphans

# start oCIS with s3 storage
.PHONY: s3
s3:
	@docker compose -f ocis.yml -f s3.yml up

.PHONY: s3-down
s3-down:
	@docker compose -f ocis.yml -f s3.yml down -v --remove-orphans

# start oCIS with traefik
.PHONY: traefik
traefik:
	@docker compose -f ocis.yml -f traefik.yml up

.PHONY: traefik-down
traefik-down:
	@docker compose -f ocis.yml -f traefik.yml down -v --remove-orphans

# start oCIS with keycloak
.PHONY: keycloak
keycloak:
	@docker compose -f ocis.yml -f keycloak.yml up

.PHONY: keycloak-down
keycloak-down:
	@docker compose -f ocis.yml -f keycloak.yml down -v --remove-orphans
