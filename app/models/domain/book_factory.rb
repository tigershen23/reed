module Domain
  # Factories instantiate domain objects
  class BookFactory
    def create(record)
      Domain::Book.new(record)
    end

    def create_for(record, reader)
      record.reader = reader
      Domain::Book.new(record)
    end
  end
end

