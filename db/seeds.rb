# Don't need seed data for now

# Book.destroy_all
#
# r = Reader.create
#
# b1 = Book.new(
#   title: "Hyperion",
#   author: "Dan Simmons",
#   description: %q{Probably my favorite science fiction book (and series) I've ever read. Hyperion is written in a style similar
#               to The Canterbury Tales, in which a series of stories are told by the main characters. Each story is a gem in
#               itself, but alude to the larger storyline. The scope of the story is ambitious - spanning time, planets religion
#                and love.},
#   amazon_id: "0553283685",
#   rating: 5,
#   finished_on: 10.days.ago,
#   genres: [Genre.first],
#   reader: r
# )
#
# b2 = Book.new(
#   title: "Jony Ive: The Genius Behind Apple's Greatest Products",
#   author: "Leander Kahney",
#   description: %q{Even though I respect Ive, I felt this biography only hit skin deep. It went over all the major events in
#               his life, his passion for design, awards he achieved -- but that's really it. I dont't feel I know him anymore
#               than before reading this.},
#   amazon_id: "159184617X",
#   rating: 4,
#   finished_on: 1.day.ago,
#   genres: [Genre.first],
#   reader: r
# )
#
# b3 = Book.new(
#   title: "Mindstorms",
#   author: "Seymour A. Papert",
#   description: %q{Although this book focuses on the cognitive advantages to having children use technology from an early age,
#               it is also an in depth look at how people can learn for themseves. As someone who was often distracted and bored
#               at times during school, Mindstorms highlights some of the reasoning behind that feeling and what we can do as
#               teachers to help minimize it.},
#   amazon_id: "0465046746",
#   rating: 1,
#   finished_on: nil,
#   genres: [Genre.last],
#   reader: r
# )
#
# books = [b1, b2, b3]
#
# book_repository = Domain::DomainFactory.new.book_repository
# domain_books = book_repository.wrap_domain_books(books)
# domain_books.each { |b| book_repository.persist(b) }
#
# p "Created #{Book.count} books"
