FROM python:3-alpine

ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code

RUN apk update && apk add postgresql-dev g++ make && pip install pipenv

COPY Pipfile Pipfile.lock /code/

RUN pipenv install

COPY . /code/

CMD ["runserver", "0.0.0.0:8000"]
ENTRYPOINT  ["pipenv", "run", "./manage.py"]
