FROM php:7.2-cli

ARG VERSION="7.2.*"
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global require symplify/easy-coding-standard ${VERSION} \
    && composer global show | grep easy-coding-standard