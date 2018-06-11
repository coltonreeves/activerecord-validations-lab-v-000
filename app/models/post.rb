class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validate :clickbait

  def clickbait
    necessary_phrases = [/Won't Believe/i,/Secret/i,/Top\s\d/i,/Guess/i]

    errors.add(:title, "must be clickbait") if necessary_phrases.none? {|t| t.match title}
  end
end
