FROM alpine:3.12.0 AS builder

# Install necessary software
RUN apk add --update-cache \
  gimp \
  make \
  nodejs \
  nodejs-npm
RUN npm install --global coffeescript@2.3.1

WORKDIR /root/project
COPY . /root/project

RUN make

FROM nginx:1.15.2-alpine
COPY --from=builder /root/project/build/index.html /usr/share/nginx/html/
COPY --from=builder /root/project/build/game.js /usr/share/nginx/html/
COPY --from=builder /root/project/build/gfx.png /usr/share/nginx/html/
