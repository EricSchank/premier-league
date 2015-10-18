import Ember from 'ember';

export function initialize(/* container, application */) {
  Ember.Inflector.inflector.irregular('team-fave', 'team-faves');
}

export default {
  name: 'inflections',
  initialize: initialize
};
