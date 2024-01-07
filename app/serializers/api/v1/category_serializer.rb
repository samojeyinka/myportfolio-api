module Api 
    module V1 
      class CategorySerializer < ActiveModel::Serializer
         attributes :id, :name, :description, :created_at, :updated_at
      end
      
    end
  end
  
  
    