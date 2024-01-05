class Project < ApplicationRecord
    before_save :add_https_to_links

    before_validation :strip_whitespace

    has_one_attached :image
    validates :name, presence: true, length:{maximum: 100}
    validates :description, presence: true, length:{maximum: 140}
    validates :details, presence: true

    def strip_whitespace
        self.name = name.strip if name.present?
        self.description = description.strip if description.present?
        self.details = details.strip if details.present?
    end

     #For image
     def image_url
      Rails.application.routes.url_helpers.url_for(image) if image.attached?
     end

    private

    def add_https_to_links
        link_attributes = %i[live_preview_link source_code_link]
    
        link_attributes.each do |attribute|
          if send(attribute).present? && !send(attribute).start_with?('http://', 'https://')
            send("#{attribute}=", "https://#{send(attribute)}")
          end
        end
      end

end
