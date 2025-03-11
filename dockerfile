# Use official PHP image with Apache
FROM php:8.2-apache

# Install necessary PHP extensions (mysqli for MySQL)
RUN docker-php-ext-install mysqli

# Enable Apache mod_rewrite (for URL routing if needed)
RUN a2enmod rewrite

# Set up working directory inside the container
WORKDIR /var/www/html

# Copy your application files into the container (adjust as needed)
COPY . /var/www/html/

# Set environment variables for Apache document root
ENV APACHE_DOCUMENT_ROOT /var/www/html

# Update Apache config to set the correct document root
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf

# Expose port 80 for the Apache server
EXPOSE 80

# Ensure the Apache service runs in the foreground
CMD ["apache2-foreground"]
