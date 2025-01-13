# Usar una imagen base de PHP oficial con Apache
FROM php:8.1-apache

# Activar el módulo de reescritura de Apache y el módulo de sesiones
RUN a2enmod rewrite && docker-php-ext-install session

# Establecer ServerName directamente en el Dockerfile
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Instalar la extensión mysqli y otras dependencias necesarias
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libmariadb-dev-compat \
    libmariadb-dev \
    openjdk-17-jdk-headless && docker-php-ext-install mysqli pdo pdo_mysql

# Copiar los archivos de la API al directorio raíz de Apache
COPY . /var/www/html/

# Copiar el archivo JRXML al contenedor, asegúrate de colocar la ruta correcta
#COPY ./path/to/reporteEstudiante.jrxml /var/www/html/reportes/reporteEstudiante.jrxml

# Establecer los permisos correctos para los archivos
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html 

#&& chmod 644 /var/www/html/reportes/reporteEstudiante.jrxml  # Asegúrate de que el archivo JRXML tenga los permisos adecuados

# Exponer el puerto 80 (por defecto de Apache)
EXPOSE 80

# Comando por defecto para iniciar Apache en primer plano
CMD ["apache2-foreground"]
