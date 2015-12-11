# Pull base image.
FROM oraclelinux:latest

# Copy 
ADD ./rpm/ .

# Install Nginx.
RUN rpm -i nginx-release-rhel-7-0.el7.ngx.noarch.rpm \
 && rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm \
 && yum -y install nginx uwsgi uwsgi-plugin-python 

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Copy all config files
COPY config/default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80
# Define default command.
CMD /usr/sbin/nginx -g "daemon off;"
