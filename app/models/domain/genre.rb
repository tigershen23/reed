require 'active_support'
require 'active_support/core_ext'

module Domain
  # This class encapsulates the business logic, and only the business logic, for the Genre model
  class Genre
    extend Forwardable

    def initialize(record)
      @record = record
    end

    def_delegators :@record,
                   :books,
                   :id,
                   :name
  end
end

