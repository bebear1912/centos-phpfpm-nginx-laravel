FROM  sittiborn/centos-phpfpm
MAINTAINER "Sittiborn Y"

RUN composer global require "laravel/installer"

COPY ./00-default.conf /etc/nginx/conf.d/default.conf

# Add laravel to PATH
ENV PATH=$PATH:/root/.composer/vendor/bin

RUN echo $PATH

# Set the port to 80 
EXPOSE 80

# Executing supervisord
CMD ["supervisord" , "-n"]