# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


categories = ['Art','Comics', 'Crafts', 'Dance', 'Design', 'Fashion', 'Film & Video', 'Food', 'Games', 'Journalism', 'Music', 'Photography', 'Publishing', 'Technology', 'Theatre']

categories.each do |i|
	p = Project.new(title: "#{i}",funding_goal: "1000",end_date: 1.day.from_now.to_datetime, start_date: DateTime.now ,description:"#{i}",picture_url:"http://robohash.org/#{i}", category:"#{i}",long_description:"#{i}", owner_id: User.last.id)
  p.save
end
