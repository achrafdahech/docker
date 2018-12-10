# Pull node image
FROM node:10.14.1

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies and bundle app source
COPY api/package.json /usr/src/app/package.json
COPY api/package-lock.json /usr/src/app/package-lock.json

COPY api/src /usr/src/app/src
RUN cd /usr/src/app; npm install

EXPOSE 9000
ENV PORT 9000

CMD /bin/bash -c "npm start"
