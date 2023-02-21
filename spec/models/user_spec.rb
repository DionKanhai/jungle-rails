require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
        email: "TEST@TEST.com",
        first_name: "Billy",
        last_name: "Jean",
        password: "lightbulb123",
        password_confirmation: "lightbulb123"
      )
}

  it "is valid with the valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an first name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an last name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an password confirmation" do
    subject.password_confirmation = nil
    expect(subject).to_not be_valid
  end
end

