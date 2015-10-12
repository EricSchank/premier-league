import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    goToTeam() {
      this.sendAction('goToTeam', this.get('item'));
    }
  }
});
