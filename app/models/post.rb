class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    
    validate :is_clickbait
    
    
    
    
    def is_clickbait
        
        click_bait = [/Won't Believe/i,/Secret/i,/Top \d/i,/Guess/i]
        
        unless click_bait.any? { |c| title.to_s.match?(c) }
            errors.add(:title, "needs click bait")
        end
    end


    
end
