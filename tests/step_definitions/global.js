module.exports = function() {

  // Before Every Scenario
  this.Before(function () {
    // Passed from accept.sh
    //console.log(process.env.TEST_URL);

    // This is a promise to goto app and logout
    return client
      // http://webdriver.io/api/protocol/url.html
      .url(process.env.TEST_URL)
      // http://webdriver.io/api/protocol/execute.html
      .execute(function() {
        if (Meteor.logout) Meteor.logout();  // meteor add accounts-password
      });
  });

  // After Every Scenario
  this.After(function() {});


  this.World = function() {
    return {
      special: 'sauce',
    };
  };
};
