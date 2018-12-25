require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(name: "Ahmed Karim", email: "ahmedkarim@gmail.com",
                      password: "foobar", password_confirmation: "foobar")
  }

    it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a password different than password confirmation" do
    subject.password = "barfoo"
    subject.password_confirmation = "foobar"
    expect(subject).to_not be_valid
  end

  it "is not valid with a short password" do
    subject.password = "ba"
    expect(subject).to_not be_valid
  end

  it "is with default activated value equals false" do
    expect(subject.activated).to eq(false)
  end

  it "is not valid with a wrong email format" do
    subject.email = "karimblabla"
    expect(subject).to_not be_valid
  end
  it { should have_many(:lists) }
end
