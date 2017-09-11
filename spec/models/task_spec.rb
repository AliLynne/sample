require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with a title" do
    task = FactoryGirl.build(:task)
    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task = FactoryGirl.build(:task, title: nil)
    task.valid?
    expect(task.errors[:title]).to include("can't be blank")
  end
end
