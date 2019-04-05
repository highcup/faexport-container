FROM ruby:2.6.2-alpine3.9

#install bundler
RUN gem install bundler
#install packages to build and redis
RUN apk --no-cache --update add alpine-sdk redis
#clone the faexport repo
RUN git clone https://github.com/boothale/faexport.git
#Add entrypoint.sh
ADD ./entrypoint.sh /faexport/entrypoint.sh
RUN chmod +x /faexport/entrypoint.sh
#move to the faexport folder and install ruby dependencies
RUN cd faexport && bundle install
WORKDIR /faexport

ENTRYPOINT ["sh","entrypoint.sh"]