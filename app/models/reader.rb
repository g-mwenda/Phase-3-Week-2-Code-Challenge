class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions


  def subscribe(magazine, price)
    new_subscription = Subscription.find_or_create_by(magazine_id: magazine.id, price: price, reader_id: self.id)
    new_subscription
  end

  def total_subcription_price
    self.subscriptions.map {|sub| sub.price }.sum
  end

  def cancel_subscription(magazine)
    # binding.pry
    subscription = Subscription.find_by(reader_id: self.id, magazine_id: magazine.id)
   # subscription = self.subscriptions.exists?(magazine: magazine)
    if subscription
      subscriptions.destroy(subscription)
    end
  end
  
end

