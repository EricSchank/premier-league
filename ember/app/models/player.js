import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  team: DS.belongsTo('team'),
  name: DS.attr('string'),
  position: DS.attr('string'),
  nationality: DS.attr('string'),
  currency: DS.attr('string'),
  value: DS.attr('number'),
  jerseyNumber: DS.attr('number'),
  birth: DS.attr('date'),
  contract: DS.attr('date'),
});
