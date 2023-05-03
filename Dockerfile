FROM python:3.11.2-alpine

EXPOSE 8000

WORKDIR /code

# Install system dependencies
RUN apk add gcc musl-dev libffi-dev make && \
    rm -rf /var/cache/apk/ && \
    pip install --upgrade pip && \
    pip install poetry

COPY . /code
RUN poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi --no-dev --no-root --without test

#CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
CMD ["make", "serve"]