docker run \
    --detach \
    --name my_db \
    --env MARIADB_USER=example-user \
    --env MARIADB_PASSWORD=my_cool_secret \
    --env MARIADB_ROOT_PASSWORD=my-secret-pw \
    mariadb:latest