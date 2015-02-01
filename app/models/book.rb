class Book < ActiveRecord::Base
  has_many :book_genres
  has_many :genres, through: :book_genres
  belongs_to :reader

  VALID_RATINGS = [1, 2, 3, 4, 5, nil]

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :amazon_id, presence: true

  scope :finished, ->{ where.not(finished_on: nil) }
  scope :recently_finished, ->{ where('finished_on > ?', 2.days.ago) }
  scope :search, ->(keyword){ includes(:genres).where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present?}
  scope :filter, ->(genre_name){ joins(:genres).where('genres.name = ?', genre_name) if genre_name.present?}
  scope :for_reader, ->(reader_id){ where(reader_id: reader_id) if reader_id.present? }
end
