class Subscription < ApplicationRecord
  belongs_to :subscription_tier
  has_and_belongs_to_many :subscribers
end
