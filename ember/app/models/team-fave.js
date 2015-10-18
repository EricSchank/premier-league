import DS from 'ember-data';

export default DS.Model.extend({
  team: DS.belongsTo('team'),
  user_id: DS.attr('number')
});
