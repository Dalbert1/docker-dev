FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update -y && apt-get install -y python3 python3-pip libpq-dev gcc vim postgresql
EXPOSE 5000
RUN useradd -m dalbert -u 32767
COPY --chown=dalbert:dalbert app/ /app/
WORKDIR /app
ENV PYTHONPATH=$PYTHONPATH:/app/image-gallery/
RUN pip3 install -r requirements.txt
ENV FLASK_APP=app.py
ENV FLASK_ENV=production
USER dalbert
CMD ["uwsgi", "--http", ":5000", "--module", "gallery.ui.app:app", "--master", "--processes", "4", "--threads", "2", "--stats", "0.0.0.0.0:8888", "--lazy-apps"]
