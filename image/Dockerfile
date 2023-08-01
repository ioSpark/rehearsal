FROM python:3.6

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y \
      build-essential \
      libffi7 \
      libffi-dev \
      libssl-dev \
      curl \
      bash-completion \
      vim \
      git \
      graphviz \
      libgraphviz-dev \
      pkg-config \
      nodejs \
      npm

RUN pip install --upgrade pip
COPY requirements.txt /requirements.txt
RUN pip install -r requirements.txt

COPY web /web
WORKDIR /web
RUN npm install

COPY orquesta /orquesta
WORKDIR /orquesta
# TODO: Fix? (not needed for dev image, but for consistency with Dockerfile.prod)
RUN echo "greenlet~=2.0" >> requirements.txt
RUN sed -i "s/stevedore>=1.3.0/stevedore~=3.0/g" requirements.txt
RUN pip install -e .

WORKDIR /web
COPY bin/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
