ARG VERSION=0.2.0

FROM python:alpine

ARG VERSION

WORKDIR /lnbits

ENV QUART_APP=lnbits.app:create_app()
ENV QUART_ENV=development
ENV QUART_DEBUG=true
ENV HOST=0.0.0.0
ENV PORT=5000

RUN apk add -u build-base linux-headers wget \
&&  wget -c https://github.com/lnbits/lnbits/archive/$VERSION.tar.gz -O - | tar -xz --strip-components=1 \
&&  python3 -m venv venv \
&&  ./venv/bin/pip install --upgrade pip \
&&  ./venv/bin/pip install wheel setuptools \
&&  ./venv/bin/pip install -r requirements.txt \
&&  ./venv/bin/pip install purerpc lndgrpc \
&&  ./venv/bin/pip install pylightning


COPY entrypoint.sh /bin/entrypoint.sh
COPY .env /lnbits/.env

RUN chmod +x /bin/entrypoint.sh

EXPOSE ${PORT}

ENTRYPOINT ["sh", "/bin/entrypoint.sh"]
