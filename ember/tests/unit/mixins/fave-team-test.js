import Ember from 'ember';
import FaveTeamMixin from '../../../mixins/fave-team';
import { module, test } from 'qunit';

module('Unit | Mixin | fave team');

// Replace this with your real tests.
test('it works', function(assert) {
  var FaveTeamObject = Ember.Object.extend(FaveTeamMixin);
  var subject = FaveTeamObject.create();
  assert.ok(subject);
});
