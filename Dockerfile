FROM devopsedu/webapp

RUN apt-get update && apt-get install -y \
	php \
	php-mysql \
	apache2 \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /var/www/html/

RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
