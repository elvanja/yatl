# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.create([
    {description: 'write to YATL admin how awesome the site is', priority: 100},
    {description: 'buy milk'},
    {description: 'kiss family', priority: 1_000_000},
    {description: 'enjoy a tea cup'},
    {description: 'have lunch'},
    {description: 'drink beer'}
], :without_protection => true)
