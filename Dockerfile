FROM tomcat:9.0
MAINTAINER Yuvaraj Patel (ambawatyuvaraj@outlook.com)
RUN apt-get update && apt-get install -y apt-transport-https
RUN echo 'deb http://private-repo-1.hortonworks.com/HDP/ubuntu14/2.x/updates/2.4.2.0 HDP main' >> /etc/apt/sources.list.d/HDP.list
RUN echo 'deb http://private-repo-1.hortonworks.com/HDP-UTILS-1.1.0.20/repos/ubuntu14 HDP-UTILS main'  >> /etc/apt/sources.list.d/HDP.list
RUN echo 'deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/azurecore/ trusty main' >> /etc/apt/sources.list.d/azure-public-trusty.list
RUN apt-get install -y zip
ADD https://bootstrapmade.com/content/templatefiles/Knight/Knight.zip /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat/webapps/
RUN unzip Knight.zip
RUN rm -rf Knight.zip


