require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, last name, email, and password" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user = FactoryGirl.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end
  it "is invalid without a last name" do
    user = FactoryGirl.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end
  it "is invalid without an email address" do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:user)
    user = FactoryGirl.build(:user)
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  it "returns a user's full name as a string" do
    user = FactoryGirl.build(:user)
    expect(user.name).to eq "Fred Flintstone"
  end
end
