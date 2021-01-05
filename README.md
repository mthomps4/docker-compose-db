# Setup

- Create a `.env` from `.env.example` and set your DB ENVs accordingly.
- Ensure `setup.sh` has executable permissions by running `chmod +x ./setup.sh`
- Run `./setup.sh`

This setup file should create a folder PER db, each with a init folder and file to setup user permissions for the given ENVs.
This file will then be used by docker in pair with `docker-entrypoint-initdb.d`

## Initializers

These files will be used when running setup.sh to create the `db` scaffold.
Each db will have:

- data (where the DB and data actually live)
- init

`init` is mapped to the `docker-entrypoint-initdb.d` volume.
This will run any setup SQL you wish. For now, we doubly ensure the ENV user has Super Admin Root like privs.

### Troubleshooting ENVs

- run `docker-compose config` to ensure your ENVs are pulling through
- run `docker-compose logs --tail` for anything else
