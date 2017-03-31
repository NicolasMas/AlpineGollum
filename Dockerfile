FROM ruby:alpine
MAINTAINER  Nicolas Mas <nicolasmas@gmail.com>

# Building the environement
RUN apk add --update --virtual build-deps build-base icu-dev \
    && apk add --update icu-libs git bash cmake

# Building Gollum
RUN git clone https://github.com/gollum/gollum.git /usr/ \
    && cd /usr/gollum \
    && git checkout v4.1.0

RUN cd /usr/gollum \
    && bundle install \
    && rake build

RUN gem install github-linguist \
    && gem install --no-document pkg/gollum*.gem


# Gollun run configuration
WORKDIR /wiki
EXPOSE 4567
