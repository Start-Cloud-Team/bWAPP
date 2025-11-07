FROM php:5.6-apache

# CodeBuild 환경에서 소스 코드를 웹 루트 디렉토리로 복사합니다.
COPY . /var/www/html/

# 웹 서버 실행 사용자(www-data)에게 디렉토리 권한을 부여합니다.
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

# 웹 서버 기본 포트인 80번 포트를 노출합니다.
EXPOSE 80
