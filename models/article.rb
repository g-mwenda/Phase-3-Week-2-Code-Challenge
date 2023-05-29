class Article
    attr_accessor :title

    @@articles = []

    def initialize(title, author, magazine)
        @title = title
        @author = author
        @magazine = magazine
        @@articles << self
    end

    def self.all
        @@articles
    end

    def author
        @author
    end

    def magazine
        @magazine
    end
end

