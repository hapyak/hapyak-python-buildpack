FROM heroku/heroku:18-build.v16

WORKDIR /app
ENV WORKSPACE_DIR="/app/builds" \
    S3_BUCKET="lang-python" \
    S3_PREFIX="heroku-18/" \
    DEBIAN_FRONTEND=noninteractive \
    STACK="heroku-18"

RUN apt-get update && apt-get install --no-install-recommends -y python-pip-whl=9.0.1-2 python-pip=9.0.1-2 python-setuptools python-wheel libsqlite3-dev && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt --no-index --find-links /app/wheels

COPY . /app
