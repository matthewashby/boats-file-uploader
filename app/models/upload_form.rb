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
    UploadForm.where('created_at <= ?', 3.weeks.ago).find_each do |form|
      File.delete(form.zip_path)
      form.destroy
    end
  end

  def self.send_mail
    UploadForm.where('created_at <= ?', 10.minutes.ago).where(sent_at: nil, zip_ready: true).each(&:send_mail)
  end

  def make_zip_file
    File.delete(zip_path) if File.exist?(zip_path)

    Zip::File.open(zip_path, Zip::File::CREATE) do |zipfile|
      files.each do |file|
        zipfile.add(file.file.url.split("/").last, file.file.path)
      end
    end

    update_columns(zip_ready: true)
  end

  def send_mail
    return unless zip_ready?
    return if sent_at?

    UserMailer.notify_new_file_upload(self).deliver_now
    update_columns(sent_at: Time.current)
  end

  def zip_path
    File.join("#{Rails.root}/public/uploads/uploaded_file/", "#{self.id}.zip")
  end

  def zip_url
    "https://uploads.boats.co.uk/uploads/uploaded_file/#{self.id}.zip"
  end
end
