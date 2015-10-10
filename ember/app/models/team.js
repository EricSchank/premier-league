import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  shortName: DS.attr('string'),
  code: DS.attr('string'),
  currency: DS.attr('string'),
  crest: DS.attr('string'),
  value: DS.attr('number')
});
