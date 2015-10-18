require 'active_support'
require 'active_support/core_ext'

module Domain
  # This class encapsulates the business logic, and only the business logic, for the Book model
  class Book
    extend Forwardable

    def initialize(record)
      @record = record
    end

    attr_reader :record
    private :record

    def_delegators :@record,
                   :amazon_id,
                   :assign_attributes,
                   :author,
                   :description,
                   :finished_on,
                   :genres,
                   :id,
                   :keywords,
                   :rating,
                   :reader_id,
                   :title,

    def finished?
      @record.finished_on.present?
    end

    def set_keywords
      @record.keywords = [title, author, description].map(&:downcase).join(' ')
    end
  end
end

