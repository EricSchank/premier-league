# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Team.create(data_id: 66, name: 'Manchester United FC', short_name: 'ManU', crest: 'http://upload.wikimedia.org/wikipedia/de/d/da/Manchester_United_FC.svg', code: 'MUFC', value: 377250000, currency: '€')
Team.create(data_id: 61, name: 'Chelsea FC', short_name: 'Chelsea', crest: 'http://upload.wikimedia.org/wikipedia/de/5/5c/Chelsea_crest.svg', code: 'CFC', value: 531750000, currency: '€')
Team.create(data_id: 57, name: 'Arsenal FC', short_name: 'Arsenal', crest: 'http://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg', code: 'AFC', value: 402000000, currency: '€')
