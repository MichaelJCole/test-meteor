import { FlowRouter } from 'meteor/kadira:flow-router';
import { BlazeLayout } from 'meteor/kadira:blaze-layout';

// Set up all routes in the app
FlowRouter.route('/', {
  name: 'App.home',
  action() {
    BlazeLayout.render('body', { main: 'page_home' });
  },
});

FlowRouter.notFound = {
  action() {
    BlazeLayout.render('body', { main: 'page_notFound' });
  },
};
