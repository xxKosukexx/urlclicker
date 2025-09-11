FROM ruby:3.3.0

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential libpq-dev postgresql-client nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set path '/usr/local/bundle' && bundle install

COPY . .

EXPOSE 3000
CMD ["bash","-lc","bundle exec rails s -b 0.0.0.0 -p 3000"]