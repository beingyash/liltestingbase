FROM node:8.15.0-jessie

#Install required applications

RUN echo 'deb http://ftp.jp.debian.org/debian jessie main' >> /etc/apt/sources.list.d/jessie-backports.list

RUN apt-get update && \
apt install -y -t openjdk-8-jre-headless ca-certificates-java && \
apt-get install -y xvfb wget openjdk-8-jre && \
apt-get install git

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

RUN npm install --unsafe-perm --save-exact -g protractor \
  && npm update \
## Get the latest WebDriver Manager
  && webdriver-manager --versions.chrome 2.44 update
  
ENV NODE_PATH /usr/local/lib/node_modules

# Installing node modules
RUN npm i --unsafe-perm -g jasmine-spec-reporter \
protractor-fail-fast \
jasmine-reporters \
protractor-html-reporter \
protractor-jasmine2-html-reporter \
junit-report-merger \
mammoth \
html-dnd


