FROM centos:centos7
MAINTAINER "Ppamo" <pablo@ppamo.cl>

# install devel tools
RUN yum install -y httpd epel-release git vim

# copy ppamo.cl config file
COPY ppamo.cl.conf /etc/httpd/conf.d/

# downnload repo
RUN git clone https://github.com/Ppamo/branding.www.git /var/www/ppamo.cl

# start apache
CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]

# expose ssh and start httpd
EXPOSE 80
