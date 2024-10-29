# oCIS Deployments

This directory contains a collection of composable deployment examples for oCIS. Various configurations are possible, depending on the use case but compose it carefully because some combination might not work.

## Running pre-defined deployments

Makefile command targets are provided to run pre-defined deployments. To see the available deployment targets, simply run:

```bash
make help
```

Example; to start oCIS with ldap:

```bash
make ldap
```

and to stop it:

```bash
make ldap-down
```

## Starting custom deployments

Different combinations of services can be deployed by using `docker compose`. If pre-defined deployment targets do not fit your needs, you can start oCIS with your own composition.

Here is an example to start oCIS with ldap:

```bash
docker compose -f ldap.yaml up
```

and to stop it:

```bash
docker compose -f ldap.yaml down -v
```

## Running different oCIS versions

You can use the following environment variables to specify the ocis docker image.

- `OCIS_DOCKER_IMAGE`: The docker image to use for oCIS.
- `OCIS_VERSION_TAG`: The version tag of the docker image to use for oCIS.

```bash
OCIS_DOCKER_IMAGE="owncloud/ocis-rolling" OCIS_VERSION_TAG="6.6.0" make ldap
```
