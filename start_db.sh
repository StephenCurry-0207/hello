C_name="dke_db"
DK_pw="123456"

before(){
    docker stop "$1"
    docker rm "$1"
}

start_db(){
    docker run \
    --detach \
    --name "$1" \
    --env MARIADB_USER=example-user \
    --env MARIADB_PASSWORD=my_cool_secret \
    --env MARIADB_ROOT_PASSWORD=$2 \
    mariadb:latest
}

test(){
    sudo apt install -y mysql-client
    sleep 10
    mysql -u root -h "172.17.0.2" -p$1 -e "show databases;"
}

before "${C_name}"
start_db "${C_name}" "${DK_pw}"
test "${DK_pw}"