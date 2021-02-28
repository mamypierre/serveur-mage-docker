url:magento.docker
docker-compose up -d
docker exec composer composer update
bin/magento module:disable Magento_TwoFactorAuth

bin/magento setup:install --base-url=http://magento.docker --db-host=localhost --db-name=homestead --db-user=homestead  --db-password=secret --admin-firstname=admin --admin-lastname=admin --admin-email=admin@admin.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1




bin/magento admin:user:create  --admin-firstname=admindona 	--admin-lastname=admindona --admin-email=admindona@admin.com --admin-user=admindona --admin-password=adminroot1


   MYSQL_DATABASE: homestead
      MYSQL_USER: homestead
      MYSQL_PASSWORD: secret
      MYSQL_ROOT_PASSWORD: secret
      SERVICE_TAGS: dev
      SERVICE_NAME: mysql



bin/magento setup:install --base-url=http://magento.docker/ \
--db-host=mysql --db-name=homestead --db-user=homestead --db-password=secret \
--language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1 \
--search-engine=elasticsearch7 --elasticsearch-host=elasticsearch \
--elasticsearch-port=9200


-d memory_limit=-1
