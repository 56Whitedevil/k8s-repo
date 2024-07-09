FROM ubuntu:latest

RUN apt update -y 

RUN apt install apache2 -y 

RUN apt install -y apache2-utils

RUN apt clean

EXPOSE 80

WORKDIR /var/www/html

RUN rm -rf index.html

COPY ./* .

CMD [“apache2ctl”, “-D”, “FOREGROUND”]
