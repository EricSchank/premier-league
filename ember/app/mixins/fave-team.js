import Ember from 'ember';

export default Ember.Mixin.create({
  actions: {
    faveTeam(team) {
      let user_id = 1;
      let store = team.get('store');
      let fave = team.get('teamFaves').filter(function(item) {
        return item.get('team.id') === team.get('id');
      });
      if(fave.get('length') > 0) {
        let item = fave.get('firstObject');
        item.destroyRecord();
      } else {
        fave = store.createRecord('team-fave', {
          user_id: user_id,
          team: team
        });
        fave.save();
      }
    }
  }
});
