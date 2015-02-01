require 'unit_helper'
require 'domain/book'

RSpec.describe Domain::Book do
  let(:book) { described_class.new(book_record)}
  let(:book_record) { double(
                          finished_on: finished_on
  ) }
  let(:genre_factory) { double }

  let(:finished_on) { double }

  describe "#finished?" do
    context "when book is not yet finished" do
      let(:finished_on) { nil }
      specify { expect(book.finished?).to be false }
    end

    context "when book is finished" do
      let(:finished_on) { double }

      specify { expect(book.finished?).to be true }
    end
  end
end


