class RenameTitlToTitleInComments < ActiveRecord::Migration[7.2]
  def change
    rename_column :comments, :titl, :title
  end
end
