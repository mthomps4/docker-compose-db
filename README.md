# Setup

- Create a `.env` from `.env.example` and set your DB ENVs accordingly.
- Ensure `setup.sh` has executable permissions by running `chmod +x ./setup.sh`
- Run `./setup.sh`

This setup file should create a folder PER db, each with a init folder and file to setup user permissions for the given ENVs.
This file will then be used by docker in pair with `docker-entrypoint-initdb.d`

## Initializers

asdf

### Troubleshooting ENVs

- run `docker-compose config` to ensure your ENVs are pulling through
