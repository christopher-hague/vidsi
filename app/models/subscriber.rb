class Subscriber < ApplicationRecord
  has_many :invoices
  has_many :streams
  has_many :credit_cards
  has_and_belongs_to_many :subscriptions
end
