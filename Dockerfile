FROM ruby:2.7.1
WORKDIR /app
COPY . /app

RUN bundle install --deployment

# Install Yarn.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Run yarn install to install JavaScript dependencies.
RUN yarn install --check-files

ENV RAILS_ENV=production
RUN bundle exec rake assets:precompile

ENV RAILS_SERVE_STATIC_FILES=true

CMD ["bundle", "exec", "rails", "server"]
