module Api 
    module V1 
      class ProjectSerializer 
        include JSONAPI::Serializer
         attributes :id, :name, :description, :details,:image, :image_url ,:live_preview_link, :source_code_link, :created_at, :updated_at
      end
    end
  end
  
  
    