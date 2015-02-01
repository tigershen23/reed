require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it "should require a title" do
      no_title = FactoryGirl.build(:book, :title => "")
      expect(no_title).to_not be_valid
    end

    it "should require an author" do
      no_author = FactoryGirl.build(:book, :author => "")
      expect(no_author).to_not be_valid
    end

    it "should require a description" do
      no_description = FactoryGirl.build(:book, :description => "")
      expect(no_description).to_not be_valid
    end

    it "should require an amazon_id" do
      no_amazon_id = FactoryGirl.build(:book, :amazon_id => "")
      expect(no_amazon_id).to_not be_valid
    end
  end
end
