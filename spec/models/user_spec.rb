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


describe 'Validations' do
  it "is valid with the valid attributes" do
    expect(subject).to be_valid
    expect(subject.errors.full_messages).to be_empty
  end
  
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include("Email can't be blank")
  end
  
  it "is not valid without an first name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid without an last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid without an password" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid without an password confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "is not valid when password and password confirmation do not match" do
      subject.password_confirmation = "hello"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "is not valid when password is shorter than 5 characters" do
      subject.password = "abc"
      subject.password_confirmation = "abc"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    it "is valid when password is greater than 5 characters" do
      subject.password = "abcdef"
      subject.password_confirmation = "abcdef"
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end
  end



  describe '.authenticate_with_credentials' do
    
    it "authenticates when authentication credentials are valid" do
      @user = User.create(
        email: "TEST1@TEST.com",
        first_name: "Billy1",
        last_name: "Jean1",
        password: "LIGHTBULB",
        password_confirmation: "LIGHTBULB"
      )
      a = User.authenticate_with_credentials(@user.email, @user.password)
      expect(a.email).to eq("TEST1@TEST.com")
    end
  end
end

