import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('teams');
  this.route('team', {path: '/team/:team_id'});
});

export default Router;
