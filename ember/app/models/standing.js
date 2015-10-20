import DS from 'ember-data';

export default DS.Model.extend({
  team: DS.belongsTo('team'),
  position: DS.attr('number'),
  playedGames: DS.attr('number'),
  points: DS.attr('number'),
  goals: DS.attr('number'),
  goalsAgainst: DS.attr('number'),
  goalDifference: DS.attr('number'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date')
});
