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
docker compose -f ocis.yml -f ldap.yml up
```

and to stop it:

```bash
docker compose -f ocis.yml -f ldap.yml down -v
```

## Running different oCIS versions

To run the specific version of oCIS, you can use the `OCIS_VERSION` environment variable to specify the version. For example, to run oCIS 3.1.0:

```bash
OCIS_VERSION=3.1.0 make ldap
```
