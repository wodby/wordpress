FROM wodby/wordpress-php:7.0

ENV WORDPRESS_VERSION 4.7.3
ENV WORDPRESS_SHA1 35adcd8162eae00d5bc37f35344fdc06b22ffc98

RUN set -ex; \
	curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz"; \
	echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
	tar -xzf wordpress.tar.gz -C /usr/src; \
	rm wordpress.tar.gz && \
	chown -R www-data:www-data /usr/src/wordpress

COPY init /docker-entrypoint-init.d/