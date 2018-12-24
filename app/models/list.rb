class List < ActiveRecord::Base
  belongs_to :user
  validates :movie, presence: true
end
