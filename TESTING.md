# Test Commands

## ci.sh

Runs these tests:  `[client,lib,server]/**/*.test.js`
Results to command line
For CircleCI (see circle.yml)

## test.sh

Runs these tests:  `[client,lib,server]/**/*.test.js`
Results to http://localhost:3002/
For Development
Watches for changes in code, then reruns all tests

## accept.sh

Runs these tests: `tests/*.js`
Results to command line
For acceptance testing

## accept-watch.sh

Runs these tests:  `tests/*.js`
Results to command line
For acceptance testing in development
Watches for changes in code, then reruns tests flagged with @watch
