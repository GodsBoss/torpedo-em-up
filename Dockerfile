FROM alpine:3.7 AS builder

# Install necessary software
RUN apk add --update-cache \
  gimp \
  make \
  nodejs \
  nodejs-npm
RUN npm install --global coffeescript@2.3.1

COPY Makefile /root
WORKDIR /root

CMD ["make"]
