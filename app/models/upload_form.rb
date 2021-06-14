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

  after_commit :make_zip_file, on: :create

  def self.auto_remove_old_files
    UploadForm.where('created_at <= ?', 1.month.ago).destroy_all
  end

  def make_zip_file
    File.delete(zip_path) if File.exist?(zip_path)

    Zip::File.open(zip_path, Zip::File::CREATE) do |zipfile|
      files.each do |file|
        zipfile.add(file.file.url.split("/").last, file.file.path)
      end
    end

    sleep(2)
    UserMailer.notify_new_file_upload(self).deliver_later
  end

  def zip_path
    File.join("#{Rails.root}/public/uploads/uploaded_file/", "#{self.id}.zip")
  end

  def zip_url
    "https://uploads.boats.co.uk/uploads/uploaded_file/#{self.id}.zip"
  end
end
