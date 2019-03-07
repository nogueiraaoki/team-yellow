FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs

RUN mkdir /webapp
WORKDIR /webapp

# ENV RAILS_ENV='production'
# ENV RACK_ENV='production'
# ENV SECRET_KEY_BASE=fdc119cb2fc72098265aba696eb033a4af2a1b254240d076ed752a59aee1952e81169278c82b4273c2ca1aaa626c96aec180973664e30ff321d93f4da42fefe3

ADD Gemfile /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock

RUN bundle install
# RUN bundle install --jobs 20 --retry 5 --without development test

ADD . /webapp

# RUN RAILS_ENV=production bundle exec rake assets:precompile

RUN mkdir -p tmp/sockets