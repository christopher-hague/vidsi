class Video < ApplicationRecord
  belongs_to :content_provider
  has_many :streams
end
