class AddTextPdfToEventfile < ActiveRecord::Migration
  def change
    add_column :eventfiles, :pdf_text, :text
  end
end
