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

RUN RAILS_ENV=production bundle exec rake assets:precompile

# Set "rails server -b 0.0.0.0" as the command to
# run when this container starts.
CMD ["bundle", "exec", "rails", "server", "-e", "production"]