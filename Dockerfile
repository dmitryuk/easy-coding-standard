FROM php:7.2-cli

ARG VERSION="7.2.*"
RUN apt update && apt -y install git
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global require symplify/easy-coding-standard ${VERSION} \
    && composer global show | grep easy-coding-standard
    && rm -rf /var/lib/apt/lists/*