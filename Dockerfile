FROM ubuntu

RUN apt-get update \
    && apt-get install -y apache2 wget unzip 

RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip

RUN unzip neogym.zip -d /var/www/html 

RUN rm -f /var/www/html/index.html \
    && mv /var/www/html/neogym-html/* /var/www/html 

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
