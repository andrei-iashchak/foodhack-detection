FROM python:3
MAINTAINER andrey@yashchak.ru

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt ./
RUN apt-get update && apt-get install python-matplotlib -y

RUN pip install -r requirements.txt

RUN which python3
RUN which python

COPY . ./

EXPOSE 5000

ENV PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
ENV FLASK_APP=server.py

CMD ["flask", "run", "--host=0.0.0.0"]
