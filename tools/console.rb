require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end



author1 = Author.new("Allan Losenge")
author2 = Author.new("Seth Mwanzo")
author3 = Author.new("Kenny Dalgish")

magazine1 = Magazine.new("Design","Design ")
magazine2 = Magazine.new("Craft","Craft")
magazine3 = Magazine.new("Modelling","Modelling")

article1 = Article.new("NewTimes1",author1,magazine1)
article2 = Article.new("NewTimes2",author1,magazine2)


article5 = Article.new("NewTimes5",author2,magazine3)


# Find a magazine by name
magazine = Magazine.find_by_name("Outlook")

# Print some information
puts "Authors:"
Author.all.each do |author|
  puts "#{author.name} has written  #{author.magazines.count} magazines and topic areas are: #{author.topic_areas.join(", ")}"
end

puts "\nMagazines:"
Magazine.all.each do |magazine|
  puts "#{magazine.name} has #{magazine.contributors.count} contributors and article titles are: #{magazine.article_titles.join(", ")}"
end

puts "\nContributing authors for #{magazine.name}:"
magazine.contributing_authors.each do |author|
  puts "- #{author.name}"
end








binding.pry

0
