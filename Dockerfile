FROM python:stretch

LABEL maintainer='Kashgary'
LABEL date='2010-5-06'
LABEL description='FSND Docker project'

COPY . /app
WORKDIR /app

ENV PYTHONUNBUFFERED 1 \
    PYTHONDONTWRITEBYTECODE 1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_NO_CACHE_DIR=off

RUN pip install --upgrade pip
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":31535", "main:APP"]