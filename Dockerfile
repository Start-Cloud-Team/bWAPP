FROM php:5.6-apache

# CodeBuild 환경에서 소스 코드를 웹 루트 디렉토리로 복사합니다.
COPY . /var/www/html/

# --- 추가/수정 필요: Apache를 8080 포트에서 리스닝하도록 설정 ---
# 1. 80번 포트 대신 8080 포트를 노출합니다.
EXPOSE 8080 
# 2. Apache의 기본 포트 설정을 8080으로 변경하는 명령 추가
# (php:5.6-apache 이미지는 /etc/apache2/ports.conf 와 /etc/apache2/sites-enabled/000-default.conf 파일을 수정해야 할 수 있습니다. 
# 또는 환경 변수를 통해 포트를 변경하도록 설정되어 있는지 확인합니다.)
# Port 8080 설정 파일을 복사하는 것이 가장 간단합니다.
# 예: COPY ports.conf /etc/apache2/ports.conf 
# -----------------------------------------------------------

# 웹 서버 실행 사용자(www-data)에게 디렉토리 권한을 부여합니다.
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/
