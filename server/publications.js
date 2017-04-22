// All links-related publications

import { Meteor } from 'meteor/meteor';

Meteor.publish('links.all', function () {
  return Links.find();
});
