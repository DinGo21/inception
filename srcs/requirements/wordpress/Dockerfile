FROM debian:bullseye

RUN mkdir /run/php

RUN apt-get update && apt-get install -y \
	curl \
	php \
	php-fpm \
	php-mysqli

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]
