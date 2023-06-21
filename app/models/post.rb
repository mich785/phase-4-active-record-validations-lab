class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"], message: "is not included in the list" }
    validate :clickbait_title
  
    private
  
    def clickbait_title
      clickbait_keywords = ["Won't Believe", "Secret", "Top", "Guess"]
      if title.present? && !clickbait_keywords.any? { |keyword| title.include?(keyword) }
        errors.add(:title, "should be clickbait-y")
      end
    end
  end
  