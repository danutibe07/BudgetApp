class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :records

  validates :name, presence: true, uniqueness: true
end
