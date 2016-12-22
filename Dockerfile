# docker build -t "elix/world" .
FROM elarasu/weave-ubuntu
ENV LANG en
ENV PORT 8080

RUN apt-get update \
  && curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
  && apt-get install -y nodejs nodejs-legacy npm build-essential
RUN apt-get install -y nodejs-legacy 

RUN mkdir -p /deploy/elix
WORKDIR /deploy/elix

# copy and install application
COPY . /deploy/elix/
RUN npm install

# cleanup
RUN rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

EXPOSE ${PORT}
CMD [ "npm", "start" ]

