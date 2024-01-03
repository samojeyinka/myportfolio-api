module Api 
    module V1 
      class ProjectSerializer < ActiveModel::Serializer
         attributes :id, :name, :description, :details, :live_preview_link, :source_code_link, :created_at, :updated_at
      end
    end
  end
  
  
    