FROM php:5.6-apache

# 아파치의 기본 리스닝 포트를 8080으로 변경
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf \
    && sed -i 's/:80/:8080/g' /etc/apache2/sites-enabled/000-default.conf

# 소스를 복사
COPY . /var/www/html/

# 권한 설정
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

# 8080 포트를 노출
EXPOSE 8080
