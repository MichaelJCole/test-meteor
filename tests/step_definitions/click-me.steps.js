'use strict';

/*

// CucumberJS Steps API and LifeCycle
https://github.com/cucumber/cucumber-js/blob/1.x/docs/support_files/api_reference.md

// General testing, use WebdriverIO API
Chimp makes a client: https://chimp.readme.io/docs/cheat-sheet
On which you can use this API: http://webdriver.io/api.html

// Meteor Specific

// From test, call a method via ddp
var result = server.call('fixtures/resetMyApp');

// From test, call a method with args
var result = server.apply('myMethodWithArgs', [argsArray]);

// From test, run a function inside server  (xolvio:backdoor)
var getSetting = function (setting) {
  // I run inside the Meteor instance
  return Meteor.settings[setting];
};
var mySetting = server.execute(getSetting, 'mySetting');
console.log(mySetting);

// From test, run code in client

var getUserProperty = function (property) {
  var u = Meteor.user();
  return u || u[property];
};
client.url('http://localhost:3000'); // goto home page
var userName = client.execute(getUserProperty, 'profile').value;
console.log(profile.userName);

*/

module.exports = function() {

  this.Given(/^I goto page "([^"]*)"$/, function (url) {
    // Write code here that turns the phrase above into concrete actions
    client.url(process.env.TEST_URL + url);  // synchronous?
  });

  this.Then(/^Page has text "([^"]*)"$/, function (text) {
    expect(client.getText('body').includes(text));
  });

  this.Then(/^Page has link "([^"]*)" to "([^"]*)"$/, function (text, url) {
    expect(true).toBe(client.execute(function(text,url) {
      return $('a:contains('+text+')[href="'+url+'"]').length > 0;
    },text,url).value);
  });

  this.When(/^I click "([^"]*)"$/, function (selector) {
    client.click(selector);
  });

  this.When(/^I type into "([^"]*)" "([^"]*)"$/, function (selector, text) {
    client.setValue(selector, text);
  });

  this.When(/^I submit form "([^"]*)"$/, function (selector) {
    client.submitForm(selector);
  });

};
