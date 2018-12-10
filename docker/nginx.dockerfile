# Pull nginx image
FROM nginx:1.15.7

COPY docker/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80 


COPY docker/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

CMD ["/wait-for-it.sh", "api:9000", "-t", "25", "--", "nginx", "-g", "daemon off;"]
#CMD /bin/bash -c "nginx -g 'daemon off;'"