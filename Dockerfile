FROM bigsmall/node:4.6.2

# Install our app
RUN mkdir -p /var/app
WORKDIR /var/app

COPY bundle .

# install dependencies
RUN (cd programs/server && npm install -q )

# Copy package.json for NPM start
COPY package.json /var/app

# Expose ports and run
ENV PORT 80
EXPOSE 80

# This will be passed as parameter to NPM
CMD ["start"]
