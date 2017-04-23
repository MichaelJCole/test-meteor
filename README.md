# test-meteor Project

`test-meteor` is a scaffold and demo app for testing meteor projects.

## Test Commands

### npm test

- Runs these tests:  `[client,lib,server]/**/*.test.js`
- Results to command line
- For CircleCI (see circle.yml)

### ci.sh

- Runs these tests:  `[client,lib,server]/**/*.test.js`
- Results to command line
- For scripting

CircleCI (see circle.yml)

### test.sh

- Runs these tests:  `[client,lib,server]/**/*.test.js`
- Results to http://localhost:3002/
- For Development
- Watches for changes in code, then reruns all tests

### accept.sh

- Runs these tests: `tests/*.js`
- Results to command line
- For acceptance testing

### accept-watch.sh

- Runs these tests:  `tests/*.js`
- Results to command line
- For acceptance testing in development
- Watches for changes in code, then reruns tests flagged with @watch

## CircleCI

Follow their setup instructions to link your github repo

## Dev setup

For Linux or MacOS.  Windows users should use Linux, MacOS.

### Install Meteor and nvm

https://github.com/creationix/nvm

The appropriate node version is in .nvmrc file

```
nvm install
```

Then install meteor:

```
curl https://install.meteor.com/ | sh
```

### Install packages

```
npm install -g chimp
npm install
```

> Note: https://guide.meteor.com/testing.html#acceptance-testing recommends not installing chimp as package dependency

> Note: https://guide.meteor.com/testing.html#command-line ->  https://github.com/DispatchMe/meteor-mocha
