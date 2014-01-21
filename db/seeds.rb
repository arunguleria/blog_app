# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#create author
["Sanjay thakur", "amit kumar", "sanjeev kumar", "mukul shukla"].each do|name|
  fname,lname = name.split(" ")
  a =Author.new(first_name: fname, last_name: lname, email: "#{fname}@#{lname.downcase}.com")
  if a.save
    print "successfully created student #{a.name} \n"
  else
    print "could not create student #{a.email} \n"
    print "Errors: #{a.errors.full_messages} \n"
  end
end



