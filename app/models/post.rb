class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}

    validate :is_clickbait

    CLICKBAIT = [
        "Won't Believe",
        "Secret",
        "Top",
        "Guess"
    ]

    def is_clickbait
        # CLICKBAIT.any? {|clickbait| self.title.include?(clickbait)}
        if self.title && !CLICKBAIT.any? {|clickbait| self.title.include?(clickbait)}
            errors.add(:title, "must be clickbait!")
        end
    end
end
