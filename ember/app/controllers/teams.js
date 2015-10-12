import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    goToTeam(team) {
      this.transitionToRoute('team', team);
    }
  }
});
