import Ember from 'ember';
import FaveTeam from '../mixins/fave-team';

export default Ember.Controller.extend(FaveTeam, {
  actions: {
    goToTeam(team) {
      this.transitionToRoute('team', team);
    }
  }
});
