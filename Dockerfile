FROM ruby:3.3-slim AS base

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      libyaml-dev \
      curl \
      git \
      nodejs \
      npm && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

COPY . .

RUN npm install -g yarn 2>/dev/null || true

EXPOSE 3000

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
