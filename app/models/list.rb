class List < ActiveRecord::Base
  belongs_to :user
  validates :movie, presence: true
    def to_s
    movie
    end
end
