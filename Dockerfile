FROM node:8.9.0

#Install required applications

RUN echo 'deb http://httpredir.debian.org/debian jessie-backports main' >> /etc/apt/sources.list.d/jessie-backports.list

RUN apt-get update && \
apt install -y -t jessie-backports openjdk-8-jre-headless ca-certificates-java && \
apt-get install -y 	 wget openjdk-8-jre && \
apt-get install git

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

RUN npm install --unsafe-perm --save-exact -g protractor selenium-webdriver \
  && npm update \
# Get the latest WebDriver Manager
  && webdriver-manager update \
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


