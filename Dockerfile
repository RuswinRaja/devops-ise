FROM devopsedu/webapp

RUN apt-get update && apt-get install -y \
    php \
    php-mysql \
    apache2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clean up default Apache page
RUN rm -f /var/www/html/index.html

# Copy your app files (this is the key fix!)
COPY website/ /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Enable Rewrite if needed
RUN a2enmod rewrite

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

