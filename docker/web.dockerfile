# Pull node image
FROM node:10.14.1

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies and bundle app source
COPY web/package.json /usr/src/app/package.json
COPY web/package-lock.json /usr/src/app/package-lock.json
COPY web/src /usr/src/app/src
COPY web/public /usr/src/app/public

RUN cd /usr/src/app; npm install

EXPOSE 3000
ENV PORT 9002
CMD /bin/bash -c "npm run build"
CMD /bin/bash -c "npm start"
