class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.map do |reader|
            reader.email
        end.join(";")
    end

    def self.most_popular
        # self.all.sort do |mag_a, mag_b|
        #     mag_a.readers.count <=> mag_b.readers.count
        # end.first

        self.all.sort_by { |mag| mag.subscriptions.count }.reverse.first
    end

    def self.print_info
        self.all.map do |mag|
            "#{mag.title} has #{mag.subscriptions.count} subscriptions"
        end
    end

end