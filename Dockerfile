FROM ruby:2.4.2-stretch

# Make sure decent fonts are installed. Thanks to http://www.dailylinuxnews.com/blog/2014/09/things-to-do-after-installing-debian-jessie/
RUN echo "deb http://ftp.us.debian.org/debian stretch main contrib" | tee -a /etc/apt/sources.list

RUN apt-get update -qqy
RUN apt-get install -y libfreetype6 libfontconfig1 libnss3-dev libgconf-2-4 build-essential
RUN apt-get install -y ttf-freefont ttf-mscorefonts-installer ttf-bitstream-vera ttf-dejavu ttf-liberation
# Make sure a recent (>6.7.7-10) version of ImageMagick is installed.
RUN apt-get install -y imagemagick
# install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qqy \
  && apt-get -qqy install google-chrome-stable \
  && rm /etc/apt/sources.list.d/google-chrome.list \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ADD . source/
WORKDIR source
RUN gem install bundler
RUN bundle install
RUN gem build wraith.gemspec
## TODO: get Version from src
RUN gem install --local wraith-4.2.1.chrome.docker.gem

ENTRYPOINT [ "wraith" ]
