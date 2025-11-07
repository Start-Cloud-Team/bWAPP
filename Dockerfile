FROM php:5.6-apache

# CodeBuild 환경에서 소스 코드를 웹 루트 디렉토리로 복사합니다.
COPY . /var/www/html/

# 웹 서버 실행 사용자(www-data)에게 디렉토리 권한을 부여합니다.
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

# 웹 서버 포트를 8080으로 변경하는 Apache 설정 파일 추가
# (만약 CodePipeline 템플릿이 8080을 사용하도록 설정되었다면)
# 만약 없다면, CodeBuild 과정에서 이 설정 파일을 생성해야 합니다.

# 컨테이너 포트를 8080으로 노출합니다.
EXPOSE 8080
