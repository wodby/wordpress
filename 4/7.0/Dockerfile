FROM wodby/wordpress-php:7.1-2.0.0

ENV WORDPRESS_VERSION 4.7.3
ENV WORDPRESS_SHA1 35adcd8162eae00d5bc37f35344fdc06b22ffc98

RUN set -ex; \
	curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz"; \
	echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
	tar -xzf wordpress.tar.gz -C /tmp; \
	rm -rf wordpress.tar.gz && \
	mv /tmp/wordpress/* /var/www/html && \
	rm -rf /tmp/wordpress && \
	chown -R www-data:www-data /var/www/html/
