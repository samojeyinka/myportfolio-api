module Api 
    module V1 
      class ProjectSerializer < ActiveModel::Serializer
         attributes :id, :name, :description, :details, :created_at, :updated_at
      end
    end
  end
  
  
    