class Quote < ApplicationRecord
  validates :author, :content, presence: true
end
