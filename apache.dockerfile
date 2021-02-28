FROM httpd


COPY ./apache/httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf
COPY ./apache/httpd.conf /usr/local/apache2/conf/httpd.conf

RUN chown www-data:www-data /usr/local/apache2/htdocs

RUN chown 777 -R /usr/local/apache2/htdocs