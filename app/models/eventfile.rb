class Eventfile < ActiveRecord::Base
  attr_accessible :event_id, :hide_reason, :upload, :uploader, :visible, :pdf_text
  belongs_to :user
  mount_uploader :upload, EventfileUploader

  before_save :update_asset_attributes, :extract_text_from_pdf

  def extract_text_from_pdf
    `pdftotext #{Rails.root}/public#{self.upload_url}`
    self.pdf_text = File.read "#{Rails.root}/public#{self.upload_url.gsub('.pdf','.txt')}"
  end


  def update_asset_attributes
    if upload.present? && upload_changed?
      self.upload_content_type = upload.file.content_type
      self.upload_file_size = upload.file.size
    end
  end

  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
        "id" => read_attribute(:id),
        "name" => read_attribute(:upload),
        "size" => read_attribute(:upload_file_size),
        "visible" => read_attribute(:visible),
        "event_id" => read_attribute(:event_id),
        "user" => read_attribute(:uploader),
        "url" => upload_url,
        "delete_url" => eventfile_path(self),
        "texto" => read_attribute(:pdf_text),
        "delete_type" => "DELETE"
    }
  end
end
