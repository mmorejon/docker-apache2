#
# Dockerfile Apache2
#

FROM ubuntu:trusty

MAINTAINER Manuel Morejón <manuel.morejon.85@gmail.com>

# Install base packages
RUN \
	apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 && \

	# Cleaning files.  
    apt-get clean && \    
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	
    # Configuring Server Name
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

ENV ALLOW_OVERRIDE **False**

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with web app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
ADD web/ /app

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
