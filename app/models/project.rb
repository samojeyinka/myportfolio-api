class Project < ApplicationRecord

    before_validation :strip_whitespace

    validates :name, presence: true, length:{maximum: 100}
    validates :description, presence: true, length:{maximum: 140}
    validates :details, presence: true

    def strip_whitespace
        self.name = name.strip if name.present?
        self.description = description.strip if description.present?
        self.details = details.strip if details.present?
    end
end
