FROM openlabs/docker-wkhtmltopdf:latest
MAINTAINER Sharoon Thomas <sharoon.thomas@openlabs.co.in>

# Install dependencies for running web service

RUN apt-get update 
RUN apt-get install python3 python
FROM python:3
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir werkzeug executor gunicorn

ADD app.py /app.py
EXPOSE 80

ENTRYPOINT ["usr/local/bin/gunicorn"]

# Show the extended help
CMD ["-b", "0.0.0.0:80", "--log-file", "-", "app:application"]
