# Why Docker DB

The same reason you use docker for anything, projects differ, and while version managers work well for programming languages, they are nightmarish for databases.
Have you ever tried to manage 3 versions of MySQL on a mac?
While you can brew link all day... they still share common mysql setup files and config files via brew...
and as you could imagine, MySQL@5.6 and MySQL8 do not play nice together.

**Why can't we just host these in the cloud somewhere?!**
Absolutely, this is not to discourage other alternatives.
Slap that MySQL instance up there and drop some ENVs.
At some point however, you'll want more direct access to logging, and those _free_ services and hosts stop being free.
And what if you need to modify come `my.cnf` files? While services have options, and there are definitely pro's and con's to both, having more direct control over what is going in our dev setup can be ideal when onboarding and debugging various applications.

**_insert docker_**

## The Goal

The main focus here is to give each DB instance a home, MySQL 5.6 shouldn't care about MySQL8, etc.
Each instance is self contained to it's container with a persisted volume and config files are set for each as needed.
This also lends itself to expansion with other DB tooling, postgres, redis, and memcache for example.
If we need to tweak a config, it's as easy as stopping the running container, editing/creating a file and restarting.

## Setup

Note: If you are familiar with docker and want a single instance of a DB feel free to take a quick peak at [docker-compose.yml](./docker-compose.yml) and copy over what you need. This setup will enable you to setup and run, MySQL 5.6, 5.7, 8, and postgres either as a suite or as individual services (recommended).

We are leveraging [Docker/MySQL](https://hub.docker.com/_/mysql) and [Docker/Postgres](https://hub.docker.com/_/postgres) docs here.

- Create a `.env` from `.env.example` and set your DB ENVs accordingly.
- run `source .env`
- run `docker-compose config` to ensure your ENVs are pulling through
- You may need to ensure `setup.sh` has executable permissions by running `chmod +x ./setup.sh`
- Run `./setup.sh`

`./setup.sh` gives the folder [initializers](./initializers) permissions and runs each DB initializer file respectfully to scaffold out or `db` folder.

**Let's take a look at what happened:**
You should now see a `db` folder.
The initializers have created a folder PER db inside, each with a `data` folder, `init` folder, and for MySQL a `my.conf` file.
If you take a peak at the [db/mysql8/init](./db/mysql8/init) you'll notice the intializer also added a `01.sql` file.
This file will then be used by docker in pair with `docker-entrypoint-initdb.d` to run extra commands on setup.
In our case we've took the liberty to use our ENVs to ensure a super user was created with all permissions and a respected DB.
While the ENVs provided to [Docker/MySQL](https://hub.docker.com/_/mysql) already do this, I've kept this file as an example for any other seeds and sql you may need to run.

Note: For MySQL 5.6, I've set an example setup of Root with NO password. If you need something different be sure to tweak the initializer, ENVs, and compose, respectfully.

## Ways to run this thing

To pull, build, and link all the things with docker lets run from our project directory.

```sh
docker-compose up --no-start
```

This will pull the DB images from DockerHub, create the default network drivers, and build the containers to run.
Now we are ready to run all or some of our services.

```sh
docker-compose start mysql8
```

You should see `Starting mysql8 ... done`.

Let's see what's going on with

```sh
docker-compose logs -f
```

You should see something similar to:

```sh
MySQL8      | 2021-01-08T17:37:28.188065Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.22'  socket: '/var/run/mysqld/mysqld.sock'  port: 3308  MySQL Community Server - GPL.

MySQL56 exited with code 0
postgres exited with code 0
MySQL57 exited with code 0
```

You'll notice here - our other DBs have "exited" with a code of 0 -- ie. They were never started.
MySQL 8 is _ready for connections_ on _port: 3308_

> Side Note: Currently each DB port is hardcoded in the docker-compose file. If another port is needed, swap these out in the command: and ports: section, I'll look to make a quick follow with ENVs for these as well.

## Connecting via DB Viewer

This is no different than running a DB locally.
Your config will still look similar to below with localhost (or 127.0.0.1), port, username, and password.

Config:

![db-viewer-config](./screenshots/db-viewer-config.png)

Connected View:

![connected-dbs](./screenshots/connected-dbs.png)

## Next Steps

**Do I really need to cd into another project for all of this?!**
Nope!
Thanks to docker we can build some nice alias commands with the `-f` command.

```sh
# Base Command:
docker-compose -f <path_to_file> <command> <service_name>
```

```sh
# .bash_aliases
alias db:mysql8:start='docker-compose -f ~/Databases/docker-compose.yml start mysql8'
alias db:mysql8:stop='docker-compose -f ~/Databases/docker-compose.yml stop mysql8'
```

See [bash_aliases.md](./bash_aliases.md) for more fun helpers!
