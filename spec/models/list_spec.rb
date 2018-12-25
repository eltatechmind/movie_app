require 'rails_helper'

RSpec.describe List, type: :model do
  subject {
    List.new(user_id: 5, movie: 59739)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a movie" do
    subject.movie = nil
    expect(subject).to_not be_valid
  end
  it { should belong_to(:user) }
end
