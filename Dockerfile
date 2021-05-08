# respect for https://docs.docker.com/samples/rails/
FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y curl postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g yarn

WORKDIR /myapp
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN gem install bundler:2.1.4
RUN bundle install
RUN yarn install --check-files

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD rails server -p 3000 -b '0.0.0.0'
