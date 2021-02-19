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

class UploadForm < ApplicationRecord
  belongs_to :boat

  has_many :files, class_name: 'UploadedFile', foreign_key: :form_id, dependent: :destroy

  validates :name, presence: true
  validates :comment, presence: true, unless: :boat_id?

  def self.auto_remove_old_files
    UploadForm.where('created_at <= ?', 1.month.ago).destroy_all
  end
end
