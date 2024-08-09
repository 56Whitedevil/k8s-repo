FROM ubuntu:22.04

WORKDIR /

RUN apt-get -y update && apt-get -y install software-properties-common && apt-get -y install git && apt-get -y install --no-install-recommends apt-utils

RUN apt-get install apache2* -y

RUN a2enmod ssl && a2enmod headers && a2enmod rewrite && service apache2 restart

WORKDIR /var/www/html/

COPY . /var/www/html/

EXPOSE 80

ENTRYPOINT ["apache2ctl"]

CMD ["-DFOREGROUND"]