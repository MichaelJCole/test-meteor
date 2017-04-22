// Tests for the behavior of the links collection
//
// https://guide.meteor.com/testing.html

import { assert } from 'meteor/practicalmeteor:chai';

import './links.js';
import '/imports/client-test-stubs.js';

if (Meteor.isServer) {
  describe('links collection', function () {
    it('insert correctly', function () {
      const linkId = Links.insert({
        title: 'meteor homepage',
        url: 'https://www.meteor.com',
      });
      const added = Links.find({ _id: linkId });
      const collectionName = added._getCollectionName();
      const count = added.count();

      assert.equal(collectionName, 'links');
      assert.equal(count, 1);
    });
  });
}
