class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait
  
  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0,9]*/i,
    /Guess/
  ]
  
  def is_clickbait
    if CLICKBAIT_PATTERNS.none? {|pattern| pattern.match title}
      errors.add(:title, "must be clickbait")
    end
  end
  
  #t.string   "title"
  #t.text     "content"
  #t.text     "summary"
  #t.string   "category"
end
