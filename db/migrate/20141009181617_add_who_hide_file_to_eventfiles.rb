class AddWhoHideFileToEventfiles < ActiveRecord::Migration
  def change
    add_column :eventfiles, :upload_file_name, :string
    add_column :eventfiles, :upload_content_type, :string
    add_column :eventfiles, :upload_file_size, :integer
    add_column :eventfiles, :upload_updated_at, :date
    add_column :eventfiles, :who_hide_file, :string
  end
end
