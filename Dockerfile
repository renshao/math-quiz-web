FROM ruby:2.7.7
WORKDIR /app
COPY . /app

RUN bundle install --deployment

ENV RAILS_ENV=production
RUN bundle exec rake assets:precompile

ENV RAILS_SERVE_STATIC_FILES=true

CMD ["bundle", "exec", "rails", "server"]
