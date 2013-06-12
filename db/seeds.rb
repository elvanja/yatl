# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'me@yatl.com', password: 'test123', password_confirmation: 'test123')
Task.create([
    {user: user, description: 'wake up'},
    {user: user, description: 'kiss family', priority: 10},
    {user: user, description: 'pet the dog'},
    {user: user, description: 'brush teeth'}
], :without_protection => true)

other_user = User.create(email: 'you@yatl.com', password: 'test123', password_confirmation: 'test123')
Task.create([
    {user: other_user, description: 'write to YATL admin how awesome the site is', priority: 100},
    {user: other_user, description: 'drink beer'}
], :without_protection => true)