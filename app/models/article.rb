class Article < ApplicationRecord
    before_validation :strip_whitespace

    validates :title, presence: true
    validates :content, presence:true

    def strip_whitespace
        self.title = title.strip
        self.content = content.strip
    end

end
