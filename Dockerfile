# syntax=docker/dockerfile:1
FROM python:3.11.1-alpine

RUN apk add bash

RUN poetryvenv=/usr/lib/poetry/venv && \
    ( \
    mkdir -p "${poetryvenv}" && \
    python3 -m venv "${poetryvenv}" && \
    "${poetryvenv}/bin/pip" install --quiet --upgrade pip setuptools && \
    "${poetryvenv}/bin/pip" install --quiet poetry && \
    ln -s "${poetryvenv}/bin/poetry" "/usr/bin/poetry" \
    )

COPY . /app
WORKDIR /app

RUN poetry install

CMD poetry run python dummy.py
