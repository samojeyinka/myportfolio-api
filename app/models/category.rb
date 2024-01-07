class Category < ApplicationRecord

    before_validation :strip_whitespace

    has_many :project_categories
    has_many :project, through: :project_categories
    
    validates :name, presence: true, length:{minimum: 3, maximum: 25},
                            uniqueness: { case_sensitive: false }
         
    validates :description, presence: true, length:{minimum: 3, maximum: 125}


    def strip_whitespace
        self.name = name.strip
        self.description = description.strip
    end
end
