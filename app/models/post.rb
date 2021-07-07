class Post < ActiveRecord::Base
    # validates :post_id, presence: true
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validates :title, format: { with: /\b(Won't Believe|Secret|Guess|Top \d+)\b/}


end
