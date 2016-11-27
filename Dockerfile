FROM ruby:2.3.3-slim
RUN apt-get update && \
    apt-get install build-essential -y

RUN mkdir /app

COPY Gemfile      /app
COPY Gemfile.lock /app

WORKDIR /app

RUN bundle install --without development

COPY . /app

VOLUME /app/db

EXPOSE 3000

CMD RACK_ENV=production rackup -p 3000 -o 0.0.0.0
