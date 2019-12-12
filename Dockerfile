FROM python:3.6

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
#RUN pip install --upgrade pip
RUN pip install Flask==1.0.2 uWSGI==2.0.17.1 requests==2.22.0 redis
WORKDIR /app
COPY app /app
COPY cmd.sh /
RUN chmod +x /cmd.sh

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]