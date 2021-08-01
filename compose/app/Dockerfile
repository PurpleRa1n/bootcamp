FROM python:3.9.6-alpine

LABEL maintainer='Artem F'

ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIPENV_VENV_IN_PROJECT=1

RUN apk update && apk add gcc libffi-dev g++ postgresql-dev make curl bash

RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock

RUN source $HOME/.poetry/env && poetry config virtualenvs.create false && poetry install --no-dev --no-ansi --no-root

RUN apk del libffi-dev g++ make curl

COPY ./app /app
COPY ./compose/app/entrypoint.sh usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["run-dev-server"]
