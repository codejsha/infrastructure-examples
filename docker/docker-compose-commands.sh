######################################################################

function docker-compose() { echo "+ docker-compose ${@}">&2; command docker-compose ${@}; }

######################################################################

docker-compose

docker-compose build
docker-compose up
docker-compose run
docker-compose down

docker-compose start
docker-compose stop
docker-compose restart

docker-compose ps
docker-compose top
docker-compose config
docker-compose logs --follow

docker-compose kill
docker-compose rm

### docker compose exec
docker-compose exec httpd /bin/bash
docker-compose exec --detach httpd /bin/bash -c "ls -al /var/www/html"
docker-compose exec --detach httpd /bin/sh -c "ls -al /var/www/html"
