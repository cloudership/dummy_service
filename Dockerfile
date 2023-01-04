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

WORKDIR /app/

COPY pyproject.toml poetry.lock /app/
RUN poetry install

COPY . /app/

CMD APP_PORT=3000 poetry run python dummy.py
