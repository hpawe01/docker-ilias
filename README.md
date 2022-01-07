# Configured docker image for ILIAS 6.4

## Requirements

Download file `https://github.com/ILIAS-eLearning/ILIAS/archive/v6.4.tar.gz` into project root (at the moment needed to build the docker image).

## Usage

1. `docker-compose up -d`
2. Go to `localhost:8001`
3. Login in with `root` and `secret`

Master Password: `secret`

### Available users
- root:secret = Admin

## Development infos

### Reset DB
`docker-compose down -v`

### Recreate ilias image
`docker-compose build --no-cache`

### Create new startup_db
1. `docker exec -it ilias_db_1 mysqldump -u ilias -psecret ilias -r startup_db.sql`
2. `docker cp ilias_db_1:startup_db.sql ./`

See https://stackoverflow.com/a/20086949/5816097 on why we cannot use `... > startup_db.sql`.