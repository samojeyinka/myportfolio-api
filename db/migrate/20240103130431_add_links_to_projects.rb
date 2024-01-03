class AddLinksToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :live_preview_link, :string
    add_column :projects, :source_code_link, :string
  end
end
