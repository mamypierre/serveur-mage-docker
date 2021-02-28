create folder src/project1 ,src/project2
add httpd-vhosts.conf  ex : `DocumentRoot /usr/local/apache2/htdocs/project1`
## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

Next, navigate in your terminal to the directory you cloned this, and spin up the containers for the web server by running `docker-compose up -d --build site_apache`.

- `docker exec composer composer update`
