FROM php:7.2-cli-stretch

ARG VERSION="7.2.*"
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=alpine/git /usr/bin/git /usr/bin/git

RUN apt update && apt -y install --no-install-recommends zlib1g-dev \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/* \
    && composer global require symplify/easy-coding-standard ${VERSION} \
    && composer clear-cache \
    && rm -rf /var/cache/* /var/tmp/* /tmp/* /var/lib/apt/lists/*  /usr/share/man /var/lib/dpkg/info \
    && ln -s /root/.composer/vendor/bin/ecs /usr/bin

WORKDIR /app

ENTRYPOINT ["ecs"]