# 베이스 이미지
FROM php:5.6-apache

# 웹 루트 디렉토리로 코드 복사
COPY . /var/www/html/

# 웹 서버 실행 사용자(www-data)에게 디렉토리 권한 부여
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

# Apache 기본 포트 80 노출
EXPOSE 80

# 컨테이너 시작 시 Apache 실행
CMD ["apache2-foreground"]
