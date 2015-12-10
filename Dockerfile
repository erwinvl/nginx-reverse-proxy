# Pull base image.
FROM FROM oraclelinux:latest

# Copy 
ADD ./rpm/ .

# Install Nginx.
RUN rpm -i nginx-release-rhel-7-0.el7.ngx.noarch.rpm \
 && yum -y install nginx \
 && chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Copy all config files
COPY config/default.conf /etc/nginx/conf.d/default.conf

# Copy default webpage

# Define default command.
CMD nginx
