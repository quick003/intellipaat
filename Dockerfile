FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2

EXPOSE 80

COPY . /var/www/html

CMD service apache restart

CMD ["apache2ctl", "-D", "FOREGROUND"]
