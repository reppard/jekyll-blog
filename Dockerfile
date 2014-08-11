FROM ubuntu

EXPOSE 80

RUN apt-get update
RUN apt-get install -y apache2 ruby ruby-dev build-essential
RUN gem install jekyll os therubyracer

ADD . /src/reppardwalker
WORKDIR /src/reppardwalker

RUN ruby deploy.rb

CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
