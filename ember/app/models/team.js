import DS from 'ember-data';
import Ember from 'ember';

export default DS.Model.extend({
  players: DS.hasMany('player'),
  standing: DS.belongsTo('standing'),
  teamFaves: DS.hasMany('team-fave'),
  name: DS.attr('string'),
  shortName: DS.attr('string'),
  code: DS.attr('string'),
  currency: DS.attr('string'),
  crest: DS.attr('string'),
  value: DS.attr('number'),
  faveIcon: Ember.computed('teamFaves.[]', function() {
    let faveCount = this.get('teamFaves').get('length');
    if(faveCount > 0) {
      return 'favorite';
    } else {
      return 'favorite-border';
    }
  }),
  faveClass: Ember.computed('teamFaves.[]', function() {
    let faveCount = this.get('teamFaves').get('length');
    if(faveCount > 0) {
      return 'favorited';
    } else {
      return '';
    }
  })
});
