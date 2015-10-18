require 'unit_helper'
require 'domain/book'

RSpec.describe Domain::Book do
  let(:book) { Domain::Book.new(book_record) }
  let(:book_record) { double(:book_record, finished?: finished) }

  describe "#finished?" do
    context "when book is not yet finished" do
      let(:finished) { false }

      specify "is false" do
        expect(book.finished?).to be false
      end
    end

    context "when book is finished" do
      let(:finished) { true }
      specify "is false" do 
        expect(book.finished?).to be true
      end
    end
  end
end


