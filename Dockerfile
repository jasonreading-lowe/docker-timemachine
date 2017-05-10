FROM scrapes/docker-timemachine:latest

ADD entrypoint.sh /entrypoint.sh
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD afp.conf /etc/afp.conf
ADD start_netatalk.sh /start_netatalk.sh

CMD ["/entrypoint.sh"]

# docker build -t afpserver:latest .