class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
    validate :sufficiently_clickbaity

    def sufficiently_clickbaity
        unless title.blank?
            unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any? {|word| title.include?(word)}
                errors.add(:sufficiently_clickbaity, "Change a title")
            end
        end
    end
end
