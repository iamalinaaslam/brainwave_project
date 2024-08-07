FROM centos:latest
RUN rm -rf /etc/yum.repos.d/*
WORKDIR /etc/yum.repos.d
COPY ./local.repo /etc/yum.repos.d
RUN yum install -y vim wget zip httpd
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/spering.zip
RUN unzip spering.zip
RUN rm -rf spering.zip
RUN cp -rf spering-html/* /var/www/html
RUN rm -rf spering*
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
