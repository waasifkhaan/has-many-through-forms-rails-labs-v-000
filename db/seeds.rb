# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def create_posts
  i=0
  5.times do
    Post.new(title:"post#{i}", content: "asdfasdf#{i+1}")
    i= i+1 
  end
end

def create_users
  u=0
  5.times do
    User.new(username:"name#{u}", email: "#{u+1}@gmail.com")
    u= u+1 
  end
end

create_posts
create_users