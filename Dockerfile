# 베이스 이미지
FROM php:5.6-apache

# **Step 1: Apache가 8080 포트를 리스닝하도록 설정**
# 이 명령어는 Apache 설정 파일(ports.conf)의 80번 포트 리스닝 부분을 8080으로 변경합니다.
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf && \
    # default-ssl.conf에도 8080이 사용되도록 수정 (선택적)
    sed -i 's/<VirtualHost \*:443>/<VirtualHost \*:8080>/g' /etc/apache2/sites-available/default-ssl.conf
    
# 웹 루트 디렉토리로 코드 복사
COPY . /var/www/html/

# 웹 서버 실행 사용자(www-data)에게 디렉토리 권한 부여
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/ && \
    # db 디렉터리에만 그룹 쓰기 권한(775)을 추가로 부여 
    chmod -R 775 /var/www/html/db

# **Step 2: 노출 포트를 8080으로 변경**
# 컨테이너가 8080 포트를 노출하도록 명시
EXPOSE 8080

# 컨테이너 시작 시 Apache 실행
CMD ["apache2-foreground"]
