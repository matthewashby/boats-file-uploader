# == Schema Information
#
# Table name: uploaded_files
#
#  id         :integer          not null, primary key
#  file       :string(255)
#  form_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UploadedFile < ApplicationRecord
  mount_uploader :file, UploadFileUploader

  def self.remove_unattached_file
    UploadedFile.where(form_id: nil).destroy_all
  end
end
