class Magazine


attr_accessor :name, :category

@@all = []
def initialize(name, category)
  @name = name
  @category = category
  @@all << self
end

def self.all
  @@all
end

def contributors
  articles.collect { |a| a.author }.uniq
end

def self.find_by_name n
  @@all.find { |m| m.name == n }
end

def article_titles
  articles.collect { |m| m.title }
end

def contributing_authors
  contributors.filter {|a| articles.count {|b| b.author.name != a.name } > 2 }
  
end

private
def articles
  Article.all.select { |a| a.magazine.name == self.name }
end


 
end



