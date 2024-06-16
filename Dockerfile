FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y apache2 wget unzip

RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip


RUN unzip oxer.zip -d /var/www/html \
    && rm oxer.zip
    
RUN rm -f /var/www/html/index.html \
    && mv /var/www/html/oxer-html/* /var/www/html 


EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]

