# Bash Aliases (Dev Helpers)

NOTE: For these aliases to work the ENVs will need to be copied and exported from your .bashrc, .zshrc, or equiv to be loaded.

```sh
export MYSQL_ROOT_PASSWORD=password
...
```

**Base Command**
docker-compose -f <path_to_file> <command> <service_name>

Examples:
> Assumes this repo is cloned to `~/Databases`

```sh
alias db:build='docker-compose -f ~/Databases/docker-compose.yml up --no-start'
alias db:logs='docker-compose -f ~/Databases/docker-compose.yml logs -f'
alias db:all:start='docker-compose -f ~/Databases/docker-compose.yml start'
alias db:all:stop='docker-compose -f ~/Databases/docker-compose.yml stop'
alias db:mysql56:start='docker-compose -f ~/Databases/docker-compose.yml start mysql56'
alias db:mysql56:stop='docker-compose -f ~/Databases/docker-compose.yml stop mysql56'
alias db:mysql57:start='docker-compose -f ~/Databases/docker-compose.yml start mysql57'
alias db:mysql57:stop='docker-compose -f ~/Databases/docker-compose.yml stop mysql57'
alias db:mysql8:start='docker-compose -f ~/Databases/docker-compose.yml start mysql8'
alias db:mysql8:stop='docker-compose -f ~/Databases/docker-compose.yml stop mysql8'
alias db:postgres:start='docker-compose -f ~/Databases/docker-compose.yml start postgres'
alias db:postgres:stop='docker-compose -f ~/Databases/docker-compose.yml stop postgres'
# ... Other versions and tools similar
```
