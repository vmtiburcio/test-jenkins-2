FROM centos:7

RUN yum update -y
RUN yum install python -y
RUN yum -y install epel-release && yum clean all
RUN yum -y install python-pip && yum clean all
RUN pip install --upgrade pip
RUN mkdir /opt/app
COPY src/* /opt/app/ 
COPY requirements.txt /opt/app/
RUN pip install -r /opt/app/requirements.txt

COPY docker-entrypoint.sh /

ENTRYPOINT "/docker-entrypoint.sh"

