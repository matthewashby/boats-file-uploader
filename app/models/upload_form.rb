# == Schema Information
#
# Table name: upload_forms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  comment    :string(255)
#  boat_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'zip'

class UploadForm < ApplicationRecord
  belongs_to :boat, optional: true

  has_many :files, class_name: 'UploadedFile', foreign_key: :form_id, dependent: :destroy

  validates :name, presence: true
  validates :comment, presence: true, if: -> { boat.blank? }

  def self.auto_remove_old_files
    UploadForm.where('created_at <= ?', 1.month.ago).destroy_all
  end

  def make_zip_file
    zipfile_name = File.join("#{Rails.root}/public/uploads/uploaded_file/", "#{self.id}.zip")
    File.delete(zipfile_name) if File.exist?(zipfile_name)

    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      files.each do |file|
        zipfile.add(file.file.url.split("/").last, file.file.path)
      end

      zipfile.get_output_stream("success") { |f| f.write "All done successfully" }
    end
  end
end
