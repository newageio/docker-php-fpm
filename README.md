# docker-php-fpm
PHP-FPM docker with php 7.0 support (MYSQL + MongoDB)


Example to use in docker-compose file:

```
php-fpm:
  image: newage/php-fpm
  container_name: php-fpm
  volumes:
    - ./src/:/var/www/
    - ./php-fpm/conf/php-ini-overrides.ini:/etc/php/7.1/fpm/conf.d/99-overrides.ini
    - ./php-fpm/conf/www.conf:/etc/php/7.1/fpm/pool.d/www.conf
    - /var/run/php/

webserver:
  image: nginx
  volumes:
    - ./src/:/var/www/franko
    - ./nginx/conf.d:/etc/nginx/conf.d
  volumes_from:
    - franko-php-fpm
  ports:
    - "80:80"
```

In nginx config you need set `fastcgi_pass` in `location ~ \.php$ {` :

```
    fastcgi_pass unix:/var/run/php/php-fpm.sock;
```