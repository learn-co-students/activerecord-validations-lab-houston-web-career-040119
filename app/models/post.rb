class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, acceptance: {accept:['Fiction','Non-Fiction']}
  validate :clickbait?

  def clickbait?
    must_have = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    if must_have.none? {|pattern| pattern.match title}
      errors.add(:title, "Must be clickbait")
    end
  end


end
