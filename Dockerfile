FROM ruby:alpine

RUN apk add --update --virtual build-deps build-base icu-dev \
    && apk add --update icu-libs git bash
