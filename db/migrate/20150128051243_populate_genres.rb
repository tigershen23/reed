class PopulateGenres < ActiveRecord::Migration
  def up
    genres = []
    now = Time.now
    GenreList::GENRES.each do |genre|
      genres.push "( '#{genre}', '#{now}', '#{now}' )"
    end

    sql = "INSERT INTO genres (name, created_at, updated_at)
          VALUES #{genres.join(', ')}"

    ActiveRecord::Base.connection.execute sql
  end

  def down
    Genre.destroy_all
  end
end

module GenreList
  GENRES = %w{
                Biography
                Business
                Children
                Classics
                Comics
                Fantasy
                Fiction
                Historical\ Fiction
                Humor\ And\ Comedy
                Memoir
                Music
                Mystery
                Non\ Fiction
                Religion
                Romance
                Science\ Fiction
                Self Help
                Sports
                Thriller
                Young\ Adult
              }
end
