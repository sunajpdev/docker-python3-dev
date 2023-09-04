FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
RUN apt-get install -y vim less

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN mkdir -p /root/src
WORKDIR /root/src

# poetry
COPY src/pyproject.toml /root/src
COPY src/poetry.lock /root/src

RUN pip install -U pip
RUN pip install poetry
RUN poetry install
