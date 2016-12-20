FROM ruby:2.1.5

# Install Rails (and its dependencies)
RUN apt-get update && apt-get install -y --no-install-recommends \
  libbz2-dev \
  libc6-dev \
  libcurl4-openssl-dev \
  libdb-dev \
  libevent-dev \
  libffi-dev \
  libgeoip-dev \
  libglib2.0-dev \
  libjpeg-dev \
  liblzma-dev \
  libmagickcore-dev \
  libmagickwand-dev \
  libmysqlclient-dev \
  libncurses-dev \
  libpng-dev \
  libpq-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libtool \
  libwebp-dev \
  libxml2-dev \
  libxslt-dev \
  libyaml-dev \
  libxslt1-dev \
  libqt4-webkit \
  libqt4-dev \
  xvfb \
  nodejs \
  mysql-client \
  postgresql-client \
  sqlite3 \
  && rm -rf /var/lib/apt/lists/*

# Specify the version of Rails to install
ENV RAILS_VERSION 3.2.13
RUN gem install rails --version "$RAILS_VERSION"




#Start: Main Repository
ADD ["./rgt", "/rgt"]
WORKDIR /rgt
RUN bundle install
#End

WORKDIR /rgt


# Open up ports on the server
EXPOSE 3000

# Command to start the app
CMD rails server -b 0.0.0.0

