# Use an official Ubuntu 20.04 LTS as a base image
FROM ubuntu:20.04

# Update packages and install Apache
RUN apt-get update \
    && apt-get install -y apache2 wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download a sample website (e.g., NeoGym template) using wget
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip

# Unzip the downloaded file (assuming unzip is installed)
RUN apt-get update \
    && apt-get install -y unzip \
    && unzip neogym.zip -d /var/www/html \
    && rm neogym.zip \
    && apt-get remove -y unzip \
    && apt-get autoremove -y

# Expose port 80
EXPOSE 80

# Start Apache service on container startup
CMD ["apache2ctl", "-D", "FOREGROUND"]
